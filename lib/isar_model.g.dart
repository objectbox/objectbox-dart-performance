// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetIsarTestEntityPlainCollection on Isar {
  IsarCollection<IsarTestEntityPlain> get isarTestEntityPlains =>
      this.collection();
}

const IsarTestEntityPlainSchema = CollectionSchema(
  name: r'IsarTestEntityPlain',
  id: -6129992363049006331,
  properties: {
    r'tDouble': PropertySchema(
      id: 0,
      name: r'tDouble',
      type: IsarType.double,
    ),
    r'tInt': PropertySchema(
      id: 1,
      name: r'tInt',
      type: IsarType.long,
    ),
    r'tLong': PropertySchema(
      id: 2,
      name: r'tLong',
      type: IsarType.long,
    ),
    r'tString': PropertySchema(
      id: 3,
      name: r'tString',
      type: IsarType.string,
    )
  },
  estimateSize: _isarTestEntityPlainEstimateSize,
  serialize: _isarTestEntityPlainSerialize,
  deserialize: _isarTestEntityPlainDeserialize,
  deserializeProp: _isarTestEntityPlainDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _isarTestEntityPlainGetId,
  getLinks: _isarTestEntityPlainGetLinks,
  attach: _isarTestEntityPlainAttach,
  version: '3.1.0',
);

int _isarTestEntityPlainEstimateSize(
  IsarTestEntityPlain object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.tString.length * 3;
  return bytesCount;
}

void _isarTestEntityPlainSerialize(
  IsarTestEntityPlain object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.tDouble);
  writer.writeLong(offsets[1], object.tInt);
  writer.writeLong(offsets[2], object.tLong);
  writer.writeString(offsets[3], object.tString);
}

IsarTestEntityPlain _isarTestEntityPlainDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarTestEntityPlain(
    id,
    reader.readString(offsets[3]),
    reader.readLong(offsets[1]),
    reader.readLong(offsets[2]),
    reader.readDouble(offsets[0]),
  );
  return object;
}

P _isarTestEntityPlainDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _isarTestEntityPlainGetId(IsarTestEntityPlain object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _isarTestEntityPlainGetLinks(
    IsarTestEntityPlain object) {
  return [];
}

void _isarTestEntityPlainAttach(
    IsarCollection<dynamic> col, Id id, IsarTestEntityPlain object) {
  object.id = id;
}

extension IsarTestEntityPlainQueryWhereSort
    on QueryBuilder<IsarTestEntityPlain, IsarTestEntityPlain, QWhere> {
  QueryBuilder<IsarTestEntityPlain, IsarTestEntityPlain, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension IsarTestEntityPlainQueryWhere
    on QueryBuilder<IsarTestEntityPlain, IsarTestEntityPlain, QWhereClause> {
  QueryBuilder<IsarTestEntityPlain, IsarTestEntityPlain, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<IsarTestEntityPlain, IsarTestEntityPlain, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<IsarTestEntityPlain, IsarTestEntityPlain, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<IsarTestEntityPlain, IsarTestEntityPlain, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<IsarTestEntityPlain, IsarTestEntityPlain, QAfterWhereClause>
      idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension IsarTestEntityPlainQueryFilter on QueryBuilder<IsarTestEntityPlain,
    IsarTestEntityPlain, QFilterCondition> {
  QueryBuilder<IsarTestEntityPlain, IsarTestEntityPlain, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarTestEntityPlain, IsarTestEntityPlain, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarTestEntityPlain, IsarTestEntityPlain, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarTestEntityPlain, IsarTestEntityPlain, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarTestEntityPlain, IsarTestEntityPlain, QAfterFilterCondition>
      tDoubleEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tDouble',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<IsarTestEntityPlain, IsarTestEntityPlain, QAfterFilterCondition>
      tDoubleGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tDouble',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<IsarTestEntityPlain, IsarTestEntityPlain, QAfterFilterCondition>
      tDoubleLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tDouble',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<IsarTestEntityPlain, IsarTestEntityPlain, QAfterFilterCondition>
      tDoubleBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tDouble',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<IsarTestEntityPlain, IsarTestEntityPlain, QAfterFilterCondition>
      tIntEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tInt',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarTestEntityPlain, IsarTestEntityPlain, QAfterFilterCondition>
      tIntGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tInt',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarTestEntityPlain, IsarTestEntityPlain, QAfterFilterCondition>
      tIntLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tInt',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarTestEntityPlain, IsarTestEntityPlain, QAfterFilterCondition>
      tIntBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tInt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarTestEntityPlain, IsarTestEntityPlain, QAfterFilterCondition>
      tLongEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tLong',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarTestEntityPlain, IsarTestEntityPlain, QAfterFilterCondition>
      tLongGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tLong',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarTestEntityPlain, IsarTestEntityPlain, QAfterFilterCondition>
      tLongLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tLong',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarTestEntityPlain, IsarTestEntityPlain, QAfterFilterCondition>
      tLongBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tLong',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarTestEntityPlain, IsarTestEntityPlain, QAfterFilterCondition>
      tStringEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTestEntityPlain, IsarTestEntityPlain, QAfterFilterCondition>
      tStringGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTestEntityPlain, IsarTestEntityPlain, QAfterFilterCondition>
      tStringLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTestEntityPlain, IsarTestEntityPlain, QAfterFilterCondition>
      tStringBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tString',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTestEntityPlain, IsarTestEntityPlain, QAfterFilterCondition>
      tStringStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTestEntityPlain, IsarTestEntityPlain, QAfterFilterCondition>
      tStringEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTestEntityPlain, IsarTestEntityPlain, QAfterFilterCondition>
      tStringContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTestEntityPlain, IsarTestEntityPlain, QAfterFilterCondition>
      tStringMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tString',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTestEntityPlain, IsarTestEntityPlain, QAfterFilterCondition>
      tStringIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tString',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarTestEntityPlain, IsarTestEntityPlain, QAfterFilterCondition>
      tStringIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tString',
        value: '',
      ));
    });
  }
}

extension IsarTestEntityPlainQueryObject on QueryBuilder<IsarTestEntityPlain,
    IsarTestEntityPlain, QFilterCondition> {}

extension IsarTestEntityPlainQueryLinks on QueryBuilder<IsarTestEntityPlain,
    IsarTestEntityPlain, QFilterCondition> {}

extension IsarTestEntityPlainQuerySortBy
    on QueryBuilder<IsarTestEntityPlain, IsarTestEntityPlain, QSortBy> {
  QueryBuilder<IsarTestEntityPlain, IsarTestEntityPlain, QAfterSortBy>
      sortByTDouble() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tDouble', Sort.asc);
    });
  }

  QueryBuilder<IsarTestEntityPlain, IsarTestEntityPlain, QAfterSortBy>
      sortByTDoubleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tDouble', Sort.desc);
    });
  }

  QueryBuilder<IsarTestEntityPlain, IsarTestEntityPlain, QAfterSortBy>
      sortByTInt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tInt', Sort.asc);
    });
  }

  QueryBuilder<IsarTestEntityPlain, IsarTestEntityPlain, QAfterSortBy>
      sortByTIntDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tInt', Sort.desc);
    });
  }

  QueryBuilder<IsarTestEntityPlain, IsarTestEntityPlain, QAfterSortBy>
      sortByTLong() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tLong', Sort.asc);
    });
  }

  QueryBuilder<IsarTestEntityPlain, IsarTestEntityPlain, QAfterSortBy>
      sortByTLongDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tLong', Sort.desc);
    });
  }

  QueryBuilder<IsarTestEntityPlain, IsarTestEntityPlain, QAfterSortBy>
      sortByTString() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tString', Sort.asc);
    });
  }

  QueryBuilder<IsarTestEntityPlain, IsarTestEntityPlain, QAfterSortBy>
      sortByTStringDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tString', Sort.desc);
    });
  }
}

