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

class TestEntityIndexedAdapter extends TypeAdapter<TestEntityIndexed> {
  @override
  final int typeId = 2;

  @override
  TestEntityIndexed read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TestEntityIndexed(
      fields[0] as int,
      fields[1] as String,
      fields[2] as int,
      fields[3] as int,
      fields[4] as double,
    );
  }

  @override
  void write(BinaryWriter writer, TestEntityIndexed obj) {
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
      other is TestEntityIndexedAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RelSourceEntityPlainAdapter extends TypeAdapter<RelSourceEntityPlain> {
  @override
  final int typeId = 3;

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

class RelSourceEntityIndexedAdapter
    extends TypeAdapter<RelSourceEntityIndexed> {
  @override
  final int typeId = 4;

  @override
  RelSourceEntityIndexed read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RelSourceEntityIndexed(
      fields[0] as int,
      fields[1] as String,
      fields[2] as int,
      fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, RelSourceEntityIndexed obj) {
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
      other is RelSourceEntityIndexedAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RelTargetEntityAdapter extends TypeAdapter<RelTargetEntity> {
  @override
  final int typeId = 5;

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

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetTestEntityPlainCollection on Isar {
  IsarCollection<TestEntityPlain> get testEntityPlains => getCollection();
}

const TestEntityPlainSchema = CollectionSchema(
  name: 'TestEntityPlain',
  schema:
      '{"name":"TestEntityPlain","idName":"id","properties":[{"name":"tDouble","type":"Double"},{"name":"tInt","type":"Long"},{"name":"tLong","type":"Long"},{"name":"tString","type":"String"}],"indexes":[],"links":[]}',
  idName: 'id',
  propertyIds: {'tDouble': 0, 'tInt': 1, 'tLong': 2, 'tString': 3},
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {},
  backlinkLinkNames: {},
  getId: _testEntityPlainGetId,
  setId: _testEntityPlainSetId,
  getLinks: _testEntityPlainGetLinks,
  attachLinks: _testEntityPlainAttachLinks,
  serializeNative: _testEntityPlainSerializeNative,
  deserializeNative: _testEntityPlainDeserializeNative,
  deserializePropNative: _testEntityPlainDeserializePropNative,
  serializeWeb: _testEntityPlainSerializeWeb,
  deserializeWeb: _testEntityPlainDeserializeWeb,
  deserializePropWeb: _testEntityPlainDeserializePropWeb,
  version: 3,
);

int? _testEntityPlainGetId(TestEntityPlain object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _testEntityPlainSetId(TestEntityPlain object, int id) {
  object.id = id;
}

List<IsarLinkBase> _testEntityPlainGetLinks(TestEntityPlain object) {
  return [];
}

void _testEntityPlainSerializeNative(
    IsarCollection<TestEntityPlain> collection,
    IsarRawObject rawObj,
    TestEntityPlain object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.tDouble;
  final _tDouble = value0;
  final value1 = object.tInt;
  final _tInt = value1;
  final value2 = object.tLong;
  final _tLong = value2;
  final value3 = object.tString;
  final _tString = IsarBinaryWriter.utf8Encoder.convert(value3);
  dynamicSize += (_tString.length) as int;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeDouble(offsets[0], _tDouble);
  writer.writeLong(offsets[1], _tInt);
  writer.writeLong(offsets[2], _tLong);
  writer.writeBytes(offsets[3], _tString);
}

TestEntityPlain _testEntityPlainDeserializeNative(
    IsarCollection<TestEntityPlain> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = TestEntityPlain(
    id,
    reader.readString(offsets[3]),
    reader.readLong(offsets[1]),
    reader.readLong(offsets[2]),
    reader.readDouble(offsets[0]),
  );
  return object;
}

P _testEntityPlainDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _testEntityPlainSerializeWeb(
    IsarCollection<TestEntityPlain> collection, TestEntityPlain object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'tDouble', object.tDouble);
  IsarNative.jsObjectSet(jsObj, 'tInt', object.tInt);
  IsarNative.jsObjectSet(jsObj, 'tLong', object.tLong);
  IsarNative.jsObjectSet(jsObj, 'tString', object.tString);
  return jsObj;
}

TestEntityPlain _testEntityPlainDeserializeWeb(
    IsarCollection<TestEntityPlain> collection, dynamic jsObj) {
  final object = TestEntityPlain(
    IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity,
    IsarNative.jsObjectGet(jsObj, 'tString') ?? '',
    IsarNative.jsObjectGet(jsObj, 'tInt') ?? double.negativeInfinity,
    IsarNative.jsObjectGet(jsObj, 'tLong') ?? double.negativeInfinity,
    IsarNative.jsObjectGet(jsObj, 'tDouble') ?? double.negativeInfinity,
  );
  return object;
}

P _testEntityPlainDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
          as P;
    case 'tDouble':
      return (IsarNative.jsObjectGet(jsObj, 'tDouble') ??
          double.negativeInfinity) as P;
    case 'tInt':
      return (IsarNative.jsObjectGet(jsObj, 'tInt') ?? double.negativeInfinity)
          as P;
    case 'tLong':
      return (IsarNative.jsObjectGet(jsObj, 'tLong') ?? double.negativeInfinity)
          as P;
    case 'tString':
      return (IsarNative.jsObjectGet(jsObj, 'tString') ?? '') as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _testEntityPlainAttachLinks(
    IsarCollection col, int id, TestEntityPlain object) {}

extension TestEntityPlainQueryWhereSort
    on QueryBuilder<TestEntityPlain, TestEntityPlain, QWhere> {
  QueryBuilder<TestEntityPlain, TestEntityPlain, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension TestEntityPlainQueryWhere
    on QueryBuilder<TestEntityPlain, TestEntityPlain, QWhereClause> {
  QueryBuilder<TestEntityPlain, TestEntityPlain, QAfterWhereClause> idEqualTo(
      int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<TestEntityPlain, TestEntityPlain, QAfterWhereClause>
      idNotEqualTo(int id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      ).addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      );
    } else {
      return addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      ).addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      );
    }
  }

  QueryBuilder<TestEntityPlain, TestEntityPlain, QAfterWhereClause>
      idGreaterThan(int id, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<TestEntityPlain, TestEntityPlain, QAfterWhereClause> idLessThan(
      int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<TestEntityPlain, TestEntityPlain, QAfterWhereClause> idBetween(
    int lowerId,
    int upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: lowerId,
      includeLower: includeLower,
      upper: upperId,
      includeUpper: includeUpper,
    ));
  }
}

extension TestEntityPlainQueryFilter
    on QueryBuilder<TestEntityPlain, TestEntityPlain, QFilterCondition> {
  QueryBuilder<TestEntityPlain, TestEntityPlain, QAfterFilterCondition>
      idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<TestEntityPlain, TestEntityPlain, QAfterFilterCondition>
      idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<TestEntityPlain, TestEntityPlain, QAfterFilterCondition>
      idLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<TestEntityPlain, TestEntityPlain, QAfterFilterCondition>
      idBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<TestEntityPlain, TestEntityPlain, QAfterFilterCondition>
      tDoubleGreaterThan(double value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: false,
      property: 'tDouble',
      value: value,
    ));
  }

  QueryBuilder<TestEntityPlain, TestEntityPlain, QAfterFilterCondition>
      tDoubleLessThan(double value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: false,
      property: 'tDouble',
      value: value,
    ));
  }

  QueryBuilder<TestEntityPlain, TestEntityPlain, QAfterFilterCondition>
      tDoubleBetween(double lower, double upper) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'tDouble',
      lower: lower,
      includeLower: false,
      upper: upper,
      includeUpper: false,
    ));
  }

  QueryBuilder<TestEntityPlain, TestEntityPlain, QAfterFilterCondition>
      tIntEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'tInt',
      value: value,
    ));
  }

  QueryBuilder<TestEntityPlain, TestEntityPlain, QAfterFilterCondition>
      tIntGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'tInt',
      value: value,
    ));
  }

  QueryBuilder<TestEntityPlain, TestEntityPlain, QAfterFilterCondition>
      tIntLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'tInt',
      value: value,
    ));
  }

  QueryBuilder<TestEntityPlain, TestEntityPlain, QAfterFilterCondition>
      tIntBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'tInt',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<TestEntityPlain, TestEntityPlain, QAfterFilterCondition>
      tLongEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'tLong',
      value: value,
    ));
  }

  QueryBuilder<TestEntityPlain, TestEntityPlain, QAfterFilterCondition>
      tLongGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'tLong',
      value: value,
    ));
  }

  QueryBuilder<TestEntityPlain, TestEntityPlain, QAfterFilterCondition>
      tLongLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'tLong',
      value: value,
    ));
  }

  QueryBuilder<TestEntityPlain, TestEntityPlain, QAfterFilterCondition>
      tLongBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'tLong',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<TestEntityPlain, TestEntityPlain, QAfterFilterCondition>
      tStringEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'tString',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TestEntityPlain, TestEntityPlain, QAfterFilterCondition>
      tStringGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'tString',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TestEntityPlain, TestEntityPlain, QAfterFilterCondition>
      tStringLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'tString',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TestEntityPlain, TestEntityPlain, QAfterFilterCondition>
      tStringBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'tString',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TestEntityPlain, TestEntityPlain, QAfterFilterCondition>
      tStringStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'tString',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TestEntityPlain, TestEntityPlain, QAfterFilterCondition>
      tStringEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'tString',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TestEntityPlain, TestEntityPlain, QAfterFilterCondition>
      tStringContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'tString',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TestEntityPlain, TestEntityPlain, QAfterFilterCondition>
      tStringMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'tString',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension TestEntityPlainQueryLinks
    on QueryBuilder<TestEntityPlain, TestEntityPlain, QFilterCondition> {}

