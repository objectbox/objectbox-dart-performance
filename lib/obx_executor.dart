import 'dart:io';

import 'package:objectbox/objectbox.dart';

import 'executor.dart';
import 'model.dart';
import 'objectbox.g.dart';
import 'time_tracker.dart';

class Executor<T extends TestEntity> extends ExecutorBase<T> {
  final Store store;
  final Box<T> box;
  final Query<T> queryStringEq;
  final void Function(String) queryStringEqSetValue;

  factory Executor(Directory dbDir, TimeTracker tracker) {
    final store = Store(getObjectBoxModel(),
        directory: dbDir.path,
        queriesCaseSensitiveDefault: ExecutorBase.caseSensitive);
    late final Query<T> queryStringEq;
    late final void Function(String) queryStringEqSetValue;
    if (T == TestEntityPlain) {
      final query = store
          .box<TestEntityPlain>()
          .query(TestEntityPlain_.tString.equals(''))
          .build();
      final queryParam = query.param(TestEntityPlain_.tString);
      queryStringEqSetValue = (String val) => queryParam.value = val;
      queryStringEq = query as Query<T>;
    } else {
      final query = store
          .box<TestEntityIndexed>()
          .query(TestEntityIndexed_.tString.equals(''))
          .build();
      final queryParam = query.param(TestEntityIndexed_.tString);
      queryStringEqSetValue = (String val) => queryParam.value = val;
      queryStringEq = query as Query<T>;
    }
    return Executor._(tracker, store, queryStringEq, queryStringEqSetValue);
  }

  Executor._(TimeTracker tracker, this.store, this.queryStringEq,
      this.queryStringEqSetValue)
      : box = store.box(),
        super(tracker);

  Future<void> close() async => store.close();

  Future<void> insertMany(List<T> items) =>
      Future.value(tracker.track('insertMany', () => box.putMany(items)));

  Future<void> updateMany(List<T> items) =>
      Future.value(tracker.track('updateMany', () => box.putMany(items)));

  Future<List<T?>> readMany(List<int> ids, [String? benchmarkQualifier]) =>
      Future.value(tracker.track(
          'readMany' + (benchmarkQualifier ?? ''), () => box.getMany(ids)));

  Future<void> removeMany(List<int> ids) =>
      Future.value(tracker.track('removeMany', () => box.removeMany(ids)));

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

  Future<ExecutorBaseRel> createRelBenchmark() => Future.value(indexed
      ? ExecutorRel<RelSourceEntityIndexed>(store, tracker)
      : ExecutorRel<RelSourceEntityPlain>(store, tracker));
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

  Future<void> close() async => store.close();

  Future<void> insertData(int relSourceCount, int relTargetCount) =>
      Future.sync(() {
        final targets = prepareDataTargets(relTargetCount);
        store.box<RelTargetEntity>().putMany(targets);
        final sources = prepareDataSources(relSourceCount, targets);
        box.putMany(sources);
        assert(box.count() == relSourceCount);
        assert(store.box<RelTargetEntity>().count() == relTargetCount);
      });

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
