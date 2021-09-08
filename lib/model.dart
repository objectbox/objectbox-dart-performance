import 'package:hive/hive.dart';
import 'package:isar/isar.dart' as isar;
import 'package:objectbox/objectbox.dart';

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

@Entity()
@HiveType(typeId: 1)
@isar.Collection()
class TestEntityPlain implements TestEntity {
  @HiveField(0)
  int id;

  @HiveField(1)
  String tString;

  @Property(type: PropertyType.int)
  @HiveField(2)
  int tInt; // 32-bit

  @HiveField(3)
  int tLong; // 64-bit

  @HiveField(4)
  double tDouble;

  TestEntityPlain(this.id, this.tString, this.tInt, this.tLong, this.tDouble);

  // TODO remove later; isar v0.4.0 needs a "public zero-arg constructor"
  // NOTE: you also need to fix isar.g.dart after each generation to use this
  // constructor.
  TestEntityPlain.forIsar()
      : id = 0,
        tString = '',
        tInt = 0,
        tLong = 0,
        tDouble = 0;

  static TestEntityPlain fromMap(Map<String, dynamic> map) => TestEntityPlain(
      map['id'] ?? 0,
      map['tString'],
      map['tInt'],
      map['tLong'],
      map['tDouble']);
}

// A separate entity for queried data so that indexes don't change CRUD results.
@Entity()
@HiveType(typeId: 2)
@isar.Collection()
class TestEntityIndexed implements TestEntity {
  @HiveField(0)
  int id;

  @Index()
  @HiveField(1)
  @isar.Index(indexType: isar.IndexType.value)
  String tString;

  @Index()
  @Property(type: PropertyType.int)
  @HiveField(2)
  @isar.Index()
  int tInt; // 32-bit

  @HiveField(3)
  int tLong; // 64-bit

  @HiveField(4)
  double tDouble;

  TestEntityIndexed(this.id, this.tString, this.tInt, this.tLong, this.tDouble);

  TestEntityIndexed.forIsar()
      : id = 0,
        tString = '',
        tInt = 0,
        tLong = 0,
        tDouble = 0;

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

@Entity()
@HiveType(typeId: 3)
@isar.Collection()
class RelSourceEntityPlain implements RelSourceEntity {
  @HiveField(0)
  int id;

  @HiveField(1)
  final String tString;

  @HiveField(2)
  final int tLong; // 64-bit

  @isar.Ignore()
  final obxRelTarget = ToOne<RelTargetEntity>();

  @Transient()
  @HiveField(3)
  @isar.Ignore()
  final int relTargetId;

  final isarRelTarget = isar.IsarLink<RelTargetEntity>();

  // Note: constructor arg types must match with fromMap used by sqflite.
  RelSourceEntityPlain(this.id, this.tString, this.tLong,
      [this.relTargetId = 0]) {
    obxRelTarget.targetId = relTargetId;
  }

  RelSourceEntityPlain.forInsert(
      this.tString, this.tLong, RelTargetEntity? relTarget)
      : id = 0,
        relTargetId = relTarget?.id ?? 0 {
    isarRelTarget.value = relTarget;
  }

  RelSourceEntityPlain.forIsar()
      : id = 0,
        tString = '',
        tLong = 0,
        relTargetId = 0;

  static RelSourceEntityPlain fromMap(Map<String, dynamic> map) =>
      RelSourceEntityPlain(
          map['id'] ?? 0, map['tString'], map['tLong'], map['relTargetId']);
}

@Entity()
@HiveType(typeId: 4)
@isar.Collection()
class RelSourceEntityIndexed implements RelSourceEntity {
  @HiveField(0)
  int id;

  @Index()
  @HiveField(1)
  @isar.Index(indexType: isar.IndexType.value)
  final String tString;

  @HiveField(2)
  final int tLong; // 64-bit

  @isar.Ignore()
  final obxRelTarget = ToOne<RelTargetEntity>();

  @Transient()
  @HiveField(3)
  @isar.Ignore()
  final int relTargetId;

  final isarRelTarget = isar.IsarLink<RelTargetEntity>();

  // Note: constructor arg types must match with fromMap used by sqflite.
  RelSourceEntityIndexed(this.id, this.tString, this.tLong,
      [this.relTargetId = 0]) {
    obxRelTarget.targetId = relTargetId;
  }

  RelSourceEntityIndexed.forInsert(
      this.tString, this.tLong, RelTargetEntity? relTarget)
      : id = 0,
        relTargetId = relTarget?.id ?? 0 {
    isarRelTarget.value = relTarget;
  }

  RelSourceEntityIndexed.forIsar()
      : id = 0,
        tString = '',
        tLong = 0,
        relTargetId = 0;

  static RelSourceEntityIndexed fromMap(Map<String, dynamic> map) =>
      RelSourceEntityIndexed(
          map['id'] ?? 0, map['tString'], map['tLong'], map['relTargetId']);
}

@Entity()
@HiveType(typeId: 5)
@isar.Collection()
class RelTargetEntity extends EntityWithSettableId {
  @HiveField(0)
  int id;

  @HiveField(1)
  String name;

  RelTargetEntity(this.id, this.name);

  RelTargetEntity.forIsar()
      : id = 0,
        name = '';

  static Map<String, dynamic> toMap(RelTargetEntity object) =>
      <String, dynamic>{
        'id': object.id == 0 ? null : object.id,
        'name': object.name
      };

  static RelTargetEntity fromMap(Map<String, dynamic> map) =>
      RelTargetEntity(map['id'] ?? 0, map['name']);
}