extension TestEntityPlainQueryWhereSortBy
    on QueryBuilder<TestEntityPlain, TestEntityPlain, QSortBy> {
  QueryBuilder<TestEntityPlain, TestEntityPlain, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<TestEntityPlain, TestEntityPlain, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<TestEntityPlain, TestEntityPlain, QAfterSortBy> sortByTDouble() {
    return addSortByInternal('tDouble', Sort.asc);
  }

  QueryBuilder<TestEntityPlain, TestEntityPlain, QAfterSortBy>
      sortByTDoubleDesc() {
    return addSortByInternal('tDouble', Sort.desc);
  }

  QueryBuilder<TestEntityPlain, TestEntityPlain, QAfterSortBy> sortByTInt() {
    return addSortByInternal('tInt', Sort.asc);
  }

  QueryBuilder<TestEntityPlain, TestEntityPlain, QAfterSortBy>
      sortByTIntDesc() {
    return addSortByInternal('tInt', Sort.desc);
  }

  QueryBuilder<TestEntityPlain, TestEntityPlain, QAfterSortBy> sortByTLong() {
    return addSortByInternal('tLong', Sort.asc);
  }

  QueryBuilder<TestEntityPlain, TestEntityPlain, QAfterSortBy>
      sortByTLongDesc() {
    return addSortByInternal('tLong', Sort.desc);
  }

  QueryBuilder<TestEntityPlain, TestEntityPlain, QAfterSortBy> sortByTString() {
    return addSortByInternal('tString', Sort.asc);
  }

  QueryBuilder<TestEntityPlain, TestEntityPlain, QAfterSortBy>
      sortByTStringDesc() {
    return addSortByInternal('tString', Sort.desc);
  }
}

extension TestEntityPlainQueryWhereSortThenBy
    on QueryBuilder<TestEntityPlain, TestEntityPlain, QSortThenBy> {
  QueryBuilder<TestEntityPlain, TestEntityPlain, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<TestEntityPlain, TestEntityPlain, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<TestEntityPlain, TestEntityPlain, QAfterSortBy> thenByTDouble() {
    return addSortByInternal('tDouble', Sort.asc);
  }

  QueryBuilder<TestEntityPlain, TestEntityPlain, QAfterSortBy>
      thenByTDoubleDesc() {
    return addSortByInternal('tDouble', Sort.desc);
  }

  QueryBuilder<TestEntityPlain, TestEntityPlain, QAfterSortBy> thenByTInt() {
    return addSortByInternal('tInt', Sort.asc);
  }

  QueryBuilder<TestEntityPlain, TestEntityPlain, QAfterSortBy>
      thenByTIntDesc() {
    return addSortByInternal('tInt', Sort.desc);
  }

  QueryBuilder<TestEntityPlain, TestEntityPlain, QAfterSortBy> thenByTLong() {
    return addSortByInternal('tLong', Sort.asc);
  }

  QueryBuilder<TestEntityPlain, TestEntityPlain, QAfterSortBy>
      thenByTLongDesc() {
    return addSortByInternal('tLong', Sort.desc);
  }

  QueryBuilder<TestEntityPlain, TestEntityPlain, QAfterSortBy> thenByTString() {
    return addSortByInternal('tString', Sort.asc);
  }

  QueryBuilder<TestEntityPlain, TestEntityPlain, QAfterSortBy>
      thenByTStringDesc() {
    return addSortByInternal('tString', Sort.desc);
  }
}

extension TestEntityPlainQueryWhereDistinct
    on QueryBuilder<TestEntityPlain, TestEntityPlain, QDistinct> {
  QueryBuilder<TestEntityPlain, TestEntityPlain, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<TestEntityPlain, TestEntityPlain, QDistinct>
      distinctByTDouble() {
    return addDistinctByInternal('tDouble');
  }

  QueryBuilder<TestEntityPlain, TestEntityPlain, QDistinct> distinctByTInt() {
    return addDistinctByInternal('tInt');
  }

  QueryBuilder<TestEntityPlain, TestEntityPlain, QDistinct> distinctByTLong() {
    return addDistinctByInternal('tLong');
  }

  QueryBuilder<TestEntityPlain, TestEntityPlain, QDistinct> distinctByTString(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('tString', caseSensitive: caseSensitive);
  }
}

extension TestEntityPlainQueryProperty
    on QueryBuilder<TestEntityPlain, TestEntityPlain, QQueryProperty> {
  QueryBuilder<TestEntityPlain, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<TestEntityPlain, double, QQueryOperations> tDoubleProperty() {
    return addPropertyNameInternal('tDouble');
  }

  QueryBuilder<TestEntityPlain, int, QQueryOperations> tIntProperty() {
    return addPropertyNameInternal('tInt');
  }

  QueryBuilder<TestEntityPlain, int, QQueryOperations> tLongProperty() {
    return addPropertyNameInternal('tLong');
  }

  QueryBuilder<TestEntityPlain, String, QQueryOperations> tStringProperty() {
    return addPropertyNameInternal('tString');
  }
}

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetTestEntityIndexedCollection on Isar {
  IsarCollection<TestEntityIndexed> get testEntityIndexeds => getCollection();
}

const TestEntityIndexedSchema = CollectionSchema(
  name: 'TestEntityIndexed',
  schema:
      '{"name":"TestEntityIndexed","idName":"id","properties":[{"name":"tDouble","type":"Double"},{"name":"tInt","type":"Long"},{"name":"tLong","type":"Long"},{"name":"tString","type":"String"}],"indexes":[{"name":"tInt","unique":false,"properties":[{"name":"tInt","type":"Value","caseSensitive":false}]},{"name":"tString","unique":false,"properties":[{"name":"tString","type":"Value","caseSensitive":true}]}],"links":[]}',
  idName: 'id',
  propertyIds: {'tDouble': 0, 'tInt': 1, 'tLong': 2, 'tString': 3},
  listProperties: {},
  indexIds: {'tInt': 0, 'tString': 1},
  indexValueTypes: {
    'tInt': [
      IndexValueType.long,
    ],
    'tString': [
      IndexValueType.string,
    ]
  },
  linkIds: {},
  backlinkLinkNames: {},
  getId: _testEntityIndexedGetId,
  setId: _testEntityIndexedSetId,
  getLinks: _testEntityIndexedGetLinks,
  attachLinks: _testEntityIndexedAttachLinks,
  serializeNative: _testEntityIndexedSerializeNative,
  deserializeNative: _testEntityIndexedDeserializeNative,
  deserializePropNative: _testEntityIndexedDeserializePropNative,
  serializeWeb: _testEntityIndexedSerializeWeb,
  deserializeWeb: _testEntityIndexedDeserializeWeb,
  deserializePropWeb: _testEntityIndexedDeserializePropWeb,
  version: 3,
);

int? _testEntityIndexedGetId(TestEntityIndexed object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _testEntityIndexedSetId(TestEntityIndexed object, int id) {
  object.id = id;
}

List<IsarLinkBase> _testEntityIndexedGetLinks(TestEntityIndexed object) {
  return [];
}

void _testEntityIndexedSerializeNative(
    IsarCollection<TestEntityIndexed> collection,
    IsarRawObject rawObj,
    TestEntityIndexed object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.tDouble;
  final _tDouble = value0;
  final value1 = object.tInt;
  final _tInt = value1;
  final value2 = object.tLong;
  final _tLong = value2;
  final value3 = object.tString;
  final _tString = IsarBinaryWriter.utf8Encoder.convert(value3);
  dynamicSize += (_tString.length) as int;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeDouble(offsets[0], _tDouble);
  writer.writeLong(offsets[1], _tInt);
  writer.writeLong(offsets[2], _tLong);
  writer.writeBytes(offsets[3], _tString);
}

TestEntityIndexed _testEntityIndexedDeserializeNative(
    IsarCollection<TestEntityIndexed> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = TestEntityIndexed(
    id,
    reader.readString(offsets[3]),
    reader.readLong(offsets[1]),
    reader.readLong(offsets[2]),
    reader.readDouble(offsets[0]),
  );
  return object;
}

P _testEntityIndexedDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _testEntityIndexedSerializeWeb(
    IsarCollection<TestEntityIndexed> collection, TestEntityIndexed object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'tDouble', object.tDouble);
  IsarNative.jsObjectSet(jsObj, 'tInt', object.tInt);
  IsarNative.jsObjectSet(jsObj, 'tLong', object.tLong);
  IsarNative.jsObjectSet(jsObj, 'tString', object.tString);
  return jsObj;
}

