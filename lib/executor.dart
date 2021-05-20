import 'time_tracker.dart';
import 'model.dart';

abstract class ExecutorBase {
  static const caseSensitive = true;

  final TimeTracker _tracker;

  TimeTracker get tracker => _tracker;

  ExecutorBase(this._tracker);

  Future<void> close();

  List<TestEntity> prepareData(int count) => List.generate(
      count, (i) => TestEntity(0, 'Entity #$i', i, i, i.toDouble()),
      growable: false);

  List<TestEntityIndexed> prepareDataIndexed(int count) =>
      List.generate(count, (i) => TestEntityIndexed(0, 'Entity #$i'),
          growable: false);

  void changeValues(List<TestEntity?> items) =>
      items.forEach((item) => item!.tLong *= 2);

  Future<void> insertMany(List<TestEntity> items);

  Future<void> insertManyIndexed(List<TestEntityIndexed> items) =>
      throw UnimplementedError();

  Future<void> updateMany(List<TestEntity> items);

  Future<List<TestEntity?>> readMany(List<int> ids);

  Future<void> removeMany(List<int> ids);

  Future<List<TestEntityIndexed>> queryStringEquals(String value) =>
      throw UnimplementedError();
}

/// Verifies that the given executor works as expectd (returns proper results).
Future<void> testExecutor(ExecutorBase bench,
        {required int count, String? qString}) =>
    Future.sync(() async {
      final checkCount = (String message, Iterable list, int count) =>
          RangeError.checkValueInInterval(list.length, count, count, message);

      final inserts = bench.prepareData(count);
      await bench.insertMany(inserts);
      if (qString != null) {
        final insertsIndexed = bench.prepareDataIndexed(count * 10);
        await bench.insertManyIndexed(insertsIndexed);
      }

      final ids = inserts.map((e) => e.id).toList(growable: false);
      checkCount('insertMany assigns ids', ids.toSet(), count);

      final itemsOptional = await bench.readMany(ids);

      final items = itemsOptional.map((e) => e!).toList(growable: false);

      checkCount('readMany', items, count);

      bench.changeValues(items);
      await bench.updateMany(items);

      if (qString != null) {
        checkCount('query string', await bench.queryStringEquals(qString), 1);
      }

      checkCount('count before remove',
          (await bench.readMany(ids)).where((e) => e != null), count);
      await bench.removeMany(ids);
      checkCount('count after remove',
          (await bench.readMany(ids)).where((e) => e != null), 0);
    });
