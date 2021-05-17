import 'dart:io';

import 'package:objectbox/objectbox.dart';

import 'executor.dart';
import 'time_tracker.dart';
import 'model.dart';
import 'objectbox.g.dart';

class Executor extends ExecutorBase {
  final Store store;
  late final Box<TestEntity> box;

  Executor(Directory dbDir, TimeTracker tracker)
      : store = Store(getObjectBoxModel(), directory: dbDir.path),
        super(tracker) {
    box = Box<TestEntity>(store);
  }

  Future<void> close() async => store.close();

  Future<void> insertMany(List<TestEntity> items) =>
      Future.value(tracker.track('insertMany', () => box.putMany(items)));

  Future<void> updateMany(List<TestEntity> items) =>
      Future.value(tracker.track('updateMany', () => box.putMany(items)));

  Future<List<TestEntity?>> readMany(List<int> ids) =>
      Future.value(tracker.track('readMany', () => box.getMany(ids)));

  Future<void> removeMany(List<int> ids) =>
      Future.value(tracker.track('removeMany', () => box.removeMany(ids)));
}
