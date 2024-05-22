import 'dart:io';

import 'executor.dart';
import 'model.dart';
import 'objectbox.g.dart';
import 'time_tracker.dart';

abstract class Executor<T extends TestEntity> extends ExecutorBase<T> {
  final Store store;
  final Box<T> box;
  final Query<T> queryStringEq;
  final void Function(String) queryStringEqSetValue;

  Executor._(TimeTracker tracker, this.store, this.queryStringEq,
      this.queryStringEqSetValue)
      : box = store.box(),
        super(tracker);

  @override
  Future<void> close() async => store.close();

  @override
  Future<void> insertMany(List<T> items) =>
      Future.value(tracker.track('insertMany', () => box.putMany(items)));

  @override
  Future<void> updateMany(List<T> items) =>
      Future.value(tracker.track('updateMany', () => box.putMany(items)));

  @override
  Future<List<T>> readAll(List<int> ids) =>
      Future.value(tracker.track('readAll', () => box.getAll()));

  @override
  Future<List<T?>> queryById(List<int> ids, [String? benchmarkQualifier]) =>
      Future.value(tracker.track(
          'queryById' + (benchmarkQualifier ?? ''), () => box.getMany(ids)));

  @override
  Future<void> removeMany(List<int> ids) =>
      Future.value(tracker.track('removeMany', () => box.removeMany(ids)));

  @override
  Future<List<T>> queryStringEquals(List<String> values) =>
      Future.value(tracker.track(
          'queryStringEquals',
          () => store.runInTransaction(TxMode.read, () {
                late List<T> result;
                final length = values.length;
                for (var i = 0; i < length; i++) {
                  queryStringEqSetValue(values[i]);
                  result = queryStringEq.find();
                }
                return result;
              })));
}

/// Using an entity without indexes
class ExecutorPlain extends Executor<TestEntityPlain> {
  ExecutorPlain._(
      TimeTracker tracker,
      Store store,
      Query<TestEntityPlain> queryStringEq,
      void Function(String) queryStringEqSetValue)
      : super._(tracker, store, queryStringEq, queryStringEqSetValue);

  factory ExecutorPlain(Directory dbDir, TimeTracker tracker) {
    final store = Store(getObjectBoxModel(),
        directory: dbDir.path,
        queriesCaseSensitiveDefault: ExecutorBase.caseSensitive);

    final query = store
        .box<TestEntityPlain>()
        .query(TestEntityPlain_.tString.equals(''))
        .build();
    final queryParam = query.param(TestEntityPlain_.tString);
    queryStringEqSetValue(String val) => queryParam.value = val;

    return ExecutorPlain._(tracker, store, query, queryStringEqSetValue);
  }

  @override
  TestEntityPlain createEntity(
      String tString, int tInt, int tLong, double tDouble) {
    return TestEntityPlain(0, tString, tInt, tLong, tDouble);
  }

  @override
  Future<ExecutorBaseRel> createRelBenchmark() =>
      Future.value(ExecutorRel<RelSourceEntityPlain>(store, tracker));
}

/// Using an entity with indexes
class ExecutorIndexed extends Executor<TestEntityIndexed> {
  ExecutorIndexed._(
      TimeTracker tracker,
      Store store,
      Query<TestEntityIndexed> queryStringEq,
      void Function(String) queryStringEqSetValue)
      : super._(tracker, store, queryStringEq, queryStringEqSetValue);

  factory ExecutorIndexed(Directory dbDir, TimeTracker tracker) {
    final store = Store(getObjectBoxModel(),
        directory: dbDir.path,
        queriesCaseSensitiveDefault: ExecutorBase.caseSensitive);

    final query = store
        .box<TestEntityIndexed>()
        .query(TestEntityIndexed_.tString.equals(''))
        .build();
    final queryParam = query.param(TestEntityIndexed_.tString);
    queryStringEqSetValue(String val) => queryParam.value = val;

    return ExecutorIndexed._(tracker, store, query, queryStringEqSetValue);
  }

  @override
  TestEntityIndexed createEntity(
      String tString, int tInt, int tLong, double tDouble) {
    return TestEntityIndexed(0, tString, tInt, tLong, tDouble);
  }

  @override
  Future<ExecutorBaseRel> createRelBenchmark() =>
      Future.value(ExecutorRel<RelSourceEntityIndexed>(store, tracker));
}

class ExecutorRel<T extends RelSourceEntity> extends ExecutorBaseRel<T> {
  final Store store;
  final Box<T> box;
  final Query<T> query;
  final void Function(String, int, String) querySetParams;

  factory ExecutorRel(Store store, TimeTracker tracker) {
    late final void Function(String, int, String) querySetParams;
    late final Query<T> queryT;
    if (T == RelSourceEntityPlain) {
      final query = (store.box<RelSourceEntityPlain>().query(
              RelSourceEntityPlain_.tString.equals('') &
                  RelSourceEntityPlain_.tLong.equals(0))
            ..link(RelSourceEntityPlain_.obxRelTarget,
                RelTargetEntity_.name.equals('')))
          .build();
      final queryParam1 = query.param(RelSourceEntityPlain_.tString);
      final queryParam2 = query.param(RelSourceEntityPlain_.tLong);
      final queryParam3 = query.param(RelTargetEntity_.name);
      querySetParams = (String sourceStringEquals, int sourceIntEquals,
          String targetStringEquals) {
        queryParam1.value = sourceStringEquals;
        queryParam2.value = sourceIntEquals;
        queryParam3.value = targetStringEquals;
      };
      queryT = query as Query<T>;
    } else {
      final query = (store.box<RelSourceEntityIndexed>().query(
              RelSourceEntityIndexed_.tString.equals('') &
                  RelSourceEntityIndexed_.tLong.equals(0))
            ..link(RelSourceEntityIndexed_.obxRelTarget,
                RelTargetEntity_.name.equals('')))
          .build();
      final queryParam1 = query.param(RelSourceEntityIndexed_.tString);
      final queryParam2 = query.param(RelSourceEntityIndexed_.tLong);
      final queryParam3 = query.param(RelTargetEntity_.name);
      querySetParams = (String sourceStringEquals, int sourceIntEquals,
          String targetStringEquals) {
        queryParam1.value = sourceStringEquals;
        queryParam2.value = sourceIntEquals;
        queryParam3.value = targetStringEquals;
      };
      queryT = query as Query<T>;
    }
    return ExecutorRel._(tracker, store, queryT, querySetParams);
  }

  ExecutorRel._(
      TimeTracker tracker, this.store, this.query, this.querySetParams)
      : box = store.box(),
        super(tracker);

  @override
  Future<void> close() async {
    // Do nothing, store is closed by Executor.
  }

  @override
  Future<void> insertData(int relSourceCount, int relTargetCount) =>
      Future.sync(() {
        final targets = prepareDataTargets(relTargetCount);
        store.box<RelTargetEntity>().putMany(targets);
        final sources = prepareDataSources(relSourceCount, targets);
        box.putMany(sources);
        assert(box.count() == relSourceCount);
        assert(store.box<RelTargetEntity>().count() == relTargetCount);
      });

  @override
  Future<List<T>> queryWithLinks(List<ConfigQueryWithLinks> args) =>
      Future.value(tracker.track(
          'queryWithLinks',
          () => store.runInTransaction(TxMode.read, () {
                late List<T> result;
                final length = args.length;
                for (var i = 0; i < length; i++) {
                  querySetParams(args[i].sourceStringEquals,
                      args[i].sourceIntEquals, args[i].targetStringEquals);
                  result = query.find();
                }
                return result;
              })));
}
