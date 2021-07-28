import 'dart:io';

import 'package:benchapp/executor.dart';
import 'package:benchapp/isar.g.dart';
import 'package:benchapp/model.dart';
import 'package:benchapp/time_tracker.dart';
import 'package:isar/isar.dart';

class Executor<T extends TestEntity> extends ExecutorBase<T> {
  final Isar _store;
  final IsarCollection<T> _box;

  Executor._(this._store, TimeTracker tracker)
      : _box = _store.getCollection(T.toString()),
        super(tracker);

  static Future<Executor<T>> create<T extends TestEntity>(
      Directory dbDir, TimeTracker tracker) async {
    return Executor._(await openIsar(directory: dbDir.path), tracker);
  }

  // TODO isar v0.4.0 - crashes with a SEGFAULT (at least in Android emulator)
  // Future<void> close() async => await _store.close();
  Future<void> close() => Future.value();

  Future<void> insertMany(List<T> items) => Future.value(
        tracker.track(
          'insertMany',
          () {
            _assignIds(items);
            return _store.writeTxnSync(
              (isar) => _box.putAllSync(items),
            );
          },
        ),
      );

  Future<void> updateMany(List<T> items) => Future.value(tracker.track(
      'updateMany',
      () => _store.writeTxnSync((isar) => _box.putAllSync(items))));

  // TODO currently missing in isar (v0.4.0)
  // Future<List<T>> readAll() =>
  //     Future.value(tracker.track('readAll', () => _box.getAllSync()));

  Future<List<T?>> queryById(List<int> ids, [String? benchmarkQualifier]) =>
      Future.value(tracker.track('queryById' + (benchmarkQualifier ?? ''),
          () => _box.getAllSync(ids)));

  Future<void> removeMany(List<int> ids) => Future.value(
        tracker.track('removeMany',
            () => _store.writeTxnSync((Isar isar) => _box.deleteAllSync(ids))),
      );

  Future<List<T>> queryStringEquals(List<String> values) async =>
      Future.value(indexed
          ? tracker.track('queryStringEquals', () {
              // Indexed queries must be case insensitive, this prevents comparison.
              // See https://github.com/isar/isar#queries
              assert(!ExecutorBase.caseSensitive);
              late List<TestEntityIndexed> result;
              final length = values.length;
              for (var i = 0; i < length; i++) {
                result = (_box as IsarCollection<TestEntityIndexed>)
                    .where()
                    .tStringEqualTo(values[i])
                    .findAllSync();
              }
              return result;
            }) as List<T>
          : tracker.track('queryStringEquals', () {
              late List<TestEntityPlain> result;
              final length = values.length;
              for (var i = 0; i < length; i++) {
                result = (_box as IsarCollection<TestEntityPlain>)
                    .where()
                    .filter()
                    .tStringEqualTo(values[i],
                        caseSensitive: ExecutorBase.caseSensitive)
                    .findAllSync();
              }
              return result;
            }) as List<T>);

  Future<ExecutorBaseRel> createRelBenchmark() => Future.value(indexed
      ? ExecutorRel<RelSourceEntityIndexed>._(tracker, _store)
      : ExecutorRel<RelSourceEntityPlain>._(tracker, _store));
}

class ExecutorRel<T extends RelSourceEntity> extends ExecutorBaseRel<T> {
  final Isar _store;
  final IsarCollection<T> _box;
  final IsarCollection<RelTargetEntity> _boxTarget;

  ExecutorRel._(TimeTracker tracker, this._store)
      : _box = _store.getCollection(T.toString()),
        _boxTarget = _store.getCollection('RelTargetEntity'),
        super(tracker);

  Future<void> close() async => Future.value();

  Future<void> insertData(int relSourceCount, int relTargetCount) async {
    final targets = prepareDataTargets(relTargetCount);
    _assignIds(targets);
    _store.writeTxnSync((isar) => _boxTarget.putAllSync(targets));

    final sources = prepareDataSources(relSourceCount, targets);
    _assignIds(sources);
    _store.writeTxnSync((isar) => _box.putAllSync(sources));

    // TODO no count() available in isar yet?
    // assert(_box.length == relSourceCount);
    // assert(_boxTarget.length == relTargetCount);
  }

  Future<List<T>> queryWithLinks(List<ConfigQueryWithLinks> args) {
    // TODO implement once the model is properly generated
    // see https://isar.dev/queries#links
    return Future.error(UnimplementedError('queryWithLinks'));
  }
}

void _assignIds<EntityT>(List<EntityWithSettableId> list) {
  for (var i = 0; i < list.length; i++) {
    list[i].id = i + 1;
  }
}
