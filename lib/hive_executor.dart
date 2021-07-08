import 'dart:io';

import 'package:hive/hive.dart';

import 'executor.dart';
import 'model.dart';
import 'time_tracker.dart';

class Executor<T extends TestEntity> extends ExecutorBase<T> {
  final Box<T> _box;

  Executor._(this._box, TimeTracker tracker) : super(tracker);

  static Future<Executor<T>> create<T extends TestEntity>(
      Directory dbDir, TimeTracker tracker) async {
    if (!Hive.isAdapterRegistered(TestEntityPlainAdapter().typeId)) {
      Hive.registerAdapter(TestEntityPlainAdapter());
    }
    if (!Hive.isAdapterRegistered(TestEntityIndexedAdapter().typeId)) {
      Hive.registerAdapter(TestEntityIndexedAdapter());
    }
    return Executor._(
        await Hive.openBox(T.toString(), path: dbDir.path), tracker);
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

  Future<List<T?>> readMany(List<int> ids, [String? benchmarkQualifier]) =>
      Future.value(tracker.track('readMany' + (benchmarkQualifier ?? ''),
          () => ids.map(_box.get).toList()));

  Future<void> removeMany(List<int> ids) async =>
      tracker.trackAsync('removeMany', () async {
        await _box.deleteAll(ids);
        await _box.compact();
      });

  // Hive doesn't have queries -> let's emulate
  Future<List<T>> queryStringEquals(String val) {
    if (!ExecutorBase.caseSensitive) val = val.toLowerCase();
    return Future.value(tracker.track(
        'queryStringEquals',
        () => _box.values
            .where((T object) => ExecutorBase.caseSensitive
                ? object.tString == val
                : object.tString.toLowerCase() == val)
            .toList()));
  }
}
