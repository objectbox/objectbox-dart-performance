import 'dart:io';

import 'package:hive/hive.dart';

import 'executor.dart';
import 'time_tracker.dart';
import 'model.dart';

class Executor extends ExecutorBase {
  static final _boxName = 'TestEntity';
  /*late final*/
  Box<TestEntity> _box;

  Executor._(this._box, TimeTracker tracker) : super(tracker);

  static Future<Executor> create(Directory dbDir, TimeTracker tracker) async {
    Hive.init(dbDir.path);
    Hive.registerAdapter(TestEntityAdapter());
    return Executor._(await Hive.openBox(_boxName), tracker);
  }

  void close() => _box.close();

  Future<void> _putMany(String fn, List<TestEntity> items) async =>
      tracker.trackAsync(fn, () async {
        int id = 1;
        items.forEach((TestEntity o) {
          o.id ??= id++;
        });
        final itemsById = Map<int, TestEntity>.fromIterable(items,
            key: (o) => o.id, value: (o) => o);
        return await _box.putAll(itemsById);
      });

  Future<void> putMany(List<TestEntity> items) async =>
      _putMany('putMany', items);

  Future<void> updateAll(List<TestEntity> items) async =>
      _putMany('updateAll', items);

  Future<List<TestEntity>> readAll() async {
    // Make sure the data is actually read, not used from memory.
    await _box.close();
    _box = await Hive.openBox(_boxName);
    return Future.value(tracker.track('readAll', () => _box.values.toList()));
  }

  Future<void> removeAll() async =>
      tracker.track('removeAll', () => _box.clear());
}