TestEntityIndexed _testEntityIndexedDeserializeWeb(
    IsarCollection<TestEntityIndexed> collection, dynamic jsObj) {
  final object = TestEntityIndexed(
    IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity,
    IsarNative.jsObjectGet(jsObj, 'tString') ?? '',
    IsarNative.jsObjectGet(jsObj, 'tInt') ?? double.negativeInfinity,
    IsarNative.jsObjectGet(jsObj, 'tLong') ?? double.negativeInfinity,
    IsarNative.jsObjectGet(jsObj, 'tDouble') ?? double.negativeInfinity,
  );
  return object;
}

P _testEntityIndexedDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
          as P;
    case 'tDouble':
      return (IsarNative.jsObjectGet(jsObj, 'tDouble') ??
          double.negativeInfinity) as P;
    case 'tInt':
      return (IsarNative.jsObjectGet(jsObj, 'tInt') ?? double.negativeInfinity)
          as P;
    case 'tLong':
      return (IsarNative.jsObjectGet(jsObj, 'tLong') ?? double.negativeInfinity)
          as P;
    case 'tString':
      return (IsarNative.jsObjectGet(jsObj, 'tString') ?? '') as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _testEntityIndexedAttachLinks(
    IsarCollection col, int id, TestEntityIndexed object) {}

extension TestEntityIndexedQueryWhereSort
    on QueryBuilder<TestEntityIndexed, TestEntityIndexed, QWhere> {
  QueryBuilder<TestEntityIndexed, TestEntityIndexed, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }

  QueryBuilder<TestEntityIndexed, TestEntityIndexed, QAfterWhere> anyTInt() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'tInt'));
  }

  QueryBuilder<TestEntityIndexed, TestEntityIndexed, QAfterWhere> anyTString() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'tString'));
  }
}

extension TestEntityIndexedQueryWhere
    on QueryBuilder<TestEntityIndexed, TestEntityIndexed, QWhereClause> {
  QueryBuilder<TestEntityIndexed, TestEntityIndexed, QAfterWhereClause>
      idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<TestEntityIndexed, TestEntityIndexed, QAfterWhereClause>
      idNotEqualTo(int id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      ).addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      );
    } else {
      return addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      ).addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      );
    }
  }

  QueryBuilder<TestEntityIndexed, TestEntityIndexed, QAfterWhereClause>
      idGreaterThan(int id, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<TestEntityIndexed, TestEntityIndexed, QAfterWhereClause>
      idLessThan(int id, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<TestEntityIndexed, TestEntityIndexed, QAfterWhereClause>
      idBetween(
    int lowerId,
    int upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: lowerId,
      includeLower: includeLower,
      upper: upperId,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<TestEntityIndexed, TestEntityIndexed, QAfterWhereClause>
      tIntEqualTo(int tInt) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'tInt',
      value: [tInt],
    ));
  }

  QueryBuilder<TestEntityIndexed, TestEntityIndexed, QAfterWhereClause>
      tIntNotEqualTo(int tInt) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'tInt',
        upper: [tInt],
        includeUpper: false,
      )).addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'tInt',
        lower: [tInt],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'tInt',
        lower: [tInt],
        includeLower: false,
      )).addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'tInt',
        upper: [tInt],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<TestEntityIndexed, TestEntityIndexed, QAfterWhereClause>
      tIntGreaterThan(
    int tInt, {
    bool include = false,
  }) {
    return addWhereClauseInternal(IndexWhereClause.greaterThan(
      indexName: 'tInt',
      lower: [tInt],
      includeLower: include,
    ));
  }

  QueryBuilder<TestEntityIndexed, TestEntityIndexed, QAfterWhereClause>
      tIntLessThan(
    int tInt, {
    bool include = false,
  }) {
    return addWhereClauseInternal(IndexWhereClause.lessThan(
      indexName: 'tInt',
      upper: [tInt],
      includeUpper: include,
    ));
  }

  QueryBuilder<TestEntityIndexed, TestEntityIndexed, QAfterWhereClause>
      tIntBetween(
    int lowerTInt,
    int upperTInt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IndexWhereClause.between(
      indexName: 'tInt',
      lower: [lowerTInt],
      includeLower: includeLower,
      upper: [upperTInt],
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<TestEntityIndexed, TestEntityIndexed, QAfterWhereClause>
      tStringEqualTo(String tString) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'tString',
      value: [tString],
    ));
  }

  QueryBuilder<TestEntityIndexed, TestEntityIndexed, QAfterWhereClause>
      tStringNotEqualTo(String tString) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'tString',
        upper: [tString],
        includeUpper: false,
      )).addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'tString',
        lower: [tString],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'tString',
        lower: [tString],
        includeLower: false,
      )).addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'tString',
        upper: [tString],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<TestEntityIndexed, TestEntityIndexed, QAfterWhereClause>
      tStringGreaterThan(
    String tString, {
    bool include = false,
  }) {
    return addWhereClauseInternal(IndexWhereClause.greaterThan(
      indexName: 'tString',
      lower: [tString],
      includeLower: include,
    ));
  }

  QueryBuilder<TestEntityIndexed, TestEntityIndexed, QAfterWhereClause>
      tStringLessThan(
    String tString, {
    bool include = false,
  }) {
    return addWhereClauseInternal(IndexWhereClause.lessThan(
      indexName: 'tString',
      upper: [tString],
      includeUpper: include,
    ));
  }

  QueryBuilder<TestEntityIndexed, TestEntityIndexed, QAfterWhereClause>
      tStringBetween(
    String lowerTString,
    String upperTString, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IndexWhereClause.between(
      indexName: 'tString',
      lower: [lowerTString],
      includeLower: includeLower,
      upper: [upperTString],
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<TestEntityIndexed, TestEntityIndexed, QAfterWhereClause>
      tStringStartsWith(String TStringPrefix) {
    return addWhereClauseInternal(IndexWhereClause.between(
      indexName: 'tString',
      lower: [TStringPrefix],
      includeLower: true,
      upper: ['$TStringPrefix\u{FFFFF}'],
      includeUpper: true,
    ));
  }
}

extension TestEntityIndexedQueryFilter
    on QueryBuilder<TestEntityIndexed, TestEntityIndexed, QFilterCondition> {
  QueryBuilder<TestEntityIndexed, TestEntityIndexed, QAfterFilterCondition>
      idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<TestEntityIndexed, TestEntityIndexed, QAfterFilterCondition>
      idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<TestEntityIndexed, TestEntityIndexed, QAfterFilterCondition>
      idLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<TestEntityIndexed, TestEntityIndexed, QAfterFilterCondition>
      idBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<TestEntityIndexed, TestEntityIndexed, QAfterFilterCondition>
      tDoubleGreaterThan(double value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: false,
      property: 'tDouble',
      value: value,
    ));
  }

  QueryBuilder<TestEntityIndexed, TestEntityIndexed, QAfterFilterCondition>
      tDoubleLessThan(double value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: false,
      property: 'tDouble',
      value: value,
    ));
  }

  QueryBuilder<TestEntityIndexed, TestEntityIndexed, QAfterFilterCondition>
      tDoubleBetween(double lower, double upper) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'tDouble',
      lower: lower,
      includeLower: false,
      upper: upper,
      includeUpper: false,
    ));
  }

  QueryBuilder<TestEntityIndexed, TestEntityIndexed, QAfterFilterCondition>
      tIntEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'tInt',
      value: value,
    ));
  }

  QueryBuilder<TestEntityIndexed, TestEntityIndexed, QAfterFilterCondition>
      tIntGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'tInt',
      value: value,
    ));
  }

  QueryBuilder<TestEntityIndexed, TestEntityIndexed, QAfterFilterCondition>
      tIntLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'tInt',
      value: value,
    ));
  }

  QueryBuilder<TestEntityIndexed, TestEntityIndexed, QAfterFilterCondition>
      tIntBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'tInt',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<TestEntityIndexed, TestEntityIndexed, QAfterFilterCondition>
      tLongEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'tLong',
      value: value,
    ));
  }

  QueryBuilder<TestEntityIndexed, TestEntityIndexed, QAfterFilterCondition>
      tLongGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'tLong',
      value: value,
    ));
  }

  QueryBuilder<TestEntityIndexed, TestEntityIndexed, QAfterFilterCondition>
      tLongLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'tLong',
      value: value,
    ));
  }

  QueryBuilder<TestEntityIndexed, TestEntityIndexed, QAfterFilterCondition>
      tLongBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'tLong',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<TestEntityIndexed, TestEntityIndexed, QAfterFilterCondition>
      tStringEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'tString',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TestEntityIndexed, TestEntityIndexed, QAfterFilterCondition>
      tStringGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'tString',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TestEntityIndexed, TestEntityIndexed, QAfterFilterCondition>
      tStringLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'tString',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TestEntityIndexed, TestEntityIndexed, QAfterFilterCondition>
      tStringBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'tString',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TestEntityIndexed, TestEntityIndexed, QAfterFilterCondition>
      tStringStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'tString',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TestEntityIndexed, TestEntityIndexed, QAfterFilterCondition>
      tStringEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'tString',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TestEntityIndexed, TestEntityIndexed, QAfterFilterCondition>
      tStringContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'tString',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TestEntityIndexed, TestEntityIndexed, QAfterFilterCondition>
      tStringMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'tString',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension TestEntityIndexedQueryLinks
    on QueryBuilder<TestEntityIndexed, TestEntityIndexed, QFilterCondition> {}

