import 'time_tracker.dart';
import 'model.dart';

abstract class ExecutorBase {
  final TimeTracker _tracker;

  TimeTracker get tracker => _tracker;

  ExecutorBase(this._tracker);

  List<TestEntity> prepareData(int count) {
    return _tracker.track('prepareData', () {
      final result = <TestEntity>[];
      for (var i = 0; i < count; i++) {
        result.add(TestEntity.full(null, 'Entity #$i', i, i, i.toDouble()));
      }
      return result;
    });
  }

  void changeValues(List<TestEntity> items) {
    _tracker.track(
        'changeValues', () => items.forEach((item) => item.tLong *= 2));
  }

  Future<void> putMany(List<TestEntity> items);

  Future<void> updateAll(List<TestEntity> items);

  Future<List<TestEntity>> readAll();

  Future<void> removeAll();
}