extension IsarTestEntityPlainQuerySortThenBy
    on QueryBuilder<IsarTestEntityPlain, IsarTestEntityPlain, QSortThenBy> {
  QueryBuilder<IsarTestEntityPlain, IsarTestEntityPlain, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<IsarTestEntityPlain, IsarTestEntityPlain, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<IsarTestEntityPlain, IsarTestEntityPlain, QAfterSortBy>
      thenByTDouble() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tDouble', Sort.asc);
    });
  }

  QueryBuilder<IsarTestEntityPlain, IsarTestEntityPlain, QAfterSortBy>
      thenByTDoubleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tDouble', Sort.desc);
    });
  }

  QueryBuilder<IsarTestEntityPlain, IsarTestEntityPlain, QAfterSortBy>
      thenByTInt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tInt', Sort.asc);
    });
  }

  QueryBuilder<IsarTestEntityPlain, IsarTestEntityPlain, QAfterSortBy>
      thenByTIntDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tInt', Sort.desc);
    });
  }

  QueryBuilder<IsarTestEntityPlain, IsarTestEntityPlain, QAfterSortBy>
      thenByTLong() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tLong', Sort.asc);
    });
  }

  QueryBuilder<IsarTestEntityPlain, IsarTestEntityPlain, QAfterSortBy>
      thenByTLongDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tLong', Sort.desc);
    });
  }

  QueryBuilder<IsarTestEntityPlain, IsarTestEntityPlain, QAfterSortBy>
      thenByTString() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tString', Sort.asc);
    });
  }

  QueryBuilder<IsarTestEntityPlain, IsarTestEntityPlain, QAfterSortBy>
      thenByTStringDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tString', Sort.desc);
    });
  }
}

extension IsarTestEntityPlainQueryWhereDistinct
    on QueryBuilder<IsarTestEntityPlain, IsarTestEntityPlain, QDistinct> {
  QueryBuilder<IsarTestEntityPlain, IsarTestEntityPlain, QDistinct>
      distinctByTDouble() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tDouble');
    });
  }

  QueryBuilder<IsarTestEntityPlain, IsarTestEntityPlain, QDistinct>
      distinctByTInt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tInt');
    });
  }

  QueryBuilder<IsarTestEntityPlain, IsarTestEntityPlain, QDistinct>
      distinctByTLong() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tLong');
    });
  }

  QueryBuilder<IsarTestEntityPlain, IsarTestEntityPlain, QDistinct>
      distinctByTString({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tString', caseSensitive: caseSensitive);
    });
  }
}

extension IsarTestEntityPlainQueryProperty
    on QueryBuilder<IsarTestEntityPlain, IsarTestEntityPlain, QQueryProperty> {
  QueryBuilder<IsarTestEntityPlain, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<IsarTestEntityPlain, double, QQueryOperations>
      tDoubleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tDouble');
    });
  }

  QueryBuilder<IsarTestEntityPlain, int, QQueryOperations> tIntProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tInt');
    });
  }

  QueryBuilder<IsarTestEntityPlain, int, QQueryOperations> tLongProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tLong');
    });
  }

  QueryBuilder<IsarTestEntityPlain, String, QQueryOperations>
      tStringProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tString');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetIsarTestEntityIndexedCollection on Isar {
  IsarCollection<IsarTestEntityIndexed> get isarTestEntityIndexeds =>
      this.collection();
}

const IsarTestEntityIndexedSchema = CollectionSchema(
  name: r'IsarTestEntityIndexed',
  id: 5463442080814585355,
  properties: {
    r'tDouble': PropertySchema(
      id: 0,
      name: r'tDouble',
      type: IsarType.double,
    ),
    r'tInt': PropertySchema(
      id: 1,
      name: r'tInt',
      type: IsarType.long,
    ),
    r'tLong': PropertySchema(
      id: 2,
      name: r'tLong',
      type: IsarType.long,
    ),
    r'tString': PropertySchema(
      id: 3,
      name: r'tString',
      type: IsarType.string,
    )
  },
  estimateSize: _isarTestEntityIndexedEstimateSize,
  serialize: _isarTestEntityIndexedSerialize,
  deserialize: _isarTestEntityIndexedDeserialize,
  deserializeProp: _isarTestEntityIndexedDeserializeProp,
  idName: r'id',
  indexes: {
    r'tString': IndexSchema(
      id: 7280886163538708692,
      name: r'tString',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'tString',
          type: IndexType.value,
          caseSensitive: true,
        )
      ],
    ),
    r'tInt': IndexSchema(
      id: 7501579520493575698,
      name: r'tInt',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'tInt',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _isarTestEntityIndexedGetId,
  getLinks: _isarTestEntityIndexedGetLinks,
  attach: _isarTestEntityIndexedAttach,
  version: '3.1.0',
);

int _isarTestEntityIndexedEstimateSize(
  IsarTestEntityIndexed object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.tString.length * 3;
  return bytesCount;
}

void _isarTestEntityIndexedSerialize(
  IsarTestEntityIndexed object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.tDouble);
  writer.writeLong(offsets[1], object.tInt);
  writer.writeLong(offsets[2], object.tLong);
  writer.writeString(offsets[3], object.tString);
}

IsarTestEntityIndexed _isarTestEntityIndexedDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarTestEntityIndexed(
    id,
    reader.readString(offsets[3]),
    reader.readLong(offsets[1]),
    reader.readLong(offsets[2]),
    reader.readDouble(offsets[0]),
  );
  return object;
}

P _isarTestEntityIndexedDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _isarTestEntityIndexedGetId(IsarTestEntityIndexed object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _isarTestEntityIndexedGetLinks(
    IsarTestEntityIndexed object) {
  return [];
}

void _isarTestEntityIndexedAttach(
    IsarCollection<dynamic> col, Id id, IsarTestEntityIndexed object) {
  object.id = id;
}

extension IsarTestEntityIndexedQueryWhereSort
    on QueryBuilder<IsarTestEntityIndexed, IsarTestEntityIndexed, QWhere> {
  QueryBuilder<IsarTestEntityIndexed, IsarTestEntityIndexed, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<IsarTestEntityIndexed, IsarTestEntityIndexed, QAfterWhere>
      anyTString() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'tString'),
      );
    });
  }

  QueryBuilder<IsarTestEntityIndexed, IsarTestEntityIndexed, QAfterWhere>
      anyTInt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'tInt'),
      );
    });
  }
}

