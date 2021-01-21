import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import 'executor.dart';
import 'time_tracker.dart';
import 'model.dart';

class Executor extends ExecutorBase {
  final FirebaseFirestore _store;

  Executor._(this._store, TimeTracker tracker) : super(tracker);

  static Future<Executor> create(Directory dbDir, TimeTracker tracker) async {
    await Firebase.initializeApp();
    return Executor._(FirebaseFirestore.instance, tracker);
  }

  void close() => _store.terminate();

  Future<void> insertMany(List<TestEntity> items) =>
      Future.value(tracker.track('insertMany', () => null));

  Future<void> updateMany(List<TestEntity> items) =>
      Future.value(tracker.track('updateMany', () => null));

  Future<List<TestEntity>> readMany(List<int> ids) =>
      Future.value(tracker.track('readMany', () => []));

  Future<void> removeMany(List<int> ids) =>
      Future.value(tracker.track('removeMany', () => []));
}
