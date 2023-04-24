import 'dart:io';

import 'package:benchapp/isar_model.dart';
import 'package:isar/isar.dart';

import 'executor.dart';
import 'model.dart';
import 'time_tracker.dart';

abstract class Executor<T extends TestEntity> extends ExecutorBase<T> {
  final Isar _store;
  final IsarCollection<T> _box;

  Executor._(this._store, TimeTracker tracker)
      : _box = _store.collection(),
        super(tracker);

  Future<void> close() async => await _store.close();

  Future<void> insertMany(List<T> items) => Future.value(
        tracker.track(
          'insertMany',
          () {
            _assignIds(items);
            return _store.writeTxnSync(
              () => _box.putAllSync(items),
            );
          },
        ),
      );

  Future<void> updateMany(List<T> items) => Future.value(tracker.track(
      'updateMany', () => _store.writeTxnSync(() => _box.putAllSync(items))));

  // Note: get all is not supported in isar (v2.5.0), instead
  // use query with no conditions as suggested in Quickstart.
  Future<List<T?>> readAll(List<int> optionalIds) =>
      Future.value(tracker.track('readAll', () => _box.where().findAllSync()));

  Future<List<T?>> queryById(List<int> ids, [String? benchmarkQualifier]) =>
      Future.value(tracker.track('queryById' + (benchmarkQualifier ?? ''),
          () => _box.getAllSync(ids)));

  Future<void> removeMany(List<int> ids) => Future.value(
        tracker.track('removeMany',
            () => _store.writeTxnSync(() => _box.deleteAllSync(ids))),
      );
}

/// Using an entity without indexes
class ExecutorPlain extends Executor<IsarTestEntityPlain> {
  ExecutorPlain._(Isar store, TimeTracker tracker) : super._(store, tracker);

  static Future<Executor<IsarTestEntityPlain>> create(
      Directory dbDir, TimeTracker tracker) async {
    final isar = await Isar.open(
      [
        IsarTestEntityPlainSchema,
        IsarRelSourceEntityPlainSchema,
        IsarRelTargetEntitySchema
      ],
      directory: dbDir.path,
    );
    return ExecutorPlain._(isar, tracker);
  }

  IsarTestEntityPlain createEntity(
      String tString, int tInt, int tLong, double tDouble) {
    return IsarTestEntityPlain(0, tString, tInt, tLong, tDouble);
  }

  Future<List<IsarTestEntityPlain>> queryStringEquals(
          List<String> values) async =>
      Future.value(tracker.track('queryStringEquals', () {
        late List<IsarTestEntityPlain> result;
        final length = values.length;
        for (var i = 0; i < length; i++) {
          result = (_box)
              .where()
              .filter()
              .tStringEqualTo(values[i],
                  caseSensitive: ExecutorBase.caseSensitive)
              .findAllSync();
        }
        return result;
      }));

  Future<ExecutorBaseRel> createRelBenchmark() =>
      Future.value(ExecutorRel<IsarRelSourceEntityPlain>._(tracker, _store));
}

/// Using an entity with indexes
class ExecutorIndexed extends Executor<IsarTestEntityIndexed> {
  ExecutorIndexed._(Isar store, TimeTracker tracker) : super._(store, tracker);

  static Future<Executor<IsarTestEntityIndexed>> create(
      Directory dbDir, TimeTracker tracker) async {
    final isar = await Isar.open(
      [
        IsarTestEntityIndexedSchema,
        IsarRelSourceEntityIndexedSchema,
        IsarRelTargetEntitySchema
      ],
      directory: dbDir.path,
    );
    return ExecutorIndexed._(isar, tracker);
  }

  IsarTestEntityIndexed createEntity(
      String tString, int tInt, int tLong, double tDouble) {
    return IsarTestEntityIndexed(0, tString, tInt, tLong, tDouble);
  }

  Future<List<IsarTestEntityIndexed>> queryStringEquals(
          List<String> values) async =>
      Future.value(tracker.track('queryStringEquals', () {
        // Indexed queries must be case insensitive, this prevents comparison.
        // See https://github.com/isar/isar#queries
        assert(!ExecutorBase.caseSensitive);
        late List<IsarTestEntityIndexed> result;
        final length = values.length;
        for (var i = 0; i < length; i++) {
          result = (_box).where().tStringEqualTo(values[i]).findAllSync();
        }
        return result;
      }));

  Future<ExecutorBaseRel> createRelBenchmark() =>
      Future.value(ExecutorRel<IsarRelSourceEntityIndexed>._(tracker, _store));
}

class ExecutorRel<T extends RelSourceEntity> extends ExecutorBaseRel<T> {
  final Isar _store;
  final IsarCollection<T> _box;
  final IsarCollection<IsarRelTargetEntity> _boxTarget;

  ExecutorRel._(TimeTracker tracker, this._store)
      : _box = _store.collection(),
        _boxTarget = _store.isarRelTargetEntitys,
        super(tracker);

  Future<void> close() async => Future.value();

  Future<void> insertData(int relSourceCount, int relTargetCount) async {
    final targets = prepareDataTargetsIsar(relTargetCount);
    _assignIds(targets);
    _store.writeTxnSync(() => _boxTarget.putAllSync(targets));

    final sources = prepareDataSourcesIsar(relSourceCount, targets);
    _assignIds(sources);
    _store.writeTxnSync(() => _box.putAllSync(sources));

    assert(_box.countSync() == relSourceCount);
    assert(_boxTarget.countSync() == relTargetCount);
  }

  /// Matches ExecutorBaseRel.prepareDataSources, see for implementation details.
  List<T> prepareDataSourcesIsar(
          int count, List<IsarRelTargetEntity> targets) =>
      List.generate(count, (i) {
        final groupNumber =
            i % targets.length % ExecutorBaseRel.distinctSourceStrings(count);
        final string = 'Source group #$groupNumber';
        final target = targets[i % targets.length];
        return indexed
            ? IsarRelSourceEntityIndexed.forInsert(string, i % 2, target) as T
            : IsarRelSourceEntityPlain.forInsert(string, i % 2, target) as T;
      }, growable: false);

  List<IsarRelTargetEntity> prepareDataTargetsIsar(int count) =>
      List.generate(count, (i) => IsarRelTargetEntity(0, 'Target #$i'),
          growable: false);

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