extension IsarTestEntityIndexedQueryWhere on QueryBuilder<IsarTestEntityIndexed,
    IsarTestEntityIndexed, QWhereClause> {
  QueryBuilder<IsarTestEntityIndexed, IsarTestEntityIndexed, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<IsarTestEntityIndexed, IsarTestEntityIndexed, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<IsarTestEntityIndexed, IsarTestEntityIndexed, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<IsarTestEntityIndexed, IsarTestEntityIndexed, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<IsarTestEntityIndexed, IsarTestEntityIndexed, QAfterWhereClause>
      idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarTestEntityIndexed, IsarTestEntityIndexed, QAfterWhereClause>
      tStringEqualTo(String tString) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'tString',
        value: [tString],
      ));
    });
  }

  QueryBuilder<IsarTestEntityIndexed, IsarTestEntityIndexed, QAfterWhereClause>
      tStringNotEqualTo(String tString) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'tString',
              lower: [],
              upper: [tString],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'tString',
              lower: [tString],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'tString',
              lower: [tString],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'tString',
              lower: [],
              upper: [tString],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<IsarTestEntityIndexed, IsarTestEntityIndexed, QAfterWhereClause>
      tStringGreaterThan(
    String tString, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'tString',
        lower: [tString],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<IsarTestEntityIndexed, IsarTestEntityIndexed, QAfterWhereClause>
      tStringLessThan(
    String tString, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'tString',
        lower: [],
        upper: [tString],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<IsarTestEntityIndexed, IsarTestEntityIndexed, QAfterWhereClause>
      tStringBetween(
    String lowerTString,
    String upperTString, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'tString',
        lower: [lowerTString],
        includeLower: includeLower,
        upper: [upperTString],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarTestEntityIndexed, IsarTestEntityIndexed, QAfterWhereClause>
      tStringStartsWith(String TStringPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'tString',
        lower: [TStringPrefix],
        upper: ['$TStringPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<IsarTestEntityIndexed, IsarTestEntityIndexed, QAfterWhereClause>
      tStringIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'tString',
        value: [''],
      ));
    });
  }

  QueryBuilder<IsarTestEntityIndexed, IsarTestEntityIndexed, QAfterWhereClause>
      tStringIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'tString',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'tString',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'tString',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'tString',
              upper: [''],
            ));
      }
    });
  }

  QueryBuilder<IsarTestEntityIndexed, IsarTestEntityIndexed, QAfterWhereClause>
      tIntEqualTo(int tInt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'tInt',
        value: [tInt],
      ));
    });
  }

  QueryBuilder<IsarTestEntityIndexed, IsarTestEntityIndexed, QAfterWhereClause>
      tIntNotEqualTo(int tInt) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'tInt',
              lower: [],
              upper: [tInt],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'tInt',
              lower: [tInt],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'tInt',
              lower: [tInt],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'tInt',
              lower: [],
              upper: [tInt],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<IsarTestEntityIndexed, IsarTestEntityIndexed, QAfterWhereClause>
      tIntGreaterThan(
    int tInt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'tInt',
        lower: [tInt],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<IsarTestEntityIndexed, IsarTestEntityIndexed, QAfterWhereClause>
      tIntLessThan(
    int tInt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'tInt',
        lower: [],
        upper: [tInt],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<IsarTestEntityIndexed, IsarTestEntityIndexed, QAfterWhereClause>
      tIntBetween(
    int lowerTInt,
    int upperTInt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'tInt',
        lower: [lowerTInt],
        includeLower: includeLower,
        upper: [upperTInt],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension IsarTestEntityIndexedQueryFilter on QueryBuilder<
    IsarTestEntityIndexed, IsarTestEntityIndexed, QFilterCondition> {
  QueryBuilder<IsarTestEntityIndexed, IsarTestEntityIndexed,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarTestEntityIndexed, IsarTestEntityIndexed,
      QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarTestEntityIndexed, IsarTestEntityIndexed,
      QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarTestEntityIndexed, IsarTestEntityIndexed,
      QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarTestEntityIndexed, IsarTestEntityIndexed,
      QAfterFilterCondition> tDoubleEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tDouble',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<IsarTestEntityIndexed, IsarTestEntityIndexed,
      QAfterFilterCondition> tDoubleGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tDouble',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<IsarTestEntityIndexed, IsarTestEntityIndexed,
      QAfterFilterCondition> tDoubleLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tDouble',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<IsarTestEntityIndexed, IsarTestEntityIndexed,
      QAfterFilterCondition> tDoubleBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tDouble',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<IsarTestEntityIndexed, IsarTestEntityIndexed,
      QAfterFilterCondition> tIntEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tInt',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarTestEntityIndexed, IsarTestEntityIndexed,
      QAfterFilterCondition> tIntGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tInt',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarTestEntityIndexed, IsarTestEntityIndexed,
      QAfterFilterCondition> tIntLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tInt',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarTestEntityIndexed, IsarTestEntityIndexed,
      QAfterFilterCondition> tIntBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tInt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarTestEntityIndexed, IsarTestEntityIndexed,
      QAfterFilterCondition> tLongEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tLong',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarTestEntityIndexed, IsarTestEntityIndexed,
      QAfterFilterCondition> tLongGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tLong',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarTestEntityIndexed, IsarTestEntityIndexed,
      QAfterFilterCondition> tLongLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tLong',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarTestEntityIndexed, IsarTestEntityIndexed,
      QAfterFilterCondition> tLongBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tLong',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarTestEntityIndexed, IsarTestEntityIndexed,
      QAfterFilterCondition> tStringEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTestEntityIndexed, IsarTestEntityIndexed,
      QAfterFilterCondition> tStringGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTestEntityIndexed, IsarTestEntityIndexed,
      QAfterFilterCondition> tStringLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTestEntityIndexed, IsarTestEntityIndexed,
      QAfterFilterCondition> tStringBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tString',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTestEntityIndexed, IsarTestEntityIndexed,
      QAfterFilterCondition> tStringStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTestEntityIndexed, IsarTestEntityIndexed,
      QAfterFilterCondition> tStringEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTestEntityIndexed, IsarTestEntityIndexed,
          QAfterFilterCondition>
      tStringContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTestEntityIndexed, IsarTestEntityIndexed,
          QAfterFilterCondition>
      tStringMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tString',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTestEntityIndexed, IsarTestEntityIndexed,
      QAfterFilterCondition> tStringIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tString',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarTestEntityIndexed, IsarTestEntityIndexed,
      QAfterFilterCondition> tStringIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tString',
        value: '',
      ));
    });
  }
}

extension IsarTestEntityIndexedQueryObject on QueryBuilder<
    IsarTestEntityIndexed, IsarTestEntityIndexed, QFilterCondition> {}

extension IsarTestEntityIndexedQueryLinks on QueryBuilder<IsarTestEntityIndexed,
    IsarTestEntityIndexed, QFilterCondition> {}

