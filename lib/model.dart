import 'package:hive/hive.dart';
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
class TestEntityPlain implements TestEntity {
  @override
  @HiveField(0)
  int id;

  @override
  @HiveField(1)
  String tString;

  @override
  @obx.Property(type: obx.PropertyType.int)
  @HiveField(2)
  int tInt; // 32-bit

  @override
  @HiveField(3)
  int tLong; // 64-bit

  @override
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
class TestEntityIndexed implements TestEntity {
  @override
  int id;

  @override
  @obx.Index()
  String tString;

  @override
  @obx.Index()
  @obx.Property(type: obx.PropertyType.int)
  int tInt; // 32-bit

  @override
  int tLong; // 64-bit

  @override
  double tDouble;

  TestEntityIndexed(this.id, this.tString, this.tInt, this.tLong, this.tDouble);

  static TestEntityIndexed fromMap(Map<String, dynamic> map) =>
      TestEntityIndexed(map['id'] ?? 0, map['tString'], map['tInt'],
          map['tLong'], map['tDouble']);
}

abstract class RelSourceEntity extends EntityWithSettableId {
  @override
  int get id;

  @override
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
@HiveType(typeId: 2)
class RelSourceEntityPlain implements RelSourceEntity {
  @override
  @HiveField(0)
  int id;

  @override
  @HiveField(1)
  final String tString;

  @override
  @HiveField(2)
  final int tLong; // 64-bit

  final obxRelTarget = obx.ToOne<RelTargetEntity>();

  @override
  @obx.Transient()
  @HiveField(3)
  final int relTargetId;

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
  }

  static RelSourceEntityPlain fromMap(Map<String, dynamic> map) =>
      RelSourceEntityPlain(
          map['id'] ?? 0, map['tString'], map['tLong'], map['relTargetId']);
}

@obx.Entity()
class RelSourceEntityIndexed implements RelSourceEntity {
  @override
  int id;

  @override
  @obx.Index()
  final String tString;

  @override
  final int tLong; // 64-bit

  final obxRelTarget = obx.ToOne<RelTargetEntity>();

  @override
  @obx.Transient()
  final int relTargetId;

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
  }

  static RelSourceEntityIndexed fromMap(Map<String, dynamic> map) =>
      RelSourceEntityIndexed(
          map['id'] ?? 0, map['tString'], map['tLong'], map['relTargetId']);
}

@obx.Entity()
@HiveType(typeId: 4)
class RelTargetEntity extends EntityWithSettableId {
  @override
  @HiveField(0)
  int id;

  @obx.Index()
  @HiveField(1)
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
