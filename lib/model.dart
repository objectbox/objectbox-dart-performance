import 'package:objectbox/objectbox.dart';
import 'package:hive/hive.dart';

part 'model.g.dart';

@Entity()
@HiveType(typeId : 1)
class TestEntity {
  @Id()
  @HiveField(0)
  int /*?*/ id;

  @HiveField(1)
  String /*?*/ tString;

  @Property(type: PropertyType.int)
  @HiveField(2)
  int /*?*/ tInt; // 32-bit

  @HiveField(3)
  int /*?*/ tLong; // 64-bit

  @HiveField(4)
  double /*?*/ tDouble;

  TestEntity();

  TestEntity.full(this.id, this.tString, this.tInt, this.tLong, this.tDouble);
}
