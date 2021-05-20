import 'dart:io';

import 'package:benchapp/executor.dart';
import 'package:benchapp/isar.g.dart';
import 'package:benchapp/model.dart';
import 'package:isar/isar.dart';

import 'package:benchapp/time_tracker.dart';

class Executor extends ExecutorBase {
  final Isar _box;
  Isar get _boxIndexed => _box;

  Executor._(this._box, TimeTracker tracker) : super(tracker);

  static Future<Executor> create(Directory dbDir, TimeTracker tracker) async {
    return Executor._(await openIsar(directory: dbDir.path), tracker);
  }

  Future<void> close() => _box.close();

  Future<void> insertMany(List<TestEntity> items) => Future.value(
        tracker.track(
          'insertMany',
          () {
            for (int i = 0; i < items.length; i++) {
              items[i].id = i;
            }

            return _box.writeTxnSync(
              (isar) => isar.testEntitys.putAllSync(items),
            );
          },
        ),
      );

  Future<void> insertManyIndexed(List<TestEntityIndexed> items) => Future.value(
        tracker.track(
          'insertManyIndexed',
          () {
            for (int i = 0; i < items.length; i++) {
              items[i].id = i;
            }

            return _box.writeTxnSync(
              (isar) => isar.testEntityIndexeds.putAllSync(items),
            );
          },
        ),
      );

  Future<void> updateMany(List<TestEntity> items) => Future.value(tracker.track(
      'updateMany',
      () => _box.writeTxnSync((isar) => isar.testEntitys.putAllSync(items))));

  Future<List<TestEntity?>> readMany(List<int> ids) => Future.value(
      tracker.track('readMany', () => _box.testEntitys.getAllSync(ids)));

  Future<void> removeMany(List<int> ids) => Future.value(
        tracker.track(
            'removeMany',
            () => _box.writeTxnSync(
                (Isar isar) => isar.testEntitys.deleteAllSync(ids))),
      );

  Future<List<TestEntityIndexed>> queryStringEquals(String val) async =>
      tracker.trackAsync(
        'queryStringEquals',
        () => _boxIndexed.testEntityIndexeds
            .where()
            .tStringEqualTo(val)
            .findAll(),
      );
}
