import 'dart:io';

import 'package:sqflite/sqflite.dart';

import 'executor.dart';
import 'model.dart';
import 'time_tracker.dart';

abstract class Executor<T extends TestEntity> extends ExecutorBase<T> {
  final Database _db;
  final String _table;

  final T Function(Map<String, dynamic>) _fromMap;

  Executor._(this._table, this._db, this._fromMap, TimeTracker tracker)
      : super(tracker);

  static Future<Database> createDatabase(
      Directory dbDir, String table, bool withIndexes) async {
    // Debug logging
    // https://github.com/tekartik/sqflite/blob/master/sqflite/doc/dev_tips.md#debugging
    // await databaseFactory.debugSetLogLevel(sqfliteLogLevelVerbose);

    return openDatabase(dbDir.path, version: 1, onConfigure: (db) async {
      // Make sure WAL is enabled on Android
      // With debug logs on, should print "PRAGMA journal_mode=WAL"
      // https://github.com/tekartik/sqflite/blob/master/sqflite/doc/dev_tips.md#enable-wal-on-android
      await db.rawQuery('PRAGMA journal_mode=WAL');
    }, onCreate: (Database db, int version) async {
      await db.execute('''
                  CREATE TABLE $table (
                    id integer primary key autoincrement,
                    tString text,
                    tInt int,
                    tLong int,
                    tDouble real)
                ''');
      if (withIndexes) {
        await db.execute('CREATE INDEX ${table}_int ON $table(tInt)');
        await db.execute('CREATE INDEX ${table}_str ON $table(tString '
            '${ExecutorBase.caseSensitive ? '' : 'COLLATE NOCASE'})');
      }
    });
  }

  Future<void> close() => _db.close();

  // TODO use the generic _insertMany() if it doesn't decrease performance
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

  Future<List<T>> _query<T>(DatabaseExecutor db,
          T Function(Map<String, dynamic>) reader, String where,
          [List<Object?>? whereArgs]) async =>
      (await db.query(_table, where: where, whereArgs: whereArgs))
          .map(reader)
          .toList();

  Future<List<T>> readAll(List<int> ids) => tracker.trackAsync(
      'readAll', () async => (await _db.query(_table)).map(_fromMap).toList());

  Future<List<T?>> queryById(List<int> ids, [String? benchmarkQualifier]) =>
      tracker.trackAsync('queryById' + (benchmarkQualifier ?? ''),
          () async => await _query(_db, _fromMap, 'id in (${ids.join(',')})'));

  Future<void> removeMany(List<int> ids) async => tracker.trackAsync(
      'removeMany',
      () async => await _db.delete(_table, where: 'id in (${ids.join(',')})'));

  Future<List<T>> queryStringEquals(List<String> values) => tracker.trackAsync(
      'queryStringEquals',
      () async => _db.transaction((txn) async {
            late List<T> result;
            final length = values.length;
            for (var i = 0; i < length; i++) {
              result = await _query(txn, _fromMap, 'tString = ?', [values[i]]);
            }
            return result;
          }));
}

/// Using an entity without indexes
class ExecutorPlain extends Executor<TestEntityPlain> {
  ExecutorPlain._(
      String table,
      Database db,
      TestEntityPlain Function(Map<String, dynamic>) fromMap,
      TimeTracker tracker)
      : super._(table, db, fromMap, tracker);

  static Future<Executor<TestEntityPlain>> create(
      Directory dbDir, TimeTracker tracker) async {
    final table = (TestEntityPlain).toString();
    return ExecutorPlain._(
        table,
        await Executor.createDatabase(dbDir, table, false),
        TestEntityPlain.fromMap,
        tracker);
  }

  @override
  TestEntityPlain createEntity(
      String tString, int tInt, int tLong, double tDouble) {
    return TestEntityPlain(0, tString, tInt, tLong, tDouble);
  }

  Future<ExecutorBaseRel> createRelBenchmark() =>
      Future.value(ExecutorRel.create<RelSourceEntityPlain>(tracker, _db));
}

/// Using an entity with indexes
class ExecutorIndexed extends Executor<TestEntityIndexed> {
  ExecutorIndexed._(
      String table,
      Database db,
      TestEntityIndexed Function(Map<String, dynamic>) fromMap,
      TimeTracker tracker)
      : super._(table, db, fromMap, tracker);