extension IsarTestEntityIndexedQuerySortBy
    on QueryBuilder<IsarTestEntityIndexed, IsarTestEntityIndexed, QSortBy> {
  QueryBuilder<IsarTestEntityIndexed, IsarTestEntityIndexed, QAfterSortBy>
      sortByTDouble() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tDouble', Sort.asc);
    });
  }

  QueryBuilder<IsarTestEntityIndexed, IsarTestEntityIndexed, QAfterSortBy>
      sortByTDoubleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tDouble', Sort.desc);
    });
  }

  QueryBuilder<IsarTestEntityIndexed, IsarTestEntityIndexed, QAfterSortBy>
      sortByTInt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tInt', Sort.asc);
    });
  }

  QueryBuilder<IsarTestEntityIndexed, IsarTestEntityIndexed, QAfterSortBy>
      sortByTIntDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tInt', Sort.desc);
    });
  }

  QueryBuilder<IsarTestEntityIndexed, IsarTestEntityIndexed, QAfterSortBy>
      sortByTLong() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tLong', Sort.asc);
    });
  }

  QueryBuilder<IsarTestEntityIndexed, IsarTestEntityIndexed, QAfterSortBy>
      sortByTLongDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tLong', Sort.desc);
    });
  }

  QueryBuilder<IsarTestEntityIndexed, IsarTestEntityIndexed, QAfterSortBy>
      sortByTString() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tString', Sort.asc);
    });
  }

  QueryBuilder<IsarTestEntityIndexed, IsarTestEntityIndexed, QAfterSortBy>
      sortByTStringDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tString', Sort.desc);
    });
  }
}

extension IsarTestEntityIndexedQuerySortThenBy
    on QueryBuilder<IsarTestEntityIndexed, IsarTestEntityIndexed, QSortThenBy> {
  QueryBuilder<IsarTestEntityIndexed, IsarTestEntityIndexed, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<IsarTestEntityIndexed, IsarTestEntityIndexed, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<IsarTestEntityIndexed, IsarTestEntityIndexed, QAfterSortBy>
      thenByTDouble() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tDouble', Sort.asc);
    });
  }

  QueryBuilder<IsarTestEntityIndexed, IsarTestEntityIndexed, QAfterSortBy>
      thenByTDoubleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tDouble', Sort.desc);
    });
  }

  QueryBuilder<IsarTestEntityIndexed, IsarTestEntityIndexed, QAfterSortBy>
      thenByTInt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tInt', Sort.asc);
    });
  }

  QueryBuilder<IsarTestEntityIndexed, IsarTestEntityIndexed, QAfterSortBy>
      thenByTIntDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tInt', Sort.desc);
    });
  }

  QueryBuilder<IsarTestEntityIndexed, IsarTestEntityIndexed, QAfterSortBy>
      thenByTLong() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tLong', Sort.asc);
    });
  }

  QueryBuilder<IsarTestEntityIndexed, IsarTestEntityIndexed, QAfterSortBy>
      thenByTLongDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tLong', Sort.desc);
    });
  }

  QueryBuilder<IsarTestEntityIndexed, IsarTestEntityIndexed, QAfterSortBy>
      thenByTString() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tString', Sort.asc);
    });
  }

  QueryBuilder<IsarTestEntityIndexed, IsarTestEntityIndexed, QAfterSortBy>
      thenByTStringDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tString', Sort.desc);
    });
  }
}

extension IsarTestEntityIndexedQueryWhereDistinct
    on QueryBuilder<IsarTestEntityIndexed, IsarTestEntityIndexed, QDistinct> {
  QueryBuilder<IsarTestEntityIndexed, IsarTestEntityIndexed, QDistinct>
      distinctByTDouble() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tDouble');
    });
  }

  QueryBuilder<IsarTestEntityIndexed, IsarTestEntityIndexed, QDistinct>
      distinctByTInt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tInt');
    });
  }

  QueryBuilder<IsarTestEntityIndexed, IsarTestEntityIndexed, QDistinct>
      distinctByTLong() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tLong');
    });
  }

  QueryBuilder<IsarTestEntityIndexed, IsarTestEntityIndexed, QDistinct>
      distinctByTString({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tString', caseSensitive: caseSensitive);
    });
  }
}

extension IsarTestEntityIndexedQueryProperty on QueryBuilder<
    IsarTestEntityIndexed, IsarTestEntityIndexed, QQueryProperty> {
  QueryBuilder<IsarTestEntityIndexed, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<IsarTestEntityIndexed, double, QQueryOperations>
      tDoubleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tDouble');
    });
  }

  QueryBuilder<IsarTestEntityIndexed, int, QQueryOperations> tIntProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tInt');
    });
  }

  QueryBuilder<IsarTestEntityIndexed, int, QQueryOperations> tLongProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tLong');
    });
  }

  QueryBuilder<IsarTestEntityIndexed, String, QQueryOperations>
      tStringProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tString');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetIsarRelSourceEntityPlainCollection on Isar {
  IsarCollection<IsarRelSourceEntityPlain> get isarRelSourceEntityPlains =>
      this.collection();
}

const IsarRelSourceEntityPlainSchema = CollectionSchema(
  name: r'IsarRelSourceEntityPlain',
  id: -5889976388189242894,
  properties: {
    r'relTargetId': PropertySchema(
      id: 0,
      name: r'relTargetId',
      type: IsarType.long,
    ),
    r'tLong': PropertySchema(
      id: 1,
      name: r'tLong',
      type: IsarType.long,
    ),
    r'tString': PropertySchema(
      id: 2,
      name: r'tString',
      type: IsarType.string,
    )
  },
  estimateSize: _isarRelSourceEntityPlainEstimateSize,
  serialize: _isarRelSourceEntityPlainSerialize,
  deserialize: _isarRelSourceEntityPlainDeserialize,
  deserializeProp: _isarRelSourceEntityPlainDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'isarRelTarget': LinkSchema(
      id: -580336645251030378,
      name: r'isarRelTarget',
      target: r'IsarRelTargetEntity',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _isarRelSourceEntityPlainGetId,
  getLinks: _isarRelSourceEntityPlainGetLinks,
  attach: _isarRelSourceEntityPlainAttach,
  version: '3.1.0',
);

int _isarRelSourceEntityPlainEstimateSize(
  IsarRelSourceEntityPlain object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.tString.length * 3;
  return bytesCount;
}

void _isarRelSourceEntityPlainSerialize(
  IsarRelSourceEntityPlain object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.relTargetId);
  writer.writeLong(offsets[1], object.tLong);
  writer.writeString(offsets[2], object.tString);
}

IsarRelSourceEntityPlain _isarRelSourceEntityPlainDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarRelSourceEntityPlain(
    id,
    reader.readString(offsets[2]),
    reader.readLong(offsets[1]),
    reader.readLongOrNull(offsets[0]) ?? 0,
  );
  return object;
}

P _isarRelSourceEntityPlainDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _isarRelSourceEntityPlainGetId(IsarRelSourceEntityPlain object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _isarRelSourceEntityPlainGetLinks(
    IsarRelSourceEntityPlain object) {
  return [object.isarRelTarget];
}

void _isarRelSourceEntityPlainAttach(
    IsarCollection<dynamic> col, Id id, IsarRelSourceEntityPlain object) {
  object.id = id;
  object.isarRelTarget.attach(
      col, col.isar.collection<IsarRelTargetEntity>(), r'isarRelTarget', id);
}

extension IsarRelSourceEntityPlainQueryWhereSort on QueryBuilder<
    IsarRelSourceEntityPlain, IsarRelSourceEntityPlain, QWhere> {
  QueryBuilder<IsarRelSourceEntityPlain, IsarRelSourceEntityPlain, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension IsarRelSourceEntityPlainQueryWhere on QueryBuilder<
    IsarRelSourceEntityPlain, IsarRelSourceEntityPlain, QWhereClause> {
  QueryBuilder<IsarRelSourceEntityPlain, IsarRelSourceEntityPlain,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<IsarRelSourceEntityPlain, IsarRelSourceEntityPlain,
      QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<IsarRelSourceEntityPlain, IsarRelSourceEntityPlain,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<IsarRelSourceEntityPlain, IsarRelSourceEntityPlain,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<IsarRelSourceEntityPlain, IsarRelSourceEntityPlain,
      QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension IsarRelSourceEntityPlainQueryFilter on QueryBuilder<
    IsarRelSourceEntityPlain, IsarRelSourceEntityPlain, QFilterCondition> {
  QueryBuilder<IsarRelSourceEntityPlain, IsarRelSourceEntityPlain,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarRelSourceEntityPlain, IsarRelSourceEntityPlain,
      QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarRelSourceEntityPlain, IsarRelSourceEntityPlain,
      QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarRelSourceEntityPlain, IsarRelSourceEntityPlain,
      QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarRelSourceEntityPlain, IsarRelSourceEntityPlain,
      QAfterFilterCondition> relTargetIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'relTargetId',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarRelSourceEntityPlain, IsarRelSourceEntityPlain,
      QAfterFilterCondition> relTargetIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'relTargetId',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarRelSourceEntityPlain, IsarRelSourceEntityPlain,
      QAfterFilterCondition> relTargetIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'relTargetId',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarRelSourceEntityPlain, IsarRelSourceEntityPlain,
      QAfterFilterCondition> relTargetIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'relTargetId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarRelSourceEntityPlain, IsarRelSourceEntityPlain,
      QAfterFilterCondition> tLongEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tLong',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarRelSourceEntityPlain, IsarRelSourceEntityPlain,
      QAfterFilterCondition> tLongGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tLong',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarRelSourceEntityPlain, IsarRelSourceEntityPlain,
      QAfterFilterCondition> tLongLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tLong',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarRelSourceEntityPlain, IsarRelSourceEntityPlain,
      QAfterFilterCondition> tLongBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tLong',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarRelSourceEntityPlain, IsarRelSourceEntityPlain,
      QAfterFilterCondition> tStringEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarRelSourceEntityPlain, IsarRelSourceEntityPlain,
      QAfterFilterCondition> tStringGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarRelSourceEntityPlain, IsarRelSourceEntityPlain,
      QAfterFilterCondition> tStringLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarRelSourceEntityPlain, IsarRelSourceEntityPlain,
      QAfterFilterCondition> tStringBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tString',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarRelSourceEntityPlain, IsarRelSourceEntityPlain,
      QAfterFilterCondition> tStringStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarRelSourceEntityPlain, IsarRelSourceEntityPlain,
      QAfterFilterCondition> tStringEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarRelSourceEntityPlain, IsarRelSourceEntityPlain,
          QAfterFilterCondition>
      tStringContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarRelSourceEntityPlain, IsarRelSourceEntityPlain,
          QAfterFilterCondition>
      tStringMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tString',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarRelSourceEntityPlain, IsarRelSourceEntityPlain,
      QAfterFilterCondition> tStringIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tString',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarRelSourceEntityPlain, IsarRelSourceEntityPlain,
      QAfterFilterCondition> tStringIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tString',
        value: '',
      ));
    });
  }
}

extension IsarRelSourceEntityPlainQueryObject on QueryBuilder<
    IsarRelSourceEntityPlain, IsarRelSourceEntityPlain, QFilterCondition> {}

extension IsarRelSourceEntityPlainQueryLinks on QueryBuilder<
    IsarRelSourceEntityPlain, IsarRelSourceEntityPlain, QFilterCondition> {
  QueryBuilder<IsarRelSourceEntityPlain, IsarRelSourceEntityPlain,
      QAfterFilterCondition> isarRelTarget(FilterQuery<IsarRelTargetEntity> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'isarRelTarget');
    });
  }

  QueryBuilder<IsarRelSourceEntityPlain, IsarRelSourceEntityPlain,
      QAfterFilterCondition> isarRelTargetIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'isarRelTarget', 0, true, 0, true);
    });
  }
}

extension IsarRelSourceEntityPlainQuerySortBy on QueryBuilder<
    IsarRelSourceEntityPlain, IsarRelSourceEntityPlain, QSortBy> {
  QueryBuilder<IsarRelSourceEntityPlain, IsarRelSourceEntityPlain, QAfterSortBy>
      sortByRelTargetId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'relTargetId', Sort.asc);
    });
  }

  QueryBuilder<IsarRelSourceEntityPlain, IsarRelSourceEntityPlain, QAfterSortBy>
      sortByRelTargetIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'relTargetId', Sort.desc);
    });
  }

  QueryBuilder<IsarRelSourceEntityPlain, IsarRelSourceEntityPlain, QAfterSortBy>
      sortByTLong() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tLong', Sort.asc);
    });
  }

  QueryBuilder<IsarRelSourceEntityPlain, IsarRelSourceEntityPlain, QAfterSortBy>
      sortByTLongDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tLong', Sort.desc);
    });
  }

  QueryBuilder<IsarRelSourceEntityPlain, IsarRelSourceEntityPlain, QAfterSortBy>
      sortByTString() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tString', Sort.asc);
    });
  }

  QueryBuilder<IsarRelSourceEntityPlain, IsarRelSourceEntityPlain, QAfterSortBy>
      sortByTStringDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tString', Sort.desc);
    });
  }
}

extension IsarRelSourceEntityPlainQuerySortThenBy on QueryBuilder<
    IsarRelSourceEntityPlain, IsarRelSourceEntityPlain, QSortThenBy> {
  QueryBuilder<IsarRelSourceEntityPlain, IsarRelSourceEntityPlain, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<IsarRelSourceEntityPlain, IsarRelSourceEntityPlain, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<IsarRelSourceEntityPlain, IsarRelSourceEntityPlain, QAfterSortBy>
      thenByRelTargetId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'relTargetId', Sort.asc);
    });
  }

  QueryBuilder<IsarRelSourceEntityPlain, IsarRelSourceEntityPlain, QAfterSortBy>
      thenByRelTargetIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'relTargetId', Sort.desc);
    });
  }

  QueryBuilder<IsarRelSourceEntityPlain, IsarRelSourceEntityPlain, QAfterSortBy>
      thenByTLong() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tLong', Sort.asc);
    });
  }

  QueryBuilder<IsarRelSourceEntityPlain, IsarRelSourceEntityPlain, QAfterSortBy>
      thenByTLongDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tLong', Sort.desc);
    });
  }

  QueryBuilder<IsarRelSourceEntityPlain, IsarRelSourceEntityPlain, QAfterSortBy>
      thenByTString() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tString', Sort.asc);
    });
  }

  QueryBuilder<IsarRelSourceEntityPlain, IsarRelSourceEntityPlain, QAfterSortBy>
      thenByTStringDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tString', Sort.desc);
    });
  }
}

