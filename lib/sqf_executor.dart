import 'dart:io';

import 'package:sqflite/sqflite.dart';

import 'executor.dart';
import 'time_tracker.dart';
import 'model.dart';

Map<String, dynamic> toMap(TestEntity object) => <String, dynamic>{
      'id': object.id,
      'tString': object.tString,
      'tInt': object.tInt,
      'tLong': object.tLong,
      'tDouble': object.tDouble
    };

TestEntity fromMap(Map<String, dynamic> map) => TestEntity.full(
    map['id'], map['tString'], map['tInt'], map['tLong'], map['tDouble']);

class Executor extends ExecutorBase {
  final Database _db;
  static final _table = 'TestEntity';

  Executor._(this._db, TimeTracker tracker) : super(tracker);

  static Future<Executor> create(Directory dbDir, TimeTracker tracker) async =>
      Executor._(
          await openDatabase(dbDir.path,
              version: 1,
              onCreate: (Database db, int version) async => await db.execute('''
create table $_table ( 
  id integer primary key autoincrement, 
  tString text,
  tInt int,
  tLong int,
  tDouble real)
''')),
          tracker);

  void close() => _db.close();

  Future<void> insertMany(List<TestEntity> items) async =>
      tracker.trackAsync('insertMany', () async {
        final tx = _db.batch();
        items.forEach((object) => tx.insert(_table, toMap(object)));
        final ids = await tx.commit();
        for (int i = 0; i < ids.length; i++) {
          items[i].id = ids[i];
        }
      });

  Future<void> updateMany(List<TestEntity> items) async =>
      tracker.trackAsync('updateMany', () async {
        final tx = _db.batch();
        items.forEach((object) => tx.update(_table, toMap(object),
            where: 'id = ?', whereArgs: [object.id]));
        await tx.commit();
      });

  Future<List<TestEntity>> readMany(List<int> ids) => tracker.trackAsync(
      'readMany',
      () async => (await _db.query(_table, where: 'id in (${ids.join(',')})'))
          .map(fromMap)
          .toList());

  Future<void> removeMany(List<int> ids) async => tracker.trackAsync(
      'removeMany',
      () async => await _db.delete(_table, where: 'id in (${ids.join(',')})'));
}
