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

  Future<void> insertMany(List<TestEntity> items) async =>
      tracker.trackAsync('insertMany', () async {
        int id = 1;
        final itemsById = <int, TestEntity>{};
        items.forEach((TestEntity o) {
          o.id ??= id++;
          itemsById[o.id] = o;
        });
        return await _box.putAll(itemsById);
      });

  Future<void> updateMany(List<TestEntity> items) async => tracker.trackAsync(
      'updateMany',
      () async => await _box.putAll(Map<int, TestEntity>.fromIterable(items,
          key: (o) => o.id, value: (o) => o)));

  Future<List<TestEntity>> readMany(List<int> ids) async {
    return Future.value(tracker.track(
        'readMany', () => ids.map((id) => _box.get(id)).toList()));
  }

  Future<void> removeMany(List<int> ids) async =>
      tracker.track('removeMany', () async {
        await _box.deleteAll(ids);
        await _box.compact();
      });
}
