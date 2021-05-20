import 'dart:io';

import 'package:objectbox/objectbox.dart';

import 'executor.dart';
import 'time_tracker.dart';
import 'model.dart';
import 'objectbox.g.dart';

class Executor extends ExecutorBase {
  final Store store;
  late final Box<TestEntity> box;
  late final Box<TestEntityIndexed> boxIndexed;

  Executor(Directory dbDir, TimeTracker tracker)
      : store = Store(getObjectBoxModel(), directory: dbDir.path),
        super(tracker) {
    box = store.box();
    boxIndexed = store.box();
  }

  Future<void> close() async => store.close();

  Future<void> insertMany(List<TestEntity> items) =>
      Future.value(tracker.track('insertMany', () => box.putMany(items)));

  Future<void> insertManyIndexed(List<TestEntityIndexed> items) => Future.value(
      tracker.track('insertManyIndexed', () => boxIndexed.putMany(items)));

  Future<void> updateMany(List<TestEntity> items) =>
      Future.value(tracker.track('updateMany', () => box.putMany(items)));

  Future<List<TestEntity?>> readMany(List<int> ids) =>
      Future.value(tracker.track('readMany', () => box.getMany(ids)));

  Future<void> removeMany(List<int> ids) =>
      Future.value(tracker.track('removeMany', () => box.removeMany(ids)));

  Future<List<TestEntityIndexed>> queryStringEquals(String val) =>
      Future.value(tracker.track(
          'queryStringEquals',
          () => boxIndexed
              .query(TestEntityIndexed_.tString
                  .equals(val, caseSensitive: ExecutorBase.caseSensitive))
              .build()
              .find()));
}
