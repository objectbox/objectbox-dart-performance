import 'dart:io';

import 'package:hive/hive.dart';

import 'executor.dart';
import 'time_tracker.dart';
import 'model.dart';

class Executor extends ExecutorBase {
  static final _boxName = 'TestEntity';
  late final LazyBox<TestEntity> _box;

  Executor._(this._box, TimeTracker tracker) : super(tracker);

  static Future<Executor> create(Directory dbDir, TimeTracker tracker) async {
    if (!Hive.isAdapterRegistered(TestEntityAdapter().typeId)) {
      Hive.registerAdapter(TestEntityAdapter());
    }
    return Executor._(
        await Hive.openLazyBox(_boxName, path: dbDir.path), tracker);
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

  Future<void> updateMany(List<TestEntity> items) async => tracker.trackAsync(
      'updateMany',
      () async => await _box.putAll(Map<int, TestEntity>.fromIterable(items,
          key: (o) => o.id, value: (o) => o)));

  Future<List<TestEntity?>> readMany(List<int> ids) => tracker.trackAsync(
      'readMany', () => Future.wait(ids.map(_box.get).toList()));

  Future<void> removeMany(List<int> ids) async =>
      tracker.trackAsync('removeMany', () async {
        await _box.deleteAll(ids);
        await _box.compact();
      });
}
