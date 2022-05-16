import 'package:hive/hive.dart';
import 'package:isar/isar.dart';
import 'package:objectbox/objectbox.dart' as obx;

part 'model.g.dart';

abstract class EntityWithSettableId {
  int get id;
  set id(int value);
}

abstract class TestEntity extends EntityWithSettableId {
  String get tString;

  int get tInt; // 32-bit

  int get tLong; // 64-bit
  set tLong(int value);

  double get tDouble;

  static Map<String, dynamic> toMap(TestEntity object) => <String, dynamic>{
        'id': object.id == 0 ? null : object.id,
        'tString': object.tString,
        'tInt': object.tInt,
        'tLong': object.tLong,
        'tDouble': object.tDouble
      };
}

@obx.Entity()
@HiveType(typeId: 1)
@Collection()
class TestEntityPlain implements TestEntity {

  @HiveField(0)
  @Id()
  int id;

  @HiveField(1)
  String tString;

  @obx.Property(type: obx.PropertyType.int)
  @HiveField(2)
  int tInt; // 32-bit

  @HiveField(3)
  int tLong; // 64-bit

  @HiveField(4)
  double tDouble;

  TestEntityPlain(this.id, this.tString, this.tInt, this.tLong, this.tDouble);

  static TestEntityPlain fromMap(Map<String, dynamic> map) => TestEntityPlain(
      map['id'] ?? 0,
      map['tString'],
      map['tInt'],
      map['tLong'],
      map['tDouble']);
}

// A separate entity for queried data so that indexes don't change CRUD results.
@obx.Entity()
@HiveType(typeId: 2)
@Collection()
class TestEntityIndexed implements TestEntity {
  @HiveField(0)
  @Id()
  int id;

  @obx.Index()
  @HiveField(1)
  @Index(type: IndexType.value)
  String tString;

  @obx.Index()
  @obx.Property(type: obx.PropertyType.int)
  @HiveField(2)
  @Index()
  int tInt; // 32-bit

  @HiveField(3)
  int tLong; // 64-bit

  @HiveField(4)
  double tDouble;

  TestEntityIndexed(this.id, this.tString, this.tInt, this.tLong, this.tDouble);

  static TestEntityIndexed fromMap(Map<String, dynamic> map) =>
      TestEntityIndexed(map['id'] ?? 0, map['tString'], map['tInt'],
          map['tLong'], map['tDouble']);
}

abstract class RelSourceEntity extends EntityWithSettableId {
  int get id;

  set id(int value);

  String get tString;

  int get tLong;

  // for hive & sqflite
  int get relTargetId;

  static Map<String, dynamic> toMap(RelSourceEntity object) =>
      <String, dynamic>{
        'id': object.id == 0 ? null : object.id,
        'tString': object.tString,
        'tLong': object.tLong,
        'relTargetId': object.relTargetId,
      };
}

@obx.Entity()
@HiveType(typeId: 3)
@Collection()
class RelSourceEntityPlain implements RelSourceEntity {

  @HiveField(0)
  @Id()
  int id;

  @HiveField(1)
  final String tString;

  @HiveField(2)
  final int tLong; // 64-bit

  @Ignore()
  final obxRelTarget = obx.ToOne<RelTargetEntity>();

  @obx.Transient()
  @HiveField(3)
  @Ignore()
  final int relTargetId;

  final isarRelTarget = IsarLink<RelTargetEntity>();

  // Note: constructor arg types must match with fromMap used by sqflite.
  RelSourceEntityPlain(this.id, this.tString, this.tLong,
      [this.relTargetId = 0]) {
    obxRelTarget.targetId = relTargetId;
  }

  RelSourceEntityPlain.forInsert(
      this.tString, this.tLong, RelTargetEntity? relTarget)
      : id = 0,
        relTargetId = relTarget?.id ?? 0 {
    obxRelTarget.targetId = relTargetId;
    isarRelTarget.value = relTarget;
  }

  static RelSourceEntityPlain fromMap(Map<String, dynamic> map) =>
      RelSourceEntityPlain(
          map['id'] ?? 0, map['tString'], map['tLong'], map['relTargetId']);
}

@obx.Entity()
@HiveType(typeId: 4)
@Collection()
class RelSourceEntityIndexed implements RelSourceEntity {

  @HiveField(0)
  @Id()
  int id;

  @obx.Index()
  @HiveField(1)
  @Index(type: IndexType.value)
  final String tString;

  @HiveField(2)
  final int tLong; // 64-bit

  @Ignore()
  final obxRelTarget = obx.ToOne<RelTargetEntity>();

  @obx.Transient()
  @HiveField(3)
  @Ignore()
  final int relTargetId;

  final isarRelTarget = IsarLink<RelTargetEntity>();

  // Note: constructor arg types must match with fromMap used by sqflite.
  RelSourceEntityIndexed(this.id, this.tString, this.tLong,
      [this.relTargetId = 0]) {
    obxRelTarget.targetId = relTargetId;
  }

  RelSourceEntityIndexed.forInsert(
      this.tString, this.tLong, RelTargetEntity? relTarget)
      : id = 0,
        relTargetId = relTarget?.id ?? 0 {
    obxRelTarget.targetId = relTargetId;
    isarRelTarget.value = relTarget;
  }

  static RelSourceEntityIndexed fromMap(Map<String, dynamic> map) =>
      RelSourceEntityIndexed(
          map['id'] ?? 0, map['tString'], map['tLong'], map['relTargetId']);
}

@obx.Entity()
@HiveType(typeId: 5)
@Collection()
class RelTargetEntity extends EntityWithSettableId {

  @HiveField(0)
  @Id()
  int id;

  @obx.Index()
  @HiveField(1)
  @Index(type: IndexType.value)
  String name;

  RelTargetEntity(this.id, this.name);

  static Map<String, dynamic> toMap(RelTargetEntity object) =>
      <String, dynamic>{
        'id': object.id == 0 ? null : object.id,
        'name': object.name
      };

  static RelTargetEntity fromMap(Map<String, dynamic> map) =>
      RelTargetEntity(map['id'] ?? 0, map['name']);
}
