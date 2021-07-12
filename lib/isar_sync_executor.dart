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
            for (int i = 0; i < items.length; i++) {
              items[i].id = i + 1;
            }

            return _store.writeTxnSync(
              (isar) => _box.putAllSync(items),
            );
          },
        ),
      );

  Future<void> updateMany(List<T> items) => Future.value(tracker.track(
      'updateMany',
      () => _store.writeTxnSync((isar) => _box.putAllSync(items))));

  Future<List<T?>> readMany(List<int> ids, [String? benchmarkQualifier]) =>
      Future.value(tracker.track(
          'readMany' + (benchmarkQualifier ?? ''), () => _box.getAllSync(ids)));

  Future<void> removeMany(List<int> ids) => Future.value(
        tracker.track('removeMany',
            () => _store.writeTxnSync((Isar isar) => _box.deleteAllSync(ids))),
      );

  Future<List<T>> queryStringEquals(String val) async => indexed
      ? tracker.trackAsync(
          'queryStringEquals',
          () => (_box as IsarCollection<TestEntityIndexed>)
              .where()
              .filter()
              .tStringEqualTo(val)
              .findAll(),
        ) as Future<List<T>>
      : tracker.trackAsync(
          'queryStringEquals',
          () => (_box as IsarCollection<TestEntityPlain>)
              .where()
              .filter()
              .tStringEqualTo(val)
              .findAll(),
        ) as Future<List<T>>;
}
