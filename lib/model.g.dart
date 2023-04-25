// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TestEntityPlainAdapter extends TypeAdapter<TestEntityPlain> {
  @override
  final int typeId = 1;

  @override
  TestEntityPlain read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TestEntityPlain(
      fields[0] as int,
      fields[1] as String,
      fields[2] as int,
      fields[3] as int,
      fields[4] as double,
    );
  }

  @override
  void write(BinaryWriter writer, TestEntityPlain obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.tString)
      ..writeByte(2)
      ..write(obj.tInt)
      ..writeByte(3)
      ..write(obj.tLong)
      ..writeByte(4)
      ..write(obj.tDouble);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TestEntityPlainAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RelSourceEntityPlainAdapter extends TypeAdapter<RelSourceEntityPlain> {
  @override
  final int typeId = 2;

  @override
  RelSourceEntityPlain read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RelSourceEntityPlain(
      fields[0] as int,
      fields[1] as String,
      fields[2] as int,
      fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, RelSourceEntityPlain obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.tString)
      ..writeByte(2)
      ..write(obj.tLong)
      ..writeByte(3)
      ..write(obj.relTargetId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RelSourceEntityPlainAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RelTargetEntityAdapter extends TypeAdapter<RelTargetEntity> {
  @override
  final int typeId = 4;

  @override
  RelTargetEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RelTargetEntity(
      fields[0] as int,
      fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, RelTargetEntity obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RelTargetEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
