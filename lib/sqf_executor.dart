import 'dart:io';

import 'package:sqflite/sqflite.dart';

import 'executor.dart';
import 'time_tracker.dart';
import 'model.dart';

class Executor extends ExecutorBase {
  final Database _db;
  static final _table = 'TestEntity';

  Executor._(this._db, TimeTracker tracker) : super(tracker);

  static Future<Executor> create(Directory dbDir, TimeTracker tracker) async =>
      Executor._(
          await openDatabase(dbDir.path, version: 1,
              onCreate: (Database db, int version) async {
            await db.execute('''
                  CREATE TABLE $_table ( 
                    id integer primary key autoincrement, 
                    tString text,
                    tInt int,
                    tLong int,
                    tDouble real)
                ''');
          }),
          tracker);

  Future<void> close() => _db.close();

  Future<void> insertMany(List<TestEntity> items) async =>
      tracker.trackAsync('insertMany', () async {
        final tx = _db.batch();
        items.forEach((object) => tx.insert(_table, toMap(object)));
        final ids = await tx.commit();
        for (int i = 0; i < ids.length; i++) {
          items[i].id = ids[i] as int;
        }
      });

  Future<void> updateMany(List<TestEntity> items) async =>
      tracker.trackAsync('updateMany', () async {
        final tx = _db.batch();
        items.forEach((object) => tx.update(_table, toMap(object),
            where: 'id = ?', whereArgs: [object.id]));
        await tx.commit();
      });

  Future<List<TestEntity>> _query(String where,
          [List<Object?>? whereArgs]) async =>
      (await _db.query(_table, where: where, whereArgs: whereArgs))
          .map(fromMap)
          .toList();

  Future<List<TestEntity?>> readMany(List<int> ids) => tracker.trackAsync(
      'readMany', () async => await _query('id in (${ids.join(',')})'));

  Future<void> removeMany(List<int> ids) async => tracker.trackAsync(
      'removeMany',
      () async => await _db.delete(_table, where: 'id in (${ids.join(',')})'));
}
