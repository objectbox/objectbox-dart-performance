import 'time_tracker.dart';
import 'model.dart';

abstract class ExecutorBase {
  final TimeTracker _tracker;

  TimeTracker get tracker => _tracker;

  ExecutorBase(this._tracker);

  Future<void> close();

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

/// Verifies that the given executor works as expectd (returns proper results).
Future<void> testExecutor(ExecutorBase bench, {required int count}) =>
    Future.sync(() async {
      final checkCount = (String message, Iterable list, int count) =>
          RangeError.checkValueInInterval(list.length, count, count, message);

      final inserts = bench.prepareData(count);
      await bench.insertMany(inserts);

      final ids = inserts.map((e) => e.id).toList(growable: false);
      checkCount('insertMany assigns ids', ids.toSet(), count);

      final itemsOptional = await bench.readMany(ids);

      final items = itemsOptional.map((e) => e!).toList(growable: false);

      checkCount('readMany', items, count);

      bench.changeValues(items);
      await bench.updateMany(items);

      checkCount('count before remove',
          (await bench.readMany(ids)).where((e) => e != null), count);
      await bench.removeMany(ids);
      checkCount('count after remove',
          (await bench.readMany(ids)).where((e) => e != null), 0);
    });
