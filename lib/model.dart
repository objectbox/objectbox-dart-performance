import 'package:objectbox/objectbox.dart';
import 'package:hive/hive.dart';

part 'model.g.dart';

abstract class TestEntity {
  int get id;

  set id(int value);

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
class TestEntityIndexed implements TestEntity {
  @HiveField(0)
  int id;

  @Index()
  @HiveField(1)
  String tString;

  @Index()
  @Property(type: PropertyType.int)
  @HiveField(2)
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
