import 'dart:io';

import 'package:benchapp/objectbox.g.dart';
import 'package:sqflite/sqflite.dart';

import 'executor.dart';
import 'time_tracker.dart';
import 'model.dart';

class Executor extends ExecutorBase {
  final Database _db;
  static final _table = 'TestEntity';
  static final _tableIndexed = 'TestEntityIndexed';

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
            await db.execute('''
                  CREATE TABLE $_tableIndexed ( 
                    id integer primary key autoincrement, 
                    tString text)
                ''');
            final indexArgs =
                ExecutorBase.caseSensitive ? '' : 'COLLATE NOCASE';
            await db.execute(
                'CREATE INDEX ${_tableIndexed}_str ON $_tableIndexed(tString $indexArgs)');
          }),
          tracker);

  Future<void> close() => _db.close();

  Future<void> insertMany(List<TestEntity> items) async =>
      tracker.trackAsync('insertMany', () async {
        final tx = _db.batch();
        items.forEach((object) => tx.insert(_table, TestEntity.toMap(object)));
        final ids = await tx.commit();
        for (int i = 0; i < ids.length; i++) {
          items[i].id = ids[i] as int;
        }
      });

  Future<void> insertManyIndexed(List<TestEntityIndexed> items) async =>
      tracker.trackAsync('insertManyIndexed', () async {
        final tx = _db.batch();
        items.forEach(
            (object) => tx.insert(_table, TestEntityIndexed.toMap(object)));
        final ids = await tx.commit();
        for (int i = 0; i < ids.length; i++) {
          items[i].id = ids[i] as int;
        }
      });

  Future<void> updateMany(List<TestEntity> items) async =>
      tracker.trackAsync('updateMany', () async {
        final tx = _db.batch();
        items.forEach((object) => tx.update(_table, TestEntity.toMap(object),
            where: 'id = ?', whereArgs: [object.id]));
        await tx.commit();
      });

  Future<List<T>> _query<T>(
          T Function(Map<String, dynamic>) reader, String where,
          [List<Object?>? whereArgs]) async =>
      (await _db.query(_table, where: where, whereArgs: whereArgs))
          .map(reader)
          .toList();

  Future<List<TestEntity?>> readMany(List<int> ids) => tracker.trackAsync(
      'readMany',
      () async => await _query(TestEntity.fromMap, 'id in (${ids.join(',')})'));

  Future<void> removeMany(List<int> ids) async => tracker.trackAsync(
      'removeMany',
      () async => await _db.delete(_table, where: 'id in (${ids.join(',')})'));

  Future<List<TestEntityIndexed>> queryStringEquals(String val) =>
      tracker.trackAsync(
          'queryStringEquals',
          () async =>
              await _query(TestEntityIndexed.fromMap, 'tString = ?', [val]));
}