  static Future<Executor<TestEntityIndexed>> create(
      Directory dbDir, TimeTracker tracker) async {
    final table = (TestEntityIndexed).toString();
    return ExecutorIndexed._(
        table,
        await Executor.createDatabase(dbDir, table, true),
        TestEntityIndexed.fromMap,
        tracker);
  }

  @override
  TestEntityIndexed createEntity(
      String tString, int tInt, int tLong, double tDouble) {
    return TestEntityIndexed(0, tString, tInt, tLong, tDouble);
  }

  Future<ExecutorBaseRel> createRelBenchmark() =>
      Future.value(ExecutorRel.create<RelSourceEntityIndexed>(tracker, _db));
}

class ExecutorRel<T extends RelSourceEntity> extends ExecutorBaseRel<T> {
  final Database _db;
  final String _table;
  final String _tableTarget;
  final T Function(Map<String, dynamic>) _fromMap;

  static Future<ExecutorRel<T>> create<T extends RelSourceEntity>(
      TimeTracker tracker, Database db) async {
    final table = T.toString();
    final tableTarget = 'RelTargetEntity';

    await db.execute('''
                  CREATE TABLE $table (
                    id integer primary key autoincrement,
                    relTargetId int,
                    tString text,
                    tLong int)
                ''');
    await db.execute('CREATE INDEX ${table}_rel ON $table(relTargetId)');
    if (T == RelSourceEntityIndexed) {
      await db.execute('CREATE INDEX ${table}_long ON $table(tLong)');
      await db.execute('CREATE INDEX ${table}_str ON $table(tString '
          '${ExecutorBase.caseSensitive ? '' : 'COLLATE NOCASE'})');
    }

    await db.execute('''
                  CREATE TABLE $tableTarget (
                    id integer primary key autoincrement,
                    name text)
                ''');
    // Always add index on target name.
    await db.execute('CREATE INDEX ${tableTarget}_str ON $tableTarget(name '
        '${ExecutorBase.caseSensitive ? '' : 'COLLATE NOCASE'})');
    return ExecutorRel._(
      tracker,
      db,
      table,
      tableTarget,
      T == RelSourceEntityIndexed
          ? RelSourceEntityIndexed.fromMap as T Function(Map<String, dynamic>)
          : RelSourceEntityPlain.fromMap as T Function(Map<String, dynamic>),
    );
  }

  ExecutorRel._(TimeTracker tracker, this._db, this._table, this._tableTarget,
      this._fromMap)
      : super(tracker);

  Future<void> close() async {}

  Future<void> insertData(int relSourceCount, int relTargetCount) async {
    final targets = prepareDataTargets(relTargetCount);
    await _insertMany(_db, targets, RelTargetEntity.toMap);
    assert(targets.first.id != 0);
    final sources = prepareDataSources(relSourceCount, targets);
    await _insertMany(_db, sources, RelSourceEntity.toMap);
  }

  Future<List<T>> queryWithLinks(List<ConfigQueryWithLinks> args) async =>
      tracker.trackAsync(
          'queryWithLinks',
          () async => _db.transaction((txn) async {
                late List<T> result;
                final length = args.length;
                for (var i = 0; i < length; i++) {
                  result = (await txn.rawQuery(
                          'SELECT $_table.* FROM $_table '
                          'INNER JOIN $_tableTarget ON $_table.relTargetId = $_tableTarget.id '
                          'WHERE $_table.tString = ? AND $_table.tLong = ? AND $_tableTarget.name = ?',
                          [
                        args[i].sourceStringEquals,
                        args[i].sourceIntEquals,
                        args[i].targetStringEquals
                      ]))
                      .map(_fromMap)
                      .toList();
                }
                return result;
              }));
}

Future<void> _insertMany<T extends EntityWithSettableId>(
    Database db, List<T> items, Map<String, dynamic> Function(T) toMap) async {
  final tx = db.batch();
  items.forEach(
      (object) => tx.insert(items.first.runtimeType.toString(), toMap(object)));
  final ids = await tx.commit();
  for (int i = 0; i < ids.length; i++) {
    items[i].id = ids[i] as int;
  }
  assert(ids.length == items.length);
}