extension IsarRelSourceEntityPlainQueryWhereDistinct on QueryBuilder<
    IsarRelSourceEntityPlain, IsarRelSourceEntityPlain, QDistinct> {
  QueryBuilder<IsarRelSourceEntityPlain, IsarRelSourceEntityPlain, QDistinct>
      distinctByRelTargetId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'relTargetId');
    });
  }

  QueryBuilder<IsarRelSourceEntityPlain, IsarRelSourceEntityPlain, QDistinct>
      distinctByTLong() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tLong');
    });
  }

  QueryBuilder<IsarRelSourceEntityPlain, IsarRelSourceEntityPlain, QDistinct>
      distinctByTString({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tString', caseSensitive: caseSensitive);
    });
  }
}

extension IsarRelSourceEntityPlainQueryProperty on QueryBuilder<
    IsarRelSourceEntityPlain, IsarRelSourceEntityPlain, QQueryProperty> {
  QueryBuilder<IsarRelSourceEntityPlain, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<IsarRelSourceEntityPlain, int, QQueryOperations>
      relTargetIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'relTargetId');
    });
  }

  QueryBuilder<IsarRelSourceEntityPlain, int, QQueryOperations>
      tLongProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tLong');
    });
  }

  QueryBuilder<IsarRelSourceEntityPlain, String, QQueryOperations>
      tStringProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tString');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetIsarRelSourceEntityIndexedCollection on Isar {
  IsarCollection<IsarRelSourceEntityIndexed> get isarRelSourceEntityIndexeds =>
      this.collection();
}

const IsarRelSourceEntityIndexedSchema = CollectionSchema(
  name: r'IsarRelSourceEntityIndexed',
  id: 5093477347101802819,
  properties: {
    r'relTargetId': PropertySchema(
      id: 0,
      name: r'relTargetId',
      type: IsarType.long,
    ),
    r'tLong': PropertySchema(
      id: 1,
      name: r'tLong',
      type: IsarType.long,
    ),
    r'tString': PropertySchema(
      id: 2,
      name: r'tString',
      type: IsarType.string,
    )
  },
  estimateSize: _isarRelSourceEntityIndexedEstimateSize,
  serialize: _isarRelSourceEntityIndexedSerialize,
  deserialize: _isarRelSourceEntityIndexedDeserialize,
  deserializeProp: _isarRelSourceEntityIndexedDeserializeProp,
  idName: r'id',
  indexes: {
    r'tString': IndexSchema(
      id: 7280886163538708692,
      name: r'tString',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'tString',
          type: IndexType.value,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {
    r'isarRelTarget': LinkSchema(
      id: -6529791987183957346,
      name: r'isarRelTarget',
      target: r'IsarRelTargetEntity',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _isarRelSourceEntityIndexedGetId,
  getLinks: _isarRelSourceEntityIndexedGetLinks,
  attach: _isarRelSourceEntityIndexedAttach,
  version: '3.1.0',
);

int _isarRelSourceEntityIndexedEstimateSize(
  IsarRelSourceEntityIndexed object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.tString.length * 3;
  return bytesCount;
}

void _isarRelSourceEntityIndexedSerialize(
  IsarRelSourceEntityIndexed object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.relTargetId);
  writer.writeLong(offsets[1], object.tLong);
  writer.writeString(offsets[2], object.tString);
}

IsarRelSourceEntityIndexed _isarRelSourceEntityIndexedDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarRelSourceEntityIndexed(
    id,
    reader.readString(offsets[2]),
    reader.readLong(offsets[1]),
    reader.readLongOrNull(offsets[0]) ?? 0,
  );
  return object;
}

P _isarRelSourceEntityIndexedDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _isarRelSourceEntityIndexedGetId(IsarRelSourceEntityIndexed object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _isarRelSourceEntityIndexedGetLinks(
    IsarRelSourceEntityIndexed object) {
  return [object.isarRelTarget];
}

void _isarRelSourceEntityIndexedAttach(
    IsarCollection<dynamic> col, Id id, IsarRelSourceEntityIndexed object) {
  object.id = id;
  object.isarRelTarget.attach(
      col, col.isar.collection<IsarRelTargetEntity>(), r'isarRelTarget', id);
}

extension IsarRelSourceEntityIndexedQueryWhereSort on QueryBuilder<
    IsarRelSourceEntityIndexed, IsarRelSourceEntityIndexed, QWhere> {
  QueryBuilder<IsarRelSourceEntityIndexed, IsarRelSourceEntityIndexed,
      QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<IsarRelSourceEntityIndexed, IsarRelSourceEntityIndexed,
      QAfterWhere> anyTString() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'tString'),
      );
    });
  }
}

extension IsarRelSourceEntityIndexedQueryWhere on QueryBuilder<
    IsarRelSourceEntityIndexed, IsarRelSourceEntityIndexed, QWhereClause> {
  QueryBuilder<IsarRelSourceEntityIndexed, IsarRelSourceEntityIndexed,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<IsarRelSourceEntityIndexed, IsarRelSourceEntityIndexed,
      QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<IsarRelSourceEntityIndexed, IsarRelSourceEntityIndexed,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<IsarRelSourceEntityIndexed, IsarRelSourceEntityIndexed,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<IsarRelSourceEntityIndexed, IsarRelSourceEntityIndexed,
      QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarRelSourceEntityIndexed, IsarRelSourceEntityIndexed,
      QAfterWhereClause> tStringEqualTo(String tString) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'tString',
        value: [tString],
      ));
    });
  }

  QueryBuilder<IsarRelSourceEntityIndexed, IsarRelSourceEntityIndexed,
      QAfterWhereClause> tStringNotEqualTo(String tString) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'tString',
              lower: [],
              upper: [tString],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'tString',
              lower: [tString],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'tString',
              lower: [tString],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'tString',
              lower: [],
              upper: [tString],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<IsarRelSourceEntityIndexed, IsarRelSourceEntityIndexed,
      QAfterWhereClause> tStringGreaterThan(
    String tString, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'tString',
        lower: [tString],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<IsarRelSourceEntityIndexed, IsarRelSourceEntityIndexed,
      QAfterWhereClause> tStringLessThan(
    String tString, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'tString',
        lower: [],
        upper: [tString],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<IsarRelSourceEntityIndexed, IsarRelSourceEntityIndexed,
      QAfterWhereClause> tStringBetween(
    String lowerTString,
    String upperTString, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'tString',
        lower: [lowerTString],
        includeLower: includeLower,
        upper: [upperTString],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarRelSourceEntityIndexed, IsarRelSourceEntityIndexed,
      QAfterWhereClause> tStringStartsWith(String TStringPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'tString',
        lower: [TStringPrefix],
        upper: ['$TStringPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<IsarRelSourceEntityIndexed, IsarRelSourceEntityIndexed,
      QAfterWhereClause> tStringIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'tString',
        value: [''],
      ));
    });
  }

  QueryBuilder<IsarRelSourceEntityIndexed, IsarRelSourceEntityIndexed,
      QAfterWhereClause> tStringIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'tString',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'tString',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'tString',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'tString',
              upper: [''],
            ));
      }
    });
  }
}