extension TestEntityIndexedQueryWhereSortBy
    on QueryBuilder<TestEntityIndexed, TestEntityIndexed, QSortBy> {
  QueryBuilder<TestEntityIndexed, TestEntityIndexed, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<TestEntityIndexed, TestEntityIndexed, QAfterSortBy>
      sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<TestEntityIndexed, TestEntityIndexed, QAfterSortBy>
      sortByTDouble() {
    return addSortByInternal('tDouble', Sort.asc);
  }

  QueryBuilder<TestEntityIndexed, TestEntityIndexed, QAfterSortBy>
      sortByTDoubleDesc() {
    return addSortByInternal('tDouble', Sort.desc);
  }

  QueryBuilder<TestEntityIndexed, TestEntityIndexed, QAfterSortBy>
      sortByTInt() {
    return addSortByInternal('tInt', Sort.asc);
  }

  QueryBuilder<TestEntityIndexed, TestEntityIndexed, QAfterSortBy>
      sortByTIntDesc() {
    return addSortByInternal('tInt', Sort.desc);
  }

  QueryBuilder<TestEntityIndexed, TestEntityIndexed, QAfterSortBy>
      sortByTLong() {
    return addSortByInternal('tLong', Sort.asc);
  }

  QueryBuilder<TestEntityIndexed, TestEntityIndexed, QAfterSortBy>
      sortByTLongDesc() {
    return addSortByInternal('tLong', Sort.desc);
  }

  QueryBuilder<TestEntityIndexed, TestEntityIndexed, QAfterSortBy>
      sortByTString() {
    return addSortByInternal('tString', Sort.asc);
  }

  QueryBuilder<TestEntityIndexed, TestEntityIndexed, QAfterSortBy>
      sortByTStringDesc() {
    return addSortByInternal('tString', Sort.desc);
  }
}

extension TestEntityIndexedQueryWhereSortThenBy
    on QueryBuilder<TestEntityIndexed, TestEntityIndexed, QSortThenBy> {
  QueryBuilder<TestEntityIndexed, TestEntityIndexed, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<TestEntityIndexed, TestEntityIndexed, QAfterSortBy>
      thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<TestEntityIndexed, TestEntityIndexed, QAfterSortBy>
      thenByTDouble() {
    return addSortByInternal('tDouble', Sort.asc);
  }

  QueryBuilder<TestEntityIndexed, TestEntityIndexed, QAfterSortBy>
      thenByTDoubleDesc() {
    return addSortByInternal('tDouble', Sort.desc);
  }

  QueryBuilder<TestEntityIndexed, TestEntityIndexed, QAfterSortBy>
      thenByTInt() {
    return addSortByInternal('tInt', Sort.asc);
  }

  QueryBuilder<TestEntityIndexed, TestEntityIndexed, QAfterSortBy>
      thenByTIntDesc() {
    return addSortByInternal('tInt', Sort.desc);
  }

  QueryBuilder<TestEntityIndexed, TestEntityIndexed, QAfterSortBy>
      thenByTLong() {
    return addSortByInternal('tLong', Sort.asc);
  }

  QueryBuilder<TestEntityIndexed, TestEntityIndexed, QAfterSortBy>
      thenByTLongDesc() {
    return addSortByInternal('tLong', Sort.desc);
  }

  QueryBuilder<TestEntityIndexed, TestEntityIndexed, QAfterSortBy>
      thenByTString() {
    return addSortByInternal('tString', Sort.asc);
  }

  QueryBuilder<TestEntityIndexed, TestEntityIndexed, QAfterSortBy>
      thenByTStringDesc() {
    return addSortByInternal('tString', Sort.desc);
  }
}

extension TestEntityIndexedQueryWhereDistinct
    on QueryBuilder<TestEntityIndexed, TestEntityIndexed, QDistinct> {
  QueryBuilder<TestEntityIndexed, TestEntityIndexed, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<TestEntityIndexed, TestEntityIndexed, QDistinct>
      distinctByTDouble() {
    return addDistinctByInternal('tDouble');
  }

  QueryBuilder<TestEntityIndexed, TestEntityIndexed, QDistinct>
      distinctByTInt() {
    return addDistinctByInternal('tInt');
  }

  QueryBuilder<TestEntityIndexed, TestEntityIndexed, QDistinct>
      distinctByTLong() {
    return addDistinctByInternal('tLong');
  }

  QueryBuilder<TestEntityIndexed, TestEntityIndexed, QDistinct>
      distinctByTString({bool caseSensitive = true}) {
    return addDistinctByInternal('tString', caseSensitive: caseSensitive);
  }
}

extension TestEntityIndexedQueryProperty
    on QueryBuilder<TestEntityIndexed, TestEntityIndexed, QQueryProperty> {
  QueryBuilder<TestEntityIndexed, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<TestEntityIndexed, double, QQueryOperations> tDoubleProperty() {
    return addPropertyNameInternal('tDouble');
  }

  QueryBuilder<TestEntityIndexed, int, QQueryOperations> tIntProperty() {
    return addPropertyNameInternal('tInt');
  }

  QueryBuilder<TestEntityIndexed, int, QQueryOperations> tLongProperty() {
    return addPropertyNameInternal('tLong');
  }

  QueryBuilder<TestEntityIndexed, String, QQueryOperations> tStringProperty() {
    return addPropertyNameInternal('tString');
  }
}

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetRelSourceEntityPlainCollection on Isar {
  IsarCollection<RelSourceEntityPlain> get relSourceEntityPlains =>
      getCollection();
}

const RelSourceEntityPlainSchema = CollectionSchema(
  name: 'RelSourceEntityPlain',
  schema:
      '{"name":"RelSourceEntityPlain","idName":"id","properties":[{"name":"relTargetId","type":"Long"},{"name":"tLong","type":"Long"},{"name":"tString","type":"String"}],"indexes":[],"links":[{"name":"isarRelTarget","target":"RelTargetEntity"}]}',
  idName: 'id',
  propertyIds: {'relTargetId': 0, 'tLong': 1, 'tString': 2},
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {'isarRelTarget': 0},
  backlinkLinkNames: {},
  getId: _relSourceEntityPlainGetId,
  setId: _relSourceEntityPlainSetId,
  getLinks: _relSourceEntityPlainGetLinks,
  attachLinks: _relSourceEntityPlainAttachLinks,
  serializeNative: _relSourceEntityPlainSerializeNative,
  deserializeNative: _relSourceEntityPlainDeserializeNative,
  deserializePropNative: _relSourceEntityPlainDeserializePropNative,
  serializeWeb: _relSourceEntityPlainSerializeWeb,
  deserializeWeb: _relSourceEntityPlainDeserializeWeb,
  deserializePropWeb: _relSourceEntityPlainDeserializePropWeb,
  version: 3,
);

int? _relSourceEntityPlainGetId(RelSourceEntityPlain object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _relSourceEntityPlainSetId(RelSourceEntityPlain object, int id) {
  object.id = id;
}

List<IsarLinkBase> _relSourceEntityPlainGetLinks(RelSourceEntityPlain object) {
  return [object.isarRelTarget];
}

void _relSourceEntityPlainSerializeNative(
    IsarCollection<RelSourceEntityPlain> collection,
    IsarRawObject rawObj,
    RelSourceEntityPlain object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.relTargetId;
  final _relTargetId = value0;
  final value1 = object.tLong;
  final _tLong = value1;
  final value2 = object.tString;
  final _tString = IsarBinaryWriter.utf8Encoder.convert(value2);
  dynamicSize += (_tString.length) as int;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeLong(offsets[0], _relTargetId);
  writer.writeLong(offsets[1], _tLong);
  writer.writeBytes(offsets[2], _tString);
}

RelSourceEntityPlain _relSourceEntityPlainDeserializeNative(
    IsarCollection<RelSourceEntityPlain> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = RelSourceEntityPlain(
    id,
    reader.readString(offsets[2]),
    reader.readLong(offsets[1]),
    reader.readLong(offsets[0]),
  );
  _relSourceEntityPlainAttachLinks(collection, id, object);
  return object;
}

P _relSourceEntityPlainDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _relSourceEntityPlainSerializeWeb(
    IsarCollection<RelSourceEntityPlain> collection,
    RelSourceEntityPlain object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'relTargetId', object.relTargetId);
  IsarNative.jsObjectSet(jsObj, 'tLong', object.tLong);
  IsarNative.jsObjectSet(jsObj, 'tString', object.tString);
  return jsObj;
}

