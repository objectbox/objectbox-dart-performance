import 'dart:io';

import 'package:objectbox/objectbox.dart';

import 'time_tracker.dart';
import 'model.dart';
import 'objectbox.g.dart';

class Executor {
  final TimeTracker _tracker;
  final Store store;

  /*late final*/
  Box<TestEntity> box;

  Executor(Directory dbDir, this._tracker)
      : store = Store(getObjectBoxModel(), directory: dbDir.path) {
    box = Box<TestEntity>(store);
  }

  void close() => store.close();

  List<TestEntity> prepareData(int count) {
    return _tracker.track('prepareData', () {
      final result = <TestEntity>[];
      for (var i = 0; i < count; i++) {
        result.add(TestEntity.full('Entity #$i', i, i, i.toDouble()));
      }
      return result;
    });
  }

  void putMany(List<TestEntity> items) {
    _tracker.track('putMany', () => box.putMany(items));
  }

  void updateAll(List<TestEntity> items) {
    _tracker.track('updateAll', () => box.putMany(items));
  }

  List<TestEntity> readAll() {
    return _tracker.track('readAll', () => box.getAll());
  }

  void removeAll() {
    _tracker.track('removeAll', () => box.removeAll());
  }

  void changeValues(List<TestEntity> items) {
    _tracker.track(
        'changeValues', () => items.forEach((item) => item.tLong *= 2));
  }
}
