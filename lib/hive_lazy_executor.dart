import 'dart:io';

import 'package:hive/hive.dart';

import 'executor.dart';
import 'model.dart';
import 'time_tracker.dart';

/// WARNING: outdated and unused
class Executor<T extends TestEntity> extends ExecutorBase<T> {
  late final LazyBox<T> _box;

  Executor._(this._box, TimeTracker tracker) : super(tracker);

  static Future<Executor> create(Directory dbDir, TimeTracker tracker) async {
    return Executor._(
        await Hive.openLazyBox('TestEntity', path: dbDir.path), tracker);
  }

  Future<void> close() => _box.close();

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

  Future<List<T?>> queryById(List<int> ids, [String? benchmarkQualifier]) =>
      tracker.trackAsync('queryById' + (benchmarkQualifier ?? ''),
          () => Future.wait(ids.map(_box.get).toList()));

  Future<void> removeMany(List<int> ids) async =>
      tracker.trackAsync('removeMany', () async {
        await _box.deleteAll(ids);
        await _box.compact();
      });

  // not supported - there's no iterator
  Future<List<T>> queryStringEquals(List<String> val) => tracker.track(
      'queryStringEquals',
      () => Future.error('Hive does not support queries on lazy boxes'));
}