RelSourceEntityPlain _relSourceEntityPlainDeserializeWeb(
    IsarCollection<RelSourceEntityPlain> collection, dynamic jsObj) {
  final object = RelSourceEntityPlain(
    IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity,
    IsarNative.jsObjectGet(jsObj, 'tString') ?? '',
    IsarNative.jsObjectGet(jsObj, 'tLong') ?? double.negativeInfinity,
    IsarNative.jsObjectGet(jsObj, 'relTargetId') ?? double.negativeInfinity,
  );
  _relSourceEntityPlainAttachLinks(collection,
      IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity, object);
  return object;
}

P _relSourceEntityPlainDeserializePropWeb<P>(
    Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
          as P;
    case 'relTargetId':
      return (IsarNative.jsObjectGet(jsObj, 'relTargetId') ??
          double.negativeInfinity) as P;
    case 'tLong':
      return (IsarNative.jsObjectGet(jsObj, 'tLong') ?? double.negativeInfinity)
          as P;
    case 'tString':
      return (IsarNative.jsObjectGet(jsObj, 'tString') ?? '') as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _relSourceEntityPlainAttachLinks(
    IsarCollection col, int id, RelSourceEntityPlain object) {
  object.isarRelTarget
      .attach(col, col.isar.relTargetEntitys, 'isarRelTarget', id);
}

extension RelSourceEntityPlainQueryWhereSort
    on QueryBuilder<RelSourceEntityPlain, RelSourceEntityPlain, QWhere> {
  QueryBuilder<RelSourceEntityPlain, RelSourceEntityPlain, QAfterWhere>
      anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension RelSourceEntityPlainQueryWhere
    on QueryBuilder<RelSourceEntityPlain, RelSourceEntityPlain, QWhereClause> {
  QueryBuilder<RelSourceEntityPlain, RelSourceEntityPlain, QAfterWhereClause>
      idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<RelSourceEntityPlain, RelSourceEntityPlain, QAfterWhereClause>
      idNotEqualTo(int id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      ).addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      );
    } else {
      return addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      ).addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      );
    }
  }

  QueryBuilder<RelSourceEntityPlain, RelSourceEntityPlain, QAfterWhereClause>
      idGreaterThan(int id, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<RelSourceEntityPlain, RelSourceEntityPlain, QAfterWhereClause>
      idLessThan(int id, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<RelSourceEntityPlain, RelSourceEntityPlain, QAfterWhereClause>
      idBetween(
    int lowerId,
    int upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: lowerId,
      includeLower: includeLower,
      upper: upperId,
      includeUpper: includeUpper,
    ));
  }
}

extension RelSourceEntityPlainQueryFilter on QueryBuilder<RelSourceEntityPlain,
    RelSourceEntityPlain, QFilterCondition> {
  QueryBuilder<RelSourceEntityPlain, RelSourceEntityPlain,
      QAfterFilterCondition> idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<RelSourceEntityPlain, RelSourceEntityPlain,
      QAfterFilterCondition> idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<RelSourceEntityPlain, RelSourceEntityPlain,
      QAfterFilterCondition> idLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<RelSourceEntityPlain, RelSourceEntityPlain,
      QAfterFilterCondition> idBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<RelSourceEntityPlain, RelSourceEntityPlain,
      QAfterFilterCondition> relTargetIdEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'relTargetId',
      value: value,
    ));
  }

  QueryBuilder<RelSourceEntityPlain, RelSourceEntityPlain,
      QAfterFilterCondition> relTargetIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'relTargetId',
      value: value,
    ));
  }

  QueryBuilder<RelSourceEntityPlain, RelSourceEntityPlain,
      QAfterFilterCondition> relTargetIdLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'relTargetId',
      value: value,
    ));
  }

  QueryBuilder<RelSourceEntityPlain, RelSourceEntityPlain,
      QAfterFilterCondition> relTargetIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'relTargetId',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<RelSourceEntityPlain, RelSourceEntityPlain,
      QAfterFilterCondition> tLongEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'tLong',
      value: value,
    ));
  }

  QueryBuilder<RelSourceEntityPlain, RelSourceEntityPlain,
      QAfterFilterCondition> tLongGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'tLong',
      value: value,
    ));
  }

  QueryBuilder<RelSourceEntityPlain, RelSourceEntityPlain,
      QAfterFilterCondition> tLongLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'tLong',
      value: value,
    ));
  }

  QueryBuilder<RelSourceEntityPlain, RelSourceEntityPlain,
      QAfterFilterCondition> tLongBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'tLong',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<RelSourceEntityPlain, RelSourceEntityPlain,
      QAfterFilterCondition> tStringEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'tString',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RelSourceEntityPlain, RelSourceEntityPlain,
      QAfterFilterCondition> tStringGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'tString',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RelSourceEntityPlain, RelSourceEntityPlain,
      QAfterFilterCondition> tStringLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'tString',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RelSourceEntityPlain, RelSourceEntityPlain,
      QAfterFilterCondition> tStringBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'tString',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RelSourceEntityPlain, RelSourceEntityPlain,
      QAfterFilterCondition> tStringStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'tString',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RelSourceEntityPlain, RelSourceEntityPlain,
      QAfterFilterCondition> tStringEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'tString',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RelSourceEntityPlain, RelSourceEntityPlain,
          QAfterFilterCondition>
      tStringContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'tString',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RelSourceEntityPlain, RelSourceEntityPlain,
          QAfterFilterCondition>
      tStringMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'tString',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension RelSourceEntityPlainQueryLinks on QueryBuilder<RelSourceEntityPlain,
    RelSourceEntityPlain, QFilterCondition> {
  QueryBuilder<RelSourceEntityPlain, RelSourceEntityPlain,
      QAfterFilterCondition> isarRelTarget(FilterQuery<RelTargetEntity> q) {
    return linkInternal(
      isar.relTargetEntitys,
      q,
      'isarRelTarget',
    );
  }
}

extension RelSourceEntityPlainQueryWhereSortBy
    on QueryBuilder<RelSourceEntityPlain, RelSourceEntityPlain, QSortBy> {
  QueryBuilder<RelSourceEntityPlain, RelSourceEntityPlain, QAfterSortBy>
      sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<RelSourceEntityPlain, RelSourceEntityPlain, QAfterSortBy>
      sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<RelSourceEntityPlain, RelSourceEntityPlain, QAfterSortBy>
      sortByRelTargetId() {
    return addSortByInternal('relTargetId', Sort.asc);
  }

  QueryBuilder<RelSourceEntityPlain, RelSourceEntityPlain, QAfterSortBy>
      sortByRelTargetIdDesc() {
    return addSortByInternal('relTargetId', Sort.desc);
  }

  QueryBuilder<RelSourceEntityPlain, RelSourceEntityPlain, QAfterSortBy>
      sortByTLong() {
    return addSortByInternal('tLong', Sort.asc);
  }

  QueryBuilder<RelSourceEntityPlain, RelSourceEntityPlain, QAfterSortBy>
      sortByTLongDesc() {
    return addSortByInternal('tLong', Sort.desc);
  }

  QueryBuilder<RelSourceEntityPlain, RelSourceEntityPlain, QAfterSortBy>
      sortByTString() {
    return addSortByInternal('tString', Sort.asc);
  }

  QueryBuilder<RelSourceEntityPlain, RelSourceEntityPlain, QAfterSortBy>
      sortByTStringDesc() {
    return addSortByInternal('tString', Sort.desc);
  }
}

extension RelSourceEntityPlainQueryWhereSortThenBy
    on QueryBuilder<RelSourceEntityPlain, RelSourceEntityPlain, QSortThenBy> {
  QueryBuilder<RelSourceEntityPlain, RelSourceEntityPlain, QAfterSortBy>
      thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<RelSourceEntityPlain, RelSourceEntityPlain, QAfterSortBy>
      thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<RelSourceEntityPlain, RelSourceEntityPlain, QAfterSortBy>
      thenByRelTargetId() {
    return addSortByInternal('relTargetId', Sort.asc);
  }

  QueryBuilder<RelSourceEntityPlain, RelSourceEntityPlain, QAfterSortBy>
      thenByRelTargetIdDesc() {
    return addSortByInternal('relTargetId', Sort.desc);
  }

  QueryBuilder<RelSourceEntityPlain, RelSourceEntityPlain, QAfterSortBy>
      thenByTLong() {
    return addSortByInternal('tLong', Sort.asc);
  }

  QueryBuilder<RelSourceEntityPlain, RelSourceEntityPlain, QAfterSortBy>
      thenByTLongDesc() {
    return addSortByInternal('tLong', Sort.desc);
  }

  QueryBuilder<RelSourceEntityPlain, RelSourceEntityPlain, QAfterSortBy>
      thenByTString() {
    return addSortByInternal('tString', Sort.asc);
  }

  QueryBuilder<RelSourceEntityPlain, RelSourceEntityPlain, QAfterSortBy>
      thenByTStringDesc() {
    return addSortByInternal('tString', Sort.desc);
  }
}

