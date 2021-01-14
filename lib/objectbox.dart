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

  void putMany(List<TestEntity> items) =>
      tracker.track('putMany', () => box.putMany(items));

  void updateAll(List<TestEntity> items) =>
      tracker.track('updateAll', () => box.putMany(items));

  Future<List<TestEntity>> readAll() =>
      Future.value(tracker.track('readAll', () => box.getAll()));

  void removeAll() => tracker.track('removeAll', () => box.removeAll());
}
