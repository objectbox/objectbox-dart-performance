import 'model.dart';
import 'time_tracker.dart';

abstract class ExecutorBase<T extends TestEntity> {
  static const caseSensitive = true;

  final TimeTracker _tracker;

  TimeTracker get tracker => _tracker;

  ExecutorBase(this._tracker);

  Future<void> close();

  List<T> prepareData(int count) => List.generate(
      count,
      (i) => T == TestEntityPlain
          ? TestEntityPlain(0, 'Entity #$i', i, i, i.toDouble()) as T
          : TestEntityIndexed(0, 'Entity #$i', i, i, i.toDouble()) as T,
      growable: false);

  void changeValues(List<T> items) => items.forEach((item) => item.tLong *= 2);

  List<T> allNotNull(List<T?> items) =>
      items.map((e) => e!).toList(growable: false);

  Future<void> insertMany(List<T> items);

  Future<void> updateMany(List<T> items);

  Future<List<T?>> readMany(List<int> ids);

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
}
