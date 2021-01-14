import 'dart:io';

import 'package:objectbox/objectbox.dart';

import 'executor.dart';
import 'time_tracker.dart';
import 'model.dart';
import 'objectbox.g.dart';

class Executor extends ExecutorBase {
  final Store store;

  /*late final*/
  Box<TestEntity> box;

  Executor(Directory dbDir, TimeTracker tracker)
      : store = Store(getObjectBoxModel(), directory: dbDir.path),
        super(tracker) {
    box = Box<TestEntity>(store);
  }

  void close() => store.close();

  Future<void> putMany(List<TestEntity> items) =>
      Future.value(tracker.track('putMany', () => box.putMany(items)));

  Future<void> updateAll(List<TestEntity> items) =>
      Future.value(tracker.track('updateAll', () => box.putMany(items)));

  Future<List<TestEntity>> readAll() =>
      Future.value(tracker.track('readAll', () => box.getAll()));

  Future<void> removeAll() =>
      Future.value(tracker.track('removeAll', () => box.removeAll()));
}