extension RelSourceEntityPlainQueryWhereDistinct
    on QueryBuilder<RelSourceEntityPlain, RelSourceEntityPlain, QDistinct> {
  QueryBuilder<RelSourceEntityPlain, RelSourceEntityPlain, QDistinct>
      distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<RelSourceEntityPlain, RelSourceEntityPlain, QDistinct>
      distinctByRelTargetId() {
    return addDistinctByInternal('relTargetId');
  }

  QueryBuilder<RelSourceEntityPlain, RelSourceEntityPlain, QDistinct>
      distinctByTLong() {
    return addDistinctByInternal('tLong');
  }

  QueryBuilder<RelSourceEntityPlain, RelSourceEntityPlain, QDistinct>
      distinctByTString({bool caseSensitive = true}) {
    return addDistinctByInternal('tString', caseSensitive: caseSensitive);
  }
}

extension RelSourceEntityPlainQueryProperty on QueryBuilder<
    RelSourceEntityPlain, RelSourceEntityPlain, QQueryProperty> {
  QueryBuilder<RelSourceEntityPlain, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<RelSourceEntityPlain, int, QQueryOperations>
      relTargetIdProperty() {
    return addPropertyNameInternal('relTargetId');
  }

  QueryBuilder<RelSourceEntityPlain, int, QQueryOperations> tLongProperty() {
    return addPropertyNameInternal('tLong');
  }

  QueryBuilder<RelSourceEntityPlain, String, QQueryOperations>
      tStringProperty() {
    return addPropertyNameInternal('tString');
  }
}

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetRelSourceEntityIndexedCollection on Isar {
  IsarCollection<RelSourceEntityIndexed> get relSourceEntityIndexeds =>
      getCollection();
}

const RelSourceEntityIndexedSchema = CollectionSchema(
  name: 'RelSourceEntityIndexed',
  schema:
      '{"name":"RelSourceEntityIndexed","idName":"id","properties":[{"name":"relTargetId","type":"Long"},{"name":"tLong","type":"Long"},{"name":"tString","type":"String"}],"indexes":[{"name":"tString","unique":false,"properties":[{"name":"tString","type":"Value","caseSensitive":true}]}],"links":[{"name":"isarRelTarget","target":"RelTargetEntity"}]}',
  idName: 'id',
  propertyIds: {'relTargetId': 0, 'tLong': 1, 'tString': 2},
  listProperties: {},
  indexIds: {'tString': 0},
  indexValueTypes: {
    'tString': [
      IndexValueType.string,
    ]
  },
  linkIds: {'isarRelTarget': 0},
  backlinkLinkNames: {},
  getId: _relSourceEntityIndexedGetId,
  setId: _relSourceEntityIndexedSetId,
  getLinks: _relSourceEntityIndexedGetLinks,
  attachLinks: _relSourceEntityIndexedAttachLinks,
  serializeNative: _relSourceEntityIndexedSerializeNative,
  deserializeNative: _relSourceEntityIndexedDeserializeNative,
  deserializePropNative: _relSourceEntityIndexedDeserializePropNative,
  serializeWeb: _relSourceEntityIndexedSerializeWeb,
  deserializeWeb: _relSourceEntityIndexedDeserializeWeb,
  deserializePropWeb: _relSourceEntityIndexedDeserializePropWeb,
  version: 3,
);

int? _relSourceEntityIndexedGetId(RelSourceEntityIndexed object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _relSourceEntityIndexedSetId(RelSourceEntityIndexed object, int id) {
  object.id = id;
}

List<IsarLinkBase> _relSourceEntityIndexedGetLinks(
    RelSourceEntityIndexed object) {
  return [object.isarRelTarget];
}

void _relSourceEntityIndexedSerializeNative(
    IsarCollection<RelSourceEntityIndexed> collection,
    IsarRawObject rawObj,
    RelSourceEntityIndexed object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.relTargetId;
  final _relTargetId = value0;
  final value1 = object.tLong;
  final _tLong = value1;
  final value2 = object.tString;
  final _tString = IsarBinaryWriter.utf8Encoder.convert(value2);
  dynamicSize += (_tString.length) as int;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeLong(offsets[0], _relTargetId);
  writer.writeLong(offsets[1], _tLong);
  writer.writeBytes(offsets[2], _tString);
}

RelSourceEntityIndexed _relSourceEntityIndexedDeserializeNative(
    IsarCollection<RelSourceEntityIndexed> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = RelSourceEntityIndexed(
    id,
    reader.readString(offsets[2]),
    reader.readLong(offsets[1]),
    reader.readLong(offsets[0]),
  );
  _relSourceEntityIndexedAttachLinks(collection, id, object);
  return object;
}

P _relSourceEntityIndexedDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _relSourceEntityIndexedSerializeWeb(
    IsarCollection<RelSourceEntityIndexed> collection,
    RelSourceEntityIndexed object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'relTargetId', object.relTargetId);
  IsarNative.jsObjectSet(jsObj, 'tLong', object.tLong);
  IsarNative.jsObjectSet(jsObj, 'tString', object.tString);
  return jsObj;
}

RelSourceEntityIndexed _relSourceEntityIndexedDeserializeWeb(
    IsarCollection<RelSourceEntityIndexed> collection, dynamic jsObj) {
  final object = RelSourceEntityIndexed(
    IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity,
    IsarNative.jsObjectGet(jsObj, 'tString') ?? '',
    IsarNative.jsObjectGet(jsObj, 'tLong') ?? double.negativeInfinity,
    IsarNative.jsObjectGet(jsObj, 'relTargetId') ?? double.negativeInfinity,
  );
  _relSourceEntityIndexedAttachLinks(collection,
      IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity, object);
  return object;
}

P _relSourceEntityIndexedDeserializePropWeb<P>(
    Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
          as P;
    case 'relTargetId':
      return (IsarNative.jsObjectGet(jsObj, 'relTargetId') ??
          double.negativeInfinity) as P;
    case 'tLong':
      return (IsarNative.jsObjectGet(jsObj, 'tLong') ?? double.negativeInfinity)
          as P;
    case 'tString':
      return (IsarNative.jsObjectGet(jsObj, 'tString') ?? '') as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _relSourceEntityIndexedAttachLinks(
    IsarCollection col, int id, RelSourceEntityIndexed object) {
  object.isarRelTarget
      .attach(col, col.isar.relTargetEntitys, 'isarRelTarget', id);
}

extension RelSourceEntityIndexedQueryWhereSort
    on QueryBuilder<RelSourceEntityIndexed, RelSourceEntityIndexed, QWhere> {
  QueryBuilder<RelSourceEntityIndexed, RelSourceEntityIndexed, QAfterWhere>
      anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }

  QueryBuilder<RelSourceEntityIndexed, RelSourceEntityIndexed, QAfterWhere>
      anyTString() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'tString'));
  }
}