extension IsarRelSourceEntityIndexedQueryFilter on QueryBuilder<
    IsarRelSourceEntityIndexed, IsarRelSourceEntityIndexed, QFilterCondition> {
  QueryBuilder<IsarRelSourceEntityIndexed, IsarRelSourceEntityIndexed,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarRelSourceEntityIndexed, IsarRelSourceEntityIndexed,
      QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarRelSourceEntityIndexed, IsarRelSourceEntityIndexed,
      QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarRelSourceEntityIndexed, IsarRelSourceEntityIndexed,
      QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarRelSourceEntityIndexed, IsarRelSourceEntityIndexed,
      QAfterFilterCondition> relTargetIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'relTargetId',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarRelSourceEntityIndexed, IsarRelSourceEntityIndexed,
      QAfterFilterCondition> relTargetIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'relTargetId',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarRelSourceEntityIndexed, IsarRelSourceEntityIndexed,
      QAfterFilterCondition> relTargetIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'relTargetId',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarRelSourceEntityIndexed, IsarRelSourceEntityIndexed,
      QAfterFilterCondition> relTargetIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'relTargetId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarRelSourceEntityIndexed, IsarRelSourceEntityIndexed,
      QAfterFilterCondition> tLongEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tLong',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarRelSourceEntityIndexed, IsarRelSourceEntityIndexed,
      QAfterFilterCondition> tLongGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tLong',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarRelSourceEntityIndexed, IsarRelSourceEntityIndexed,
      QAfterFilterCondition> tLongLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tLong',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarRelSourceEntityIndexed, IsarRelSourceEntityIndexed,
      QAfterFilterCondition> tLongBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tLong',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarRelSourceEntityIndexed, IsarRelSourceEntityIndexed,
      QAfterFilterCondition> tStringEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarRelSourceEntityIndexed, IsarRelSourceEntityIndexed,
      QAfterFilterCondition> tStringGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarRelSourceEntityIndexed, IsarRelSourceEntityIndexed,
      QAfterFilterCondition> tStringLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarRelSourceEntityIndexed, IsarRelSourceEntityIndexed,
      QAfterFilterCondition> tStringBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tString',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarRelSourceEntityIndexed, IsarRelSourceEntityIndexed,
      QAfterFilterCondition> tStringStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarRelSourceEntityIndexed, IsarRelSourceEntityIndexed,
      QAfterFilterCondition> tStringEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarRelSourceEntityIndexed, IsarRelSourceEntityIndexed,
          QAfterFilterCondition>
      tStringContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarRelSourceEntityIndexed, IsarRelSourceEntityIndexed,
          QAfterFilterCondition>
      tStringMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tString',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarRelSourceEntityIndexed, IsarRelSourceEntityIndexed,
      QAfterFilterCondition> tStringIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tString',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarRelSourceEntityIndexed, IsarRelSourceEntityIndexed,
      QAfterFilterCondition> tStringIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tString',
        value: '',
      ));
    });
  }
}

extension IsarRelSourceEntityIndexedQueryObject on QueryBuilder<
    IsarRelSourceEntityIndexed, IsarRelSourceEntityIndexed, QFilterCondition> {}

extension IsarRelSourceEntityIndexedQueryLinks on QueryBuilder<
    IsarRelSourceEntityIndexed, IsarRelSourceEntityIndexed, QFilterCondition> {
  QueryBuilder<IsarRelSourceEntityIndexed, IsarRelSourceEntityIndexed,
      QAfterFilterCondition> isarRelTarget(FilterQuery<IsarRelTargetEntity> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'isarRelTarget');
    });
  }

  QueryBuilder<IsarRelSourceEntityIndexed, IsarRelSourceEntityIndexed,
      QAfterFilterCondition> isarRelTargetIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'isarRelTarget', 0, true, 0, true);
    });
  }
}

extension IsarRelSourceEntityIndexedQuerySortBy on QueryBuilder<
    IsarRelSourceEntityIndexed, IsarRelSourceEntityIndexed, QSortBy> {
  QueryBuilder<IsarRelSourceEntityIndexed, IsarRelSourceEntityIndexed,
      QAfterSortBy> sortByRelTargetId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'relTargetId', Sort.asc);
    });
  }

  QueryBuilder<IsarRelSourceEntityIndexed, IsarRelSourceEntityIndexed,
      QAfterSortBy> sortByRelTargetIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'relTargetId', Sort.desc);
    });
  }

  QueryBuilder<IsarRelSourceEntityIndexed, IsarRelSourceEntityIndexed,
      QAfterSortBy> sortByTLong() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tLong', Sort.asc);
    });
  }

  QueryBuilder<IsarRelSourceEntityIndexed, IsarRelSourceEntityIndexed,
      QAfterSortBy> sortByTLongDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tLong', Sort.desc);
    });
  }

  QueryBuilder<IsarRelSourceEntityIndexed, IsarRelSourceEntityIndexed,
      QAfterSortBy> sortByTString() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tString', Sort.asc);
    });
  }

  QueryBuilder<IsarRelSourceEntityIndexed, IsarRelSourceEntityIndexed,
      QAfterSortBy> sortByTStringDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tString', Sort.desc);
    });
  }
}

extension IsarRelSourceEntityIndexedQuerySortThenBy on QueryBuilder<
    IsarRelSourceEntityIndexed, IsarRelSourceEntityIndexed, QSortThenBy> {
  QueryBuilder<IsarRelSourceEntityIndexed, IsarRelSourceEntityIndexed,
      QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<IsarRelSourceEntityIndexed, IsarRelSourceEntityIndexed,
      QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<IsarRelSourceEntityIndexed, IsarRelSourceEntityIndexed,
      QAfterSortBy> thenByRelTargetId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'relTargetId', Sort.asc);
    });
  }

  QueryBuilder<IsarRelSourceEntityIndexed, IsarRelSourceEntityIndexed,
      QAfterSortBy> thenByRelTargetIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'relTargetId', Sort.desc);
    });
  }

  QueryBuilder<IsarRelSourceEntityIndexed, IsarRelSourceEntityIndexed,
      QAfterSortBy> thenByTLong() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tLong', Sort.asc);
    });
  }

  QueryBuilder<IsarRelSourceEntityIndexed, IsarRelSourceEntityIndexed,
      QAfterSortBy> thenByTLongDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tLong', Sort.desc);
    });
  }

  QueryBuilder<IsarRelSourceEntityIndexed, IsarRelSourceEntityIndexed,
      QAfterSortBy> thenByTString() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tString', Sort.asc);
    });
  }

  QueryBuilder<IsarRelSourceEntityIndexed, IsarRelSourceEntityIndexed,
      QAfterSortBy> thenByTStringDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tString', Sort.desc);
    });
  }
}

extension IsarRelSourceEntityIndexedQueryWhereDistinct on QueryBuilder<
    IsarRelSourceEntityIndexed, IsarRelSourceEntityIndexed, QDistinct> {
  QueryBuilder<IsarRelSourceEntityIndexed, IsarRelSourceEntityIndexed,
      QDistinct> distinctByRelTargetId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'relTargetId');
    });
  }

  QueryBuilder<IsarRelSourceEntityIndexed, IsarRelSourceEntityIndexed,
      QDistinct> distinctByTLong() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tLong');
    });
  }

  QueryBuilder<IsarRelSourceEntityIndexed, IsarRelSourceEntityIndexed,
      QDistinct> distinctByTString({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tString', caseSensitive: caseSensitive);
    });
  }
}

