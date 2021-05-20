import 'dart:io';

import 'package:hive/hive.dart';

import 'executor.dart';
import 'time_tracker.dart';
import 'model.dart';

class Executor extends ExecutorBase {
  final Box<TestEntity> _box;
  final Box<TestEntityIndexed> _boxIndexed;

  Executor._(this._box, this._boxIndexed, TimeTracker tracker) : super(tracker);

  static Future<Executor> create(Directory dbDir, TimeTracker tracker) async {
    if (!Hive.isAdapterRegistered(TestEntityAdapter().typeId)) {
      Hive.registerAdapter(TestEntityAdapter());
    }
    if (!Hive.isAdapterRegistered(TestEntityIndexedAdapter().typeId)) {
      Hive.registerAdapter(TestEntityIndexedAdapter());
    }
    return Executor._(await Hive.openBox('TestEntity', path: dbDir.path),
        await Hive.openBox('TestEntityIndexed', path: dbDir.path), tracker);
  }

  Future<void> close() => _box.close();

  Future<void> insertMany(List<TestEntity> items) async =>
      tracker.trackAsync('insertMany', () async {
        int id = 1;
        final itemsById = <int, TestEntity>{};
        items.forEach((TestEntity o) {
          if (o.id == 0) o.id = id++;
          itemsById[o.id] = o;
        });
        return await _box.putAll(itemsById);
      });

  Future<void> insertManyIndexed(List<TestEntityIndexed> items) async =>
      tracker.trackAsync('insertManyIndexed', () async {
        int id = 1;
        final itemsById = <int, TestEntityIndexed>{};
        items.forEach((TestEntityIndexed o) {
          if (o.id == 0) o.id = id++;
          itemsById[o.id] = o;
        });
        return await _boxIndexed.putAll(itemsById);
      });

  Future<void> updateMany(List<TestEntity> items) async => tracker.trackAsync(
      'updateMany',
      () async => await _box.putAll(Map<int, TestEntity>.fromIterable(items,
          key: (o) => o.id, value: (o) => o)));

  Future<List<TestEntity?>> readMany(List<int> ids) =>
      Future.value(tracker.track('readMany', () => ids.map(_box.get).toList()));

  Future<void> removeMany(List<int> ids) async =>
      tracker.trackAsync('removeMany', () async {
        await _box.deleteAll(ids);
        await _box.compact();
      });

  // Hive doesn't have queries -> let's emulate
  Future<List<TestEntityIndexed>> queryStringEquals(String val) {
    if (!ExecutorBase.caseSensitive) val = val.toLowerCase();
    return Future.value(tracker.track(
        'queryStringEquals',
        () => _boxIndexed.values
            .where((TestEntityIndexed object) => ExecutorBase.caseSensitive
                ? object.tString == val
                : object.tString.toLowerCase() == val)
            .toList()));
  }
}