extension RelSourceEntityIndexedQueryWhere on QueryBuilder<
    RelSourceEntityIndexed, RelSourceEntityIndexed, QWhereClause> {
  QueryBuilder<RelSourceEntityIndexed, RelSourceEntityIndexed,
      QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<RelSourceEntityIndexed, RelSourceEntityIndexed,
      QAfterWhereClause> idNotEqualTo(int id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      ).addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      );
    } else {
      return addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      ).addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      );
    }
  }

  QueryBuilder<RelSourceEntityIndexed, RelSourceEntityIndexed,
      QAfterWhereClause> idGreaterThan(int id, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<RelSourceEntityIndexed, RelSourceEntityIndexed,
      QAfterWhereClause> idLessThan(int id, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<RelSourceEntityIndexed, RelSourceEntityIndexed,
      QAfterWhereClause> idBetween(
    int lowerId,
    int upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: lowerId,
      includeLower: includeLower,
      upper: upperId,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<RelSourceEntityIndexed, RelSourceEntityIndexed,
      QAfterWhereClause> tStringEqualTo(String tString) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'tString',
      value: [tString],
    ));
  }

  QueryBuilder<RelSourceEntityIndexed, RelSourceEntityIndexed,
      QAfterWhereClause> tStringNotEqualTo(String tString) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'tString',
        upper: [tString],
        includeUpper: false,
      )).addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'tString',
        lower: [tString],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'tString',
        lower: [tString],
        includeLower: false,
      )).addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'tString',
        upper: [tString],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<RelSourceEntityIndexed, RelSourceEntityIndexed,
      QAfterWhereClause> tStringGreaterThan(
    String tString, {
    bool include = false,
  }) {
    return addWhereClauseInternal(IndexWhereClause.greaterThan(
      indexName: 'tString',
      lower: [tString],
      includeLower: include,
    ));
  }

  QueryBuilder<RelSourceEntityIndexed, RelSourceEntityIndexed,
      QAfterWhereClause> tStringLessThan(
    String tString, {
    bool include = false,
  }) {
    return addWhereClauseInternal(IndexWhereClause.lessThan(
      indexName: 'tString',
      upper: [tString],
      includeUpper: include,
    ));
  }

  QueryBuilder<RelSourceEntityIndexed, RelSourceEntityIndexed,
      QAfterWhereClause> tStringBetween(
    String lowerTString,
    String upperTString, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IndexWhereClause.between(
      indexName: 'tString',
      lower: [lowerTString],
      includeLower: includeLower,
      upper: [upperTString],
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<RelSourceEntityIndexed, RelSourceEntityIndexed,
      QAfterWhereClause> tStringStartsWith(String TStringPrefix) {
    return addWhereClauseInternal(IndexWhereClause.between(
      indexName: 'tString',
      lower: [TStringPrefix],
      includeLower: true,
      upper: ['$TStringPrefix\u{FFFFF}'],
      includeUpper: true,
    ));
  }
}

extension RelSourceEntityIndexedQueryFilter on QueryBuilder<
    RelSourceEntityIndexed, RelSourceEntityIndexed, QFilterCondition> {
  QueryBuilder<RelSourceEntityIndexed, RelSourceEntityIndexed,
      QAfterFilterCondition> idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<RelSourceEntityIndexed, RelSourceEntityIndexed,
      QAfterFilterCondition> idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<RelSourceEntityIndexed, RelSourceEntityIndexed,
      QAfterFilterCondition> idLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<RelSourceEntityIndexed, RelSourceEntityIndexed,
      QAfterFilterCondition> idBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<RelSourceEntityIndexed, RelSourceEntityIndexed,
      QAfterFilterCondition> relTargetIdEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'relTargetId',
      value: value,
    ));
  }

  QueryBuilder<RelSourceEntityIndexed, RelSourceEntityIndexed,
      QAfterFilterCondition> relTargetIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'relTargetId',
      value: value,
    ));
  }

  QueryBuilder<RelSourceEntityIndexed, RelSourceEntityIndexed,
      QAfterFilterCondition> relTargetIdLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'relTargetId',
      value: value,
    ));
  }

  QueryBuilder<RelSourceEntityIndexed, RelSourceEntityIndexed,
      QAfterFilterCondition> relTargetIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'relTargetId',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<RelSourceEntityIndexed, RelSourceEntityIndexed,
      QAfterFilterCondition> tLongEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'tLong',
      value: value,
    ));
  }

  QueryBuilder<RelSourceEntityIndexed, RelSourceEntityIndexed,
      QAfterFilterCondition> tLongGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'tLong',
      value: value,
    ));
  }

  QueryBuilder<RelSourceEntityIndexed, RelSourceEntityIndexed,
      QAfterFilterCondition> tLongLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'tLong',
      value: value,
    ));
  }

  QueryBuilder<RelSourceEntityIndexed, RelSourceEntityIndexed,
      QAfterFilterCondition> tLongBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'tLong',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<RelSourceEntityIndexed, RelSourceEntityIndexed,
      QAfterFilterCondition> tStringEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'tString',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RelSourceEntityIndexed, RelSourceEntityIndexed,
      QAfterFilterCondition> tStringGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'tString',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RelSourceEntityIndexed, RelSourceEntityIndexed,
      QAfterFilterCondition> tStringLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'tString',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RelSourceEntityIndexed, RelSourceEntityIndexed,
      QAfterFilterCondition> tStringBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'tString',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RelSourceEntityIndexed, RelSourceEntityIndexed,
      QAfterFilterCondition> tStringStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'tString',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RelSourceEntityIndexed, RelSourceEntityIndexed,
      QAfterFilterCondition> tStringEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'tString',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RelSourceEntityIndexed, RelSourceEntityIndexed,
          QAfterFilterCondition>
      tStringContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'tString',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RelSourceEntityIndexed, RelSourceEntityIndexed,
          QAfterFilterCondition>
      tStringMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'tString',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension RelSourceEntityIndexedQueryLinks on QueryBuilder<
    RelSourceEntityIndexed, RelSourceEntityIndexed, QFilterCondition> {
  QueryBuilder<RelSourceEntityIndexed, RelSourceEntityIndexed,
      QAfterFilterCondition> isarRelTarget(FilterQuery<RelTargetEntity> q) {
    return linkInternal(
      isar.relTargetEntitys,
      q,
      'isarRelTarget',
    );
  }
}

extension RelSourceEntityIndexedQueryWhereSortBy
    on QueryBuilder<RelSourceEntityIndexed, RelSourceEntityIndexed, QSortBy> {
  QueryBuilder<RelSourceEntityIndexed, RelSourceEntityIndexed, QAfterSortBy>
      sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<RelSourceEntityIndexed, RelSourceEntityIndexed, QAfterSortBy>
      sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<RelSourceEntityIndexed, RelSourceEntityIndexed, QAfterSortBy>
      sortByRelTargetId() {
    return addSortByInternal('relTargetId', Sort.asc);
  }

  QueryBuilder<RelSourceEntityIndexed, RelSourceEntityIndexed, QAfterSortBy>
      sortByRelTargetIdDesc() {
    return addSortByInternal('relTargetId', Sort.desc);
  }

  QueryBuilder<RelSourceEntityIndexed, RelSourceEntityIndexed, QAfterSortBy>
      sortByTLong() {
    return addSortByInternal('tLong', Sort.asc);
  }

  QueryBuilder<RelSourceEntityIndexed, RelSourceEntityIndexed, QAfterSortBy>
      sortByTLongDesc() {
    return addSortByInternal('tLong', Sort.desc);
  }

  QueryBuilder<RelSourceEntityIndexed, RelSourceEntityIndexed, QAfterSortBy>
      sortByTString() {
    return addSortByInternal('tString', Sort.asc);
  }

  QueryBuilder<RelSourceEntityIndexed, RelSourceEntityIndexed, QAfterSortBy>
      sortByTStringDesc() {
    return addSortByInternal('tString', Sort.desc);
  }
}

extension RelSourceEntityIndexedQueryWhereSortThenBy on QueryBuilder<
    RelSourceEntityIndexed, RelSourceEntityIndexed, QSortThenBy> {
  QueryBuilder<RelSourceEntityIndexed, RelSourceEntityIndexed, QAfterSortBy>
      thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<RelSourceEntityIndexed, RelSourceEntityIndexed, QAfterSortBy>
      thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<RelSourceEntityIndexed, RelSourceEntityIndexed, QAfterSortBy>
      thenByRelTargetId() {
    return addSortByInternal('relTargetId', Sort.asc);
  }

  QueryBuilder<RelSourceEntityIndexed, RelSourceEntityIndexed, QAfterSortBy>
      thenByRelTargetIdDesc() {
    return addSortByInternal('relTargetId', Sort.desc);
  }

  QueryBuilder<RelSourceEntityIndexed, RelSourceEntityIndexed, QAfterSortBy>
      thenByTLong() {
    return addSortByInternal('tLong', Sort.asc);
  }

  QueryBuilder<RelSourceEntityIndexed, RelSourceEntityIndexed, QAfterSortBy>
      thenByTLongDesc() {
    return addSortByInternal('tLong', Sort.desc);
  }

  QueryBuilder<RelSourceEntityIndexed, RelSourceEntityIndexed, QAfterSortBy>
      thenByTString() {
    return addSortByInternal('tString', Sort.asc);
  }

  QueryBuilder<RelSourceEntityIndexed, RelSourceEntityIndexed, QAfterSortBy>
      thenByTStringDesc() {
    return addSortByInternal('tString', Sort.desc);
  }
}

extension RelSourceEntityIndexedQueryWhereDistinct
    on QueryBuilder<RelSourceEntityIndexed, RelSourceEntityIndexed, QDistinct> {
  QueryBuilder<RelSourceEntityIndexed, RelSourceEntityIndexed, QDistinct>
      distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<RelSourceEntityIndexed, RelSourceEntityIndexed, QDistinct>
      distinctByRelTargetId() {
    return addDistinctByInternal('relTargetId');
  }

  QueryBuilder<RelSourceEntityIndexed, RelSourceEntityIndexed, QDistinct>
      distinctByTLong() {
    return addDistinctByInternal('tLong');
  }

  QueryBuilder<RelSourceEntityIndexed, RelSourceEntityIndexed, QDistinct>
      distinctByTString({bool caseSensitive = true}) {
    return addDistinctByInternal('tString', caseSensitive: caseSensitive);
  }
}

extension RelSourceEntityIndexedQueryProperty on QueryBuilder<
    RelSourceEntityIndexed, RelSourceEntityIndexed, QQueryProperty> {
  QueryBuilder<RelSourceEntityIndexed, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<RelSourceEntityIndexed, int, QQueryOperations>
      relTargetIdProperty() {
    return addPropertyNameInternal('relTargetId');
  }

  QueryBuilder<RelSourceEntityIndexed, int, QQueryOperations> tLongProperty() {
    return addPropertyNameInternal('tLong');
  }

  QueryBuilder<RelSourceEntityIndexed, String, QQueryOperations>
      tStringProperty() {
    return addPropertyNameInternal('tString');
  }
}

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetRelTargetEntityCollection on Isar {
  IsarCollection<RelTargetEntity> get relTargetEntitys => getCollection();
}