extension IsarRelSourceEntityIndexedQueryProperty on QueryBuilder<
    IsarRelSourceEntityIndexed, IsarRelSourceEntityIndexed, QQueryProperty> {
  QueryBuilder<IsarRelSourceEntityIndexed, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<IsarRelSourceEntityIndexed, int, QQueryOperations>
      relTargetIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'relTargetId');
    });
  }

  QueryBuilder<IsarRelSourceEntityIndexed, int, QQueryOperations>
      tLongProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tLong');
    });
  }

  QueryBuilder<IsarRelSourceEntityIndexed, String, QQueryOperations>
      tStringProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tString');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetIsarRelTargetEntityCollection on Isar {
  IsarCollection<IsarRelTargetEntity> get isarRelTargetEntitys =>
      this.collection();
}

const IsarRelTargetEntitySchema = CollectionSchema(
  name: r'IsarRelTargetEntity',
  id: 1571110083769651877,
  properties: {
    r'name': PropertySchema(
      id: 0,
      name: r'name',
      type: IsarType.string,
    )
  },
  estimateSize: _isarRelTargetEntityEstimateSize,
  serialize: _isarRelTargetEntitySerialize,
  deserialize: _isarRelTargetEntityDeserialize,
  deserializeProp: _isarRelTargetEntityDeserializeProp,
  idName: r'id',
  indexes: {
    r'name': IndexSchema(
      id: 879695947855722453,
      name: r'name',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'name',
          type: IndexType.value,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _isarRelTargetEntityGetId,
  getLinks: _isarRelTargetEntityGetLinks,
  attach: _isarRelTargetEntityAttach,
  version: '3.1.0',
);

int _isarRelTargetEntityEstimateSize(
  IsarRelTargetEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _isarRelTargetEntitySerialize(
  IsarRelTargetEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.name);
}

IsarRelTargetEntity _isarRelTargetEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarRelTargetEntity(
    id,
    reader.readString(offsets[0]),
  );
  return object;
}

P _isarRelTargetEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _isarRelTargetEntityGetId(IsarRelTargetEntity object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _isarRelTargetEntityGetLinks(
    IsarRelTargetEntity object) {
  return [];
}

void _isarRelTargetEntityAttach(
    IsarCollection<dynamic> col, Id id, IsarRelTargetEntity object) {
  object.id = id;
}

extension IsarRelTargetEntityQueryWhereSort
    on QueryBuilder<IsarRelTargetEntity, IsarRelTargetEntity, QWhere> {
  QueryBuilder<IsarRelTargetEntity, IsarRelTargetEntity, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<IsarRelTargetEntity, IsarRelTargetEntity, QAfterWhere>
      anyName() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'name'),
      );
    });
  }
}

extension IsarRelTargetEntityQueryWhere
    on QueryBuilder<IsarRelTargetEntity, IsarRelTargetEntity, QWhereClause> {
  QueryBuilder<IsarRelTargetEntity, IsarRelTargetEntity, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<IsarRelTargetEntity, IsarRelTargetEntity, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<IsarRelTargetEntity, IsarRelTargetEntity, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<IsarRelTargetEntity, IsarRelTargetEntity, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<IsarRelTargetEntity, IsarRelTargetEntity, QAfterWhereClause>
      idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarRelTargetEntity, IsarRelTargetEntity, QAfterWhereClause>
      nameEqualTo(String name) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'name',
        value: [name],
      ));
    });
  }

  QueryBuilder<IsarRelTargetEntity, IsarRelTargetEntity, QAfterWhereClause>
      nameNotEqualTo(String name) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [],
              upper: [name],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [name],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [name],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [],
              upper: [name],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<IsarRelTargetEntity, IsarRelTargetEntity, QAfterWhereClause>
      nameGreaterThan(
    String name, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'name',
        lower: [name],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<IsarRelTargetEntity, IsarRelTargetEntity, QAfterWhereClause>
      nameLessThan(
    String name, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'name',
        lower: [],
        upper: [name],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<IsarRelTargetEntity, IsarRelTargetEntity, QAfterWhereClause>
      nameBetween(
    String lowerName,
    String upperName, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'name',
        lower: [lowerName],
        includeLower: includeLower,
        upper: [upperName],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarRelTargetEntity, IsarRelTargetEntity, QAfterWhereClause>
      nameStartsWith(String NamePrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'name',
        lower: [NamePrefix],
        upper: ['$NamePrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<IsarRelTargetEntity, IsarRelTargetEntity, QAfterWhereClause>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'name',
        value: [''],
      ));
    });
  }

  QueryBuilder<IsarRelTargetEntity, IsarRelTargetEntity, QAfterWhereClause>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'name',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'name',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'name',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'name',
              upper: [''],
            ));
      }
    });
  }
}

extension IsarRelTargetEntityQueryFilter on QueryBuilder<IsarRelTargetEntity,
    IsarRelTargetEntity, QFilterCondition> {
  QueryBuilder<IsarRelTargetEntity, IsarRelTargetEntity, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarRelTargetEntity, IsarRelTargetEntity, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarRelTargetEntity, IsarRelTargetEntity, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarRelTargetEntity, IsarRelTargetEntity, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarRelTargetEntity, IsarRelTargetEntity, QAfterFilterCondition>
      nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarRelTargetEntity, IsarRelTargetEntity, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarRelTargetEntity, IsarRelTargetEntity, QAfterFilterCondition>
      nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarRelTargetEntity, IsarRelTargetEntity, QAfterFilterCondition>
      nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarRelTargetEntity, IsarRelTargetEntity, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarRelTargetEntity, IsarRelTargetEntity, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarRelTargetEntity, IsarRelTargetEntity, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarRelTargetEntity, IsarRelTargetEntity, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarRelTargetEntity, IsarRelTargetEntity, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarRelTargetEntity, IsarRelTargetEntity, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }
}

extension IsarRelTargetEntityQueryObject on QueryBuilder<IsarRelTargetEntity,
    IsarRelTargetEntity, QFilterCondition> {}

extension IsarRelTargetEntityQueryLinks on QueryBuilder<IsarRelTargetEntity,
    IsarRelTargetEntity, QFilterCondition> {}

extension IsarRelTargetEntityQuerySortBy
    on QueryBuilder<IsarRelTargetEntity, IsarRelTargetEntity, QSortBy> {
  QueryBuilder<IsarRelTargetEntity, IsarRelTargetEntity, QAfterSortBy>
      sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<IsarRelTargetEntity, IsarRelTargetEntity, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension IsarRelTargetEntityQuerySortThenBy
    on QueryBuilder<IsarRelTargetEntity, IsarRelTargetEntity, QSortThenBy> {
  QueryBuilder<IsarRelTargetEntity, IsarRelTargetEntity, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<IsarRelTargetEntity, IsarRelTargetEntity, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<IsarRelTargetEntity, IsarRelTargetEntity, QAfterSortBy>
      thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<IsarRelTargetEntity, IsarRelTargetEntity, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension IsarRelTargetEntityQueryWhereDistinct
    on QueryBuilder<IsarRelTargetEntity, IsarRelTargetEntity, QDistinct> {
  QueryBuilder<IsarRelTargetEntity, IsarRelTargetEntity, QDistinct>
      distinctByName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }
}

extension IsarRelTargetEntityQueryProperty
    on QueryBuilder<IsarRelTargetEntity, IsarRelTargetEntity, QQueryProperty> {
  QueryBuilder<IsarRelTargetEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<IsarRelTargetEntity, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }
}
