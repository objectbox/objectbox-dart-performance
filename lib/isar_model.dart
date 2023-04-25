import 'package:benchapp/model.dart';
import 'package:isar/isar.dart';

part 'isar_model.g.dart';

@collection
class IsarTestEntityPlain implements TestEntity {
  Id id;

  String tString;

  int tInt; // 32-bit

  int tLong; // 64-bit

  double tDouble;

  IsarTestEntityPlain(
      this.id, this.tString, this.tInt, this.tLong, this.tDouble);
}

// A separate entity for queried data so that indexes don't change CRUD results.
@Collection()
class IsarTestEntityIndexed implements TestEntity {
  Id id;

  @Index(type: IndexType.value)
  String tString;

  @Index()
  int tInt; // 32-bit

  int tLong; // 64-bit

  double tDouble;

  IsarTestEntityIndexed(
      this.id, this.tString, this.tInt, this.tLong, this.tDouble);
}

@collection
class IsarRelSourceEntityPlain implements RelSourceEntity {
  Id id;

  final String tString;

  final int tLong; // 64-bit

  @Ignore()
  final int relTargetId;

  final isarRelTarget = IsarLink<IsarRelTargetEntity>();

  // Note: constructor arg types must match with fromMap used by sqflite.
  IsarRelSourceEntityPlain(this.id, this.tString, this.tLong,
      [this.relTargetId = 0]) {}

  IsarRelSourceEntityPlain.forInsert(
      this.tString, this.tLong, IsarRelTargetEntity? relTarget)
      : id = 0,
        relTargetId = relTarget?.id ?? 0 {
    isarRelTarget.value = relTarget;
  }
}

@collection
class IsarRelSourceEntityIndexed implements RelSourceEntity {
  Id id;

  @Index(type: IndexType.value)
  final String tString;

  final int tLong; // 64-bit

  @Ignore()
  final int relTargetId;

  final isarRelTarget = IsarLink<IsarRelTargetEntity>();

  // Note: constructor arg types must match with fromMap used by sqflite.
  IsarRelSourceEntityIndexed(this.id, this.tString, this.tLong,
      [this.relTargetId = 0]);

  IsarRelSourceEntityIndexed.forInsert(
      this.tString, this.tLong, IsarRelTargetEntity? relTarget)
      : id = 0,
        relTargetId = relTarget?.id ?? 0 {
    isarRelTarget.value = relTarget;
  }
}

@collection
class IsarRelTargetEntity extends EntityWithSettableId {
  Id id;

  @Index(type: IndexType.value)
  String name;

  IsarRelTargetEntity(this.id, this.name);
}
