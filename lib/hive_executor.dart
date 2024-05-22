import 'dart:io';

import 'package:hive/hive.dart';

import 'executor.dart';
import 'model.dart';
import 'time_tracker.dart';

/// Note: There are no explicit indixes in Hive.
class Executor extends ExecutorBase<TestEntityPlain> {
  final Box<TestEntityPlain> _box;
  final String _dir;

  Executor._(this._dir, this._box, TimeTracker tracker) : super(tracker);

  static Future<Executor> create(Directory dbDir, TimeTracker tracker) async {
    if (!Hive.isAdapterRegistered(TestEntityPlainAdapter().typeId)) {
      Hive.registerAdapter(TestEntityPlainAdapter());
    }
    return Executor._(
        dbDir.path,
        await Hive.openBox((TestEntityPlain).toString(), path: dbDir.path),
        tracker);
  }

  @override
  Future<void> close() async => await _box.close();

  @override
  TestEntityPlain createEntity(
      String tString, int tInt, int tLong, double tDouble) {
    return TestEntityPlain(0, tString, tInt, tLong, tDouble);
  }

  @override
  Future<void> insertMany(List<TestEntityPlain> items) async =>
      tracker.trackAsync('insertMany', () async {
        int id = 1;
        final itemsById = <int, TestEntityPlain>{};
        items.forEach((TestEntityPlain o) {
          if (o.id == 0) o.id = id++;
          itemsById[o.id] = o;
        });
        return await _box.putAll(itemsById);
      });

  @override
  Future<void> updateMany(List<TestEntityPlain> items) async =>
      tracker.trackAsync(
          'updateMany',
          () async => await _box.putAll(Map<int, TestEntityPlain>.fromIterable(
              items,
              key: (o) => o.id,
              value: (o) => o)));

  @override
  Future<List<TestEntityPlain>> readAll(List<int> optionalIds) =>
      Future.value(tracker.track('readAll', () => _box.values.toList()));

  @override
  Future<List<TestEntityPlain?>> queryById(List<int> ids,
          [String? benchmarkQualifier]) =>
      Future.value(tracker.track('queryById${benchmarkQualifier ?? ''}',
          () => ids.map(_box.get).toList()));

  @override
  Future<void> removeMany(List<int> ids) async =>
      tracker.trackAsync('removeMany', () async {
        await _box.deleteAll(ids);
        await _box.compact();
      });

  // Hive doesn't have queries -> let's emulate
  @override
  Future<List<TestEntityPlain>> queryStringEquals(List<String> values) {
    if (!ExecutorBase.caseSensitive) {
      values = values.map((e) => e.toLowerCase()).toList(growable: false);
    }
    return Future.value(tracker.track('queryStringEquals', () {
      late List<TestEntityPlain> result;
      final length = values.length;
      for (var i = 0; i < length; i++) {
        result = _box.values
            .where((TestEntityPlain object) => ExecutorBase.caseSensitive
                ? object.tString == values[i]
                : object.tString.toLowerCase() == values[i])
            .toList();
      }
      return result;
    }));
  }

  @override
  Future<ExecutorBaseRel> createRelBenchmark() =>
      ExecutorRel.create<RelSourceEntityPlain>(tracker, _dir);
}

class ExecutorRel<T extends RelSourceEntity> extends ExecutorBaseRel<T> {
  final Box<T> _box;
  final Box<RelTargetEntity> _boxTarget;

  static Future<ExecutorRel<T>> create<T extends RelSourceEntity>(
      TimeTracker tracker, String? path) async {
    if (!Hive.isAdapterRegistered(RelSourceEntityPlainAdapter().typeId)) {
      Hive.registerAdapter(RelSourceEntityPlainAdapter());
    }
    if (!Hive.isAdapterRegistered(RelTargetEntityAdapter().typeId)) {
      Hive.registerAdapter(RelTargetEntityAdapter());
    }
    return ExecutorRel._(tracker, await Hive.openBox(T.toString(), path: path),
        await Hive.openBox('RelTargetEntity', path: path));
  }

  ExecutorRel._(TimeTracker tracker, this._box, this._boxTarget)
      : super(tracker);

  @override
  Future<void> close() async {
    await _box.close();
    await _boxTarget.close();
  }

  @override
  Future<void> insertData(int relSourceCount, int relTargetCount) async {
    final targets = prepareDataTargets(relTargetCount);
    await _boxTarget.putAll(_itemsById(targets));
    assert(targets.first.id != 0);
    final sources = prepareDataSources(relSourceCount, targets);
    await _box.putAll(_itemsById(sources));
    assert(_box.length == relSourceCount);
    assert(_boxTarget.length == relTargetCount);
  }

  @override
  Future<List<T>> queryWithLinks(List<ConfigQueryWithLinks> args) {
    if (!ExecutorBase.caseSensitive) {
      args.forEach((config) {
        config.sourceStringEquals..toLowerCase();
        config.targetStringEquals..toLowerCase();
      });
    }

    return Future.value(tracker.track('queryWithLinks', () {
      late List<T> result;
      final length = args.length;
      for (var i = 0; i < length; i++) {
        final matchingTargets = _boxTarget.values
            .where((RelTargetEntity o) =>
                (ExecutorBase.caseSensitive ? o.name : o.name.toLowerCase()) ==
                args[i].targetStringEquals)
            .map((e) => e.id)
            .toSet();
        assert(matchingTargets.isNotEmpty);
        result = _box.values
            .where((T o) =>
                o.tLong == args[i].sourceIntEquals &&
                matchingTargets
                    .contains((o as RelSourceEntityPlain).relTargetId) &&
                (ExecutorBase.caseSensitive
                        ? o.tString
                        : o.tString.toLowerCase()) ==
                    args[i].sourceStringEquals)
            .toList();
      }
      return result;
    }));
  }
}

Map<int, EntityT> _itemsById<EntityT>(List<EntityWithSettableId> list) {
  final result = <int, EntityT>{};
  var id = 1;
  list.forEach((EntityWithSettableId o) {
    if (o.id == 0) o.id = id++;
    result[o.id] = o as EntityT;
  });
  return result;
}
