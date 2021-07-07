import 'dart:io';

import 'package:objectbox/objectbox.dart';

import 'executor.dart';
import 'model.dart';
import 'objectbox.g.dart';
import 'time_tracker.dart';

class Executor<T extends TestEntity> extends ExecutorBase<T> {
  final Store store;
  late final Box<T> box;
  late final Query<T> queryStringEq;
  late final void Function(String) queryStringEqSetValue;

  Executor(Directory dbDir, TimeTracker tracker)
      : store = Store(getObjectBoxModel(), directory: dbDir.path),
        super(tracker) {
    box = store.box();
    if (T == TestEntityPlain) {
      final query = (box as Box<TestEntityPlain>)
          .query(TestEntityPlain_.tString
              .equals('', caseSensitive: ExecutorBase.caseSensitive))
          .build();
      final queryParam = query.param(TestEntityPlain_.tString);
      queryStringEqSetValue = (String val) => queryParam.value = val;
      queryStringEq = query as Query<T>;
    } else {
      final query = (box as Box<TestEntityIndexed>)
          .query(TestEntityIndexed_.tString
              .equals('', caseSensitive: ExecutorBase.caseSensitive))
          .build();
      final queryParam = query.param(TestEntityIndexed_.tString);
      queryStringEqSetValue = (String val) => queryParam.value = val;
      queryStringEq = query as Query<T>;
    }
  }

  Future<void> close() async => store.close();

  Future<void> insertMany(List<T> items) =>
      Future.value(tracker.track('insertMany', () => box.putMany(items)));

  Future<void> updateMany(List<T> items) =>
      Future.value(tracker.track('updateMany', () => box.putMany(items)));

  Future<List<T?>> readMany(List<int> ids) =>
      Future.value(tracker.track('readMany', () => box.getMany(ids)));

  Future<void> removeMany(List<int> ids) =>
      Future.value(tracker.track('removeMany', () => box.removeMany(ids)));

  Future<List<T>> queryStringEquals(String val) =>
      Future.value(tracker.track('queryStringEquals', () {
        queryStringEqSetValue(val);
        return queryStringEq.find();
      }));
}
