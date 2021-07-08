import 'dart:io';

import 'package:sqflite/sqflite.dart';

import 'executor.dart';
import 'time_tracker.dart';
import 'model.dart';

class Executor<T extends TestEntity> extends ExecutorBase<T> {
  final Database _db;
  final String _table;

  final T Function(Map<String, dynamic>) _fromMap;

  Executor._(this._table, this._db, this._fromMap, TimeTracker tracker)
      : super(tracker);

  static Future<Executor<T>> create<T extends TestEntity>(
      Directory dbDir, TimeTracker tracker) async {
    final table = T.toString();
    return Executor._(
        table,
        await openDatabase(dbDir.path, version: 1,
            onCreate: (Database db, int version) async {
          await db.execute('''
                  CREATE TABLE $table (
                    id integer primary key autoincrement,
                    tString text,
                    tInt int,
                    tLong int,
                    tDouble real)
                ''');
          if (T == TestEntityIndexed) {
            await db.execute('CREATE INDEX ${table}_int ON $table(tInt)');
            await db.execute('CREATE INDEX ${table}_str ON $table(tString '
                '${ExecutorBase.caseSensitive ? '' : 'COLLATE NOCASE'})');
          }
        }),
        T == TestEntityPlain
            ? TestEntityPlain.fromMap as T Function(Map<String, dynamic>)
            : TestEntityIndexed.fromMap as T Function(Map<String, dynamic>),
        tracker);
  }

  Future<void> close() => _db.close();

  Future<void> insertMany(List<T> items) async =>
      tracker.trackAsync('insertMany', () async {
        final tx = _db.batch();
        items.forEach((object) => tx.insert(_table, TestEntity.toMap(object)));
        final ids = await tx.commit();
        for (int i = 0; i < ids.length; i++) {
          items[i].id = ids[i] as int;
        }
      });

  Future<void> updateMany(List<T> items) async =>
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

  Future<List<T?>> readMany(List<int> ids, [String? benchmarkQualifier]) =>
      tracker.trackAsync('readMany' + (benchmarkQualifier ?? ''),
          () async => await _query(_fromMap, 'id in (${ids.join(',')})'));

  Future<void> removeMany(List<int> ids) async => tracker.trackAsync(
      'removeMany',
      () async => await _db.delete(_table, where: 'id in (${ids.join(',')})'));

  Future<List<T>> queryStringEquals(String val) => tracker.trackAsync(
      'queryStringEquals',
      () async => await _query(_fromMap, 'tString = ?', [val]));
}
