import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import 'executor.dart';
import 'time_tracker.dart';
import 'model.dart';

/// WARNING: outdated and unused
class Executor<T extends TestEntity> extends ExecutorBase<T> {
  final _boxName = T.toString();
  final FirebaseFirestore _store;
  late final CollectionReference<Map<String, dynamic>> _box;
  final T Function(Map<String, dynamic>) _fromMap;

  Executor._(this._store, TimeTracker tracker)
      : _fromMap = T == TestEntityPlain
            ? TestEntityPlain.fromMap as T Function(Map<String, dynamic>)
            : TestEntityIndexed.fromMap as T Function(Map<String, dynamic>),
        super(tracker) {
    _box = _store.collection(_boxName);
  }

  static Future<Executor<T>> create<T extends TestEntity>(
      Directory _, TimeTracker tracker) async {
    await Firebase.initializeApp();
    final store = FirebaseFirestore.instance;
    store.settings = Settings(cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);
    // Disabling network causes futures never to complete...
    // Is there another way of running in a local-only mode?
    // await store.disableNetwork();

    // remove old data
    final batch = store.batch();
    (await store.collection(T.toString()).get())
        .docs
        .forEach((doc) => batch.delete(doc.reference));
    await batch.commit();

    return Executor._(store, tracker);
  }

  Future<void> close() => _store.terminate();

  Future<void> insertMany(List<T> items) =>
      tracker.trackAsync('insertMany', () async {
        final batch = _store.batch();
        int id = 1;
        items.forEach((T o) {
          if (o.id == 0) o.id = id++;
          batch.set(_box.doc(o.id.toString()), TestEntity.toMap(o));
        });
        await batch.commit();
      });

  Future<void> updateMany(List<T> items) =>
      tracker.trackAsync('updateMany', () async {
        final batch = _store.batch();
        items.forEach((T o) {
          batch.set(_box.doc(o.id.toString()), TestEntity.toMap(o));
        });
        await batch.commit();
      });

  Future<List<T>> readMany(List<int> ids, [String? benchmarkQualifier]) =>
      tracker.track('readMany' + (benchmarkQualifier ?? ''),
          // doesn't work, filters support a maximum of 10 elements
          // () async => (await _box.where('id', whereIn: ids).get())
          //     .docs
          //     .map((doc) => fromMap(doc.data())).toList(growable: false));

          // Slow: iterate over all documents
          // () async => Future.wait(ids
          //     .map((id) => _box.doc(id.toString()).get())
          //     .map((e) async => fromMap((await e).data()))
          //     .toList(growable: false)));

          // iterate over query of all documents
          () async {
        final idsSet = ids.map((e) => e.toString()).toSet();
        return (await _box.get())
            .docs
            .where((snapshot) => idsSet.contains(snapshot.id))
            .map((snapshot) => _fromMap(snapshot.data()))
            .toList(growable: false);
      });

  Future<void> removeMany(List<int> ids) =>
      tracker.trackAsync('removeMany', () async {
        final batch = _store.batch();
        ids.forEach((int id) => batch.delete(_box.doc(id.toString())));
        await batch.commit();
      });
}
