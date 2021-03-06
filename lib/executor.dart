import 'dart:math';

import 'model.dart';
import 'time_tracker.dart';

abstract class ExecutorBase<T extends TestEntity> {
  static const caseSensitive = true;

  final TimeTracker tracker;

  ExecutorBase(this.tracker);

  Future<void> close();

  bool get indexed => T == TestEntityIndexed;

  List<T> prepareData(int count) => List.generate(
      count,
      (i) => indexed
          ? TestEntityIndexed(0, 'Entity #$i', i, i, i.toDouble()) as T
          : TestEntityPlain(0, 'Entity #$i', i, i, i.toDouble()) as T,
      growable: false);

  void changeValues(List<T> items) => items.forEach((item) => item.tLong *= 2);

  List<T> allNotNull(List<T?> items) =>
      items.map((e) => e!).toList(growable: false);

  Future<void> insertMany(List<T> items);

  Future<void> updateMany(List<T> items);

  Future<List<T?>> readMany(List<int> ids, [String? benchmarkQualifier]);

  Future<void> removeMany(List<int> ids);

  Future<List<T>> queryStringEquals(String value) => throw UnimplementedError();

  /// Verifies that the executor works as expected (returns proper results).
  Future<void> test({required int count, String? qString}) =>
      Future.sync(() async {
        final checkCount = (String message, Iterable list, int count) =>
            RangeError.checkValueInInterval(list.length, count, count, message);

        final inserts = prepareData(count);
        await insertMany(inserts);

        final ids = inserts.map((e) => e.id).toList(growable: false);
        checkCount('insertMany assigns ids', ids.toSet(), count);

        final items = allNotNull(await readMany(ids));
        checkCount('readMany', items, count);

        changeValues(items);
        await updateMany(items);

        if (qString != null) {
          checkCount('query string', await queryStringEquals(qString), 1);
        }

        checkCount('count before remove',
            (await readMany(ids)).where((e) => e != null), count);
        await removeMany(ids);
        checkCount('count after remove',
            (await readMany(ids)).where((e) => e != null), 0);
      });

  Future<ExecutorBaseRel> createRelBenchmark() => throw UnimplementedError();
}

/// Benchmark executor base class for relations tests
abstract class ExecutorBaseRel<T extends RelSourceEntity> {
  final TimeTracker tracker;

  ExecutorBaseRel(this.tracker);

  Future<void> close();

  bool get indexed => T == RelSourceEntityIndexed;

  // ~ 0.1 percent of the total number of objects
  static int distinctSourceStrings(int objectCount) =>
      max(1, objectCount ~/ 100 - 1);

  List<T> prepareDataSources(int count, List<RelTargetEntity> targets) =>
      List.generate(count, (i) {
        final string = 'Source group #${i % distinctSourceStrings(count)}';
        final targetId = targets[i % targets.length].id;
        return indexed
            ? RelSourceEntityIndexed(0, string, i % 2, targetId) as T
            : RelSourceEntityPlain(0, string, i % 2, targetId) as T;
      }, growable: false);

  List<RelTargetEntity> prepareDataTargets(int count) =>
      List.generate(count, (i) => RelTargetEntity(0, 'Target #$i'),
          growable: false);

  Future<void> insertData(int relSourceCount, int relTargetCount);

  Future<List<T>> queryWithLinks(String sourceStringEquals, int sourceIntEquals,
          String targetStringEquals) =>
      throw UnimplementedError();
}
