import 'dart:io';

import 'package:hive/hive.dart';

import 'executor.dart';
import 'model.dart';
import 'time_tracker.dart';

class Executor<T extends TestEntity> extends ExecutorBase<T> {
  final Box<T> _box;
  final String _dir;

  Executor._(this._dir, this._box, TimeTracker tracker) : super(tracker);

  static Future<Executor<T>> create<T extends TestEntity>(
      Directory dbDir, TimeTracker tracker) async {
    if (!Hive.isAdapterRegistered(TestEntityPlainAdapter().typeId)) {
      Hive.registerAdapter(TestEntityPlainAdapter());
    }
    if (!Hive.isAdapterRegistered(TestEntityIndexedAdapter().typeId)) {
      Hive.registerAdapter(TestEntityIndexedAdapter());
    }
    return Executor._(dbDir.path,
        await Hive.openBox(T.toString(), path: dbDir.path), tracker);
  }

  Future<void> close() async => await _box.close();

  Future<void> insertMany(List<T> items) async =>
      tracker.trackAsync('insertMany', () async {
        int id = 1;
        final itemsById = <int, T>{};
        items.forEach((T o) {
          if (o.id == 0) o.id = id++;
          itemsById[o.id] = o;
        });
        return await _box.putAll(itemsById);
      });

  Future<void> updateMany(List<T> items) async => tracker.trackAsync(
      'updateMany',
      () async => await _box.putAll(
          Map<int, T>.fromIterable(items, key: (o) => o.id, value: (o) => o)));

  Future<List<T>> readAll(List<int> ids) =>
      Future.value(tracker.track('readAll', () => _box.values.toList()));

  Future<List<T?>> queryById(List<int> ids, [String? benchmarkQualifier]) =>
      Future.value(tracker.track('queryById' + (benchmarkQualifier ?? ''),
          () => ids.map(_box.get).toList()));

  Future<void> removeMany(List<int> ids) async =>
      tracker.trackAsync('removeMany', () async {
        await _box.deleteAll(ids);
        await _box.compact();
      });

  // Hive doesn't have queries -> let's emulate
  Future<List<T>> queryStringEquals(List<String> values) {
    if (!ExecutorBase.caseSensitive) {
      values = values.map((e) => e.toLowerCase()).toList(growable: false);
    }
    return Future.value(tracker.track('queryStringEquals', () {
      late List<T> result;
      final length = values.length;
      for (var i = 0; i < length; i++) {
        result = _box.values
            .where((T object) => ExecutorBase.caseSensitive
                ? object.tString == values[i]
                : object.tString.toLowerCase() == values[i])
            .toList();
      }
      return result;
    }));
  }

  Future<ExecutorBaseRel> createRelBenchmark() => indexed
      ? ExecutorRel.create<RelSourceEntityIndexed>(tracker, _dir)
      : ExecutorRel.create<RelSourceEntityPlain>(tracker, _dir);
}

class ExecutorRel<T extends RelSourceEntity> extends ExecutorBaseRel<T> {
  final Box<T> _box;
  final Box<RelTargetEntity> _boxTarget;

  static Future<ExecutorRel<T>> create<T extends RelSourceEntity>(
      TimeTracker tracker, String? path) async {
    if (!Hive.isAdapterRegistered(RelSourceEntityPlainAdapter().typeId)) {
      Hive.registerAdapter(RelSourceEntityPlainAdapter());
    }
    if (!Hive.isAdapterRegistered(RelSourceEntityIndexedAdapter().typeId)) {
      Hive.registerAdapter(RelSourceEntityIndexedAdapter());
    }
    if (!Hive.isAdapterRegistered(RelTargetEntityAdapter().typeId)) {
      Hive.registerAdapter(RelTargetEntityAdapter());
    }
    return ExecutorRel._(tracker, await Hive.openBox(T.toString(), path: path),
        await Hive.openBox('RelTargetEntity', path: path));
  }

  ExecutorRel._(TimeTracker tracker, this._box, this._boxTarget)
      : super(tracker);

  Future<void> close() async {
    await _box.close();
    await _boxTarget.clear();
  }

  Future<void> insertData(int relSourceCount, int relTargetCount) async {
    final targets = prepareDataTargets(relTargetCount);
    await _boxTarget.putAll(_itemsById(targets));
    assert(targets.first.id != 0);
    final sources = prepareDataSources(relSourceCount, targets);
    await _box.putAll(_itemsById(sources));
    assert(_box.length == relSourceCount);
    assert(_boxTarget.length == relTargetCount);
  }

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