const RelTargetEntitySchema = CollectionSchema(
  name: 'RelTargetEntity',
  schema:
      '{"name":"RelTargetEntity","idName":"id","properties":[{"name":"name","type":"String"}],"indexes":[{"name":"name","unique":false,"properties":[{"name":"name","type":"Value","caseSensitive":true}]}],"links":[]}',
  idName: 'id',
  propertyIds: {'name': 0},
  listProperties: {},
  indexIds: {'name': 0},
  indexValueTypes: {
    'name': [
      IndexValueType.string,
    ]
  },
  linkIds: {},
  backlinkLinkNames: {},
  getId: _relTargetEntityGetId,
  setId: _relTargetEntitySetId,
  getLinks: _relTargetEntityGetLinks,
  attachLinks: _relTargetEntityAttachLinks,
  serializeNative: _relTargetEntitySerializeNative,
  deserializeNative: _relTargetEntityDeserializeNative,
  deserializePropNative: _relTargetEntityDeserializePropNative,
  serializeWeb: _relTargetEntitySerializeWeb,
  deserializeWeb: _relTargetEntityDeserializeWeb,
  deserializePropWeb: _relTargetEntityDeserializePropWeb,
  version: 3,
);

int? _relTargetEntityGetId(RelTargetEntity object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _relTargetEntitySetId(RelTargetEntity object, int id) {
  object.id = id;
}

List<IsarLinkBase> _relTargetEntityGetLinks(RelTargetEntity object) {
  return [];
}

void _relTargetEntitySerializeNative(
    IsarCollection<RelTargetEntity> collection,
    IsarRawObject rawObj,
    RelTargetEntity object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.name;
  final _name = IsarBinaryWriter.utf8Encoder.convert(value0);
  dynamicSize += (_name.length) as int;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], _name);
}

RelTargetEntity _relTargetEntityDeserializeNative(
    IsarCollection<RelTargetEntity> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = RelTargetEntity(
    id,
    reader.readString(offsets[0]),
  );
  return object;
}

P _relTargetEntityDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readString(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _relTargetEntitySerializeWeb(
    IsarCollection<RelTargetEntity> collection, RelTargetEntity object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'name', object.name);
  return jsObj;
}

RelTargetEntity _relTargetEntityDeserializeWeb(
    IsarCollection<RelTargetEntity> collection, dynamic jsObj) {
  final object = RelTargetEntity(
    IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity,
    IsarNative.jsObjectGet(jsObj, 'name') ?? '',
  );
  return object;
}

P _relTargetEntityDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
          as P;
    case 'name':
      return (IsarNative.jsObjectGet(jsObj, 'name') ?? '') as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _relTargetEntityAttachLinks(
    IsarCollection col, int id, RelTargetEntity object) {}

extension RelTargetEntityQueryWhereSort
    on QueryBuilder<RelTargetEntity, RelTargetEntity, QWhere> {
  QueryBuilder<RelTargetEntity, RelTargetEntity, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }

  QueryBuilder<RelTargetEntity, RelTargetEntity, QAfterWhere> anyName() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'name'));
  }
}

extension RelTargetEntityQueryWhere
    on QueryBuilder<RelTargetEntity, RelTargetEntity, QWhereClause> {
  QueryBuilder<RelTargetEntity, RelTargetEntity, QAfterWhereClause> idEqualTo(
      int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<RelTargetEntity, RelTargetEntity, QAfterWhereClause>
      idNotEqualTo(int id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      ).addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      );
    } else {
      return addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      ).addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      );
    }
  }

  QueryBuilder<RelTargetEntity, RelTargetEntity, QAfterWhereClause>
      idGreaterThan(int id, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<RelTargetEntity, RelTargetEntity, QAfterWhereClause> idLessThan(
      int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<RelTargetEntity, RelTargetEntity, QAfterWhereClause> idBetween(
    int lowerId,
    int upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: lowerId,
      includeLower: includeLower,
      upper: upperId,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<RelTargetEntity, RelTargetEntity, QAfterWhereClause> nameEqualTo(
      String name) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'name',
      value: [name],
    ));
  }

  QueryBuilder<RelTargetEntity, RelTargetEntity, QAfterWhereClause>
      nameNotEqualTo(String name) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'name',
        upper: [name],
        includeUpper: false,
      )).addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'name',
        lower: [name],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'name',
        lower: [name],
        includeLower: false,
      )).addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'name',
        upper: [name],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<RelTargetEntity, RelTargetEntity, QAfterWhereClause>
      nameGreaterThan(
    String name, {
    bool include = false,
  }) {
    return addWhereClauseInternal(IndexWhereClause.greaterThan(
      indexName: 'name',
      lower: [name],
      includeLower: include,
    ));
  }

  QueryBuilder<RelTargetEntity, RelTargetEntity, QAfterWhereClause>
      nameLessThan(
    String name, {
    bool include = false,
  }) {
    return addWhereClauseInternal(IndexWhereClause.lessThan(
      indexName: 'name',
      upper: [name],
      includeUpper: include,
    ));
  }

  QueryBuilder<RelTargetEntity, RelTargetEntity, QAfterWhereClause> nameBetween(
    String lowerName,
    String upperName, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IndexWhereClause.between(
      indexName: 'name',
      lower: [lowerName],
      includeLower: includeLower,
      upper: [upperName],
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<RelTargetEntity, RelTargetEntity, QAfterWhereClause>
      nameStartsWith(String NamePrefix) {
    return addWhereClauseInternal(IndexWhereClause.between(
      indexName: 'name',
      lower: [NamePrefix],
      includeLower: true,
      upper: ['$NamePrefix\u{FFFFF}'],
      includeUpper: true,
    ));
  }
}

extension RelTargetEntityQueryFilter
    on QueryBuilder<RelTargetEntity, RelTargetEntity, QFilterCondition> {
  QueryBuilder<RelTargetEntity, RelTargetEntity, QAfterFilterCondition>
      idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<RelTargetEntity, RelTargetEntity, QAfterFilterCondition>
      idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<RelTargetEntity, RelTargetEntity, QAfterFilterCondition>
      idLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<RelTargetEntity, RelTargetEntity, QAfterFilterCondition>
      idBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<RelTargetEntity, RelTargetEntity, QAfterFilterCondition>
      nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RelTargetEntity, RelTargetEntity, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RelTargetEntity, RelTargetEntity, QAfterFilterCondition>
      nameLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RelTargetEntity, RelTargetEntity, QAfterFilterCondition>
      nameBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'name',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RelTargetEntity, RelTargetEntity, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RelTargetEntity, RelTargetEntity, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RelTargetEntity, RelTargetEntity, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RelTargetEntity, RelTargetEntity, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'name',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension RelTargetEntityQueryLinks
    on QueryBuilder<RelTargetEntity, RelTargetEntity, QFilterCondition> {}

extension RelTargetEntityQueryWhereSortBy
    on QueryBuilder<RelTargetEntity, RelTargetEntity, QSortBy> {
  QueryBuilder<RelTargetEntity, RelTargetEntity, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<RelTargetEntity, RelTargetEntity, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<RelTargetEntity, RelTargetEntity, QAfterSortBy> sortByName() {
    return addSortByInternal('name', Sort.asc);
  }

  QueryBuilder<RelTargetEntity, RelTargetEntity, QAfterSortBy>
      sortByNameDesc() {
    return addSortByInternal('name', Sort.desc);
  }
}

extension RelTargetEntityQueryWhereSortThenBy
    on QueryBuilder<RelTargetEntity, RelTargetEntity, QSortThenBy> {
  QueryBuilder<RelTargetEntity, RelTargetEntity, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<RelTargetEntity, RelTargetEntity, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<RelTargetEntity, RelTargetEntity, QAfterSortBy> thenByName() {
    return addSortByInternal('name', Sort.asc);
  }

  QueryBuilder<RelTargetEntity, RelTargetEntity, QAfterSortBy>
      thenByNameDesc() {
    return addSortByInternal('name', Sort.desc);
  }
}

extension RelTargetEntityQueryWhereDistinct
    on QueryBuilder<RelTargetEntity, RelTargetEntity, QDistinct> {
  QueryBuilder<RelTargetEntity, RelTargetEntity, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<RelTargetEntity, RelTargetEntity, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('name', caseSensitive: caseSensitive);
  }
}

extension RelTargetEntityQueryProperty
    on QueryBuilder<RelTargetEntity, RelTargetEntity, QQueryProperty> {
  QueryBuilder<RelTargetEntity, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<RelTargetEntity, String, QQueryOperations> nameProperty() {
    return addPropertyNameInternal('name');
  }
}
