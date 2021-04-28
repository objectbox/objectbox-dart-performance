import 'time_tracker.dart';
import 'model.dart';

abstract class ExecutorBase {
  final TimeTracker _tracker;

  TimeTracker get tracker => _tracker;

  ExecutorBase(this._tracker);

  List<TestEntity> prepareData(int count) {
    final result = <TestEntity>[];
    for (var i = 0; i < count; i++) {
      result.add(TestEntity(0, 'Entity #$i', i, i, i.toDouble()));
    }
    return result.toList(growable: false);
  }

  void changeValues(List<TestEntity?> items) =>
      items.forEach((item) => item!.tLong *= 2);

  Future<void> insertMany(List<TestEntity> items);

  Future<void> updateMany(List<TestEntity> items);

  Future<List<TestEntity?>> readMany(List<int> ids);

  Future<void> removeMany(List<int> ids);
}
