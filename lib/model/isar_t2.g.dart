// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_t2.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetIsarT2Collection on Isar {
  IsarCollection<IsarT2> get isarT2s => this.collection();
}

const IsarT2Schema = CollectionSchema(
  name: r'IsarT2',
  id: -4055392996100025350,
  properties: {
    r'a': PropertySchema(
      id: 0,
      name: r'a',
      type: IsarType.long,
    ),
    r'b': PropertySchema(
      id: 1,
      name: r'b',
      type: IsarType.long,
    ),
    r'c': PropertySchema(
      id: 2,
      name: r'c',
      type: IsarType.string,
    )
  },
  estimateSize: _isarT2EstimateSize,
  serialize: _isarT2Serialize,
  deserialize: _isarT2Deserialize,
  deserializeProp: _isarT2DeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _isarT2GetId,
  getLinks: _isarT2GetLinks,
  attach: _isarT2Attach,
  version: '3.0.5',
);

int _isarT2EstimateSize(
  IsarT2 object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.c.length * 3;
  return bytesCount;
}

void _isarT2Serialize(
  IsarT2 object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.a);
  writer.writeLong(offsets[1], object.b);
  writer.writeString(offsets[2], object.c);
}

IsarT2 _isarT2Deserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarT2(
    a: reader.readLong(offsets[0]),
    b: reader.readLong(offsets[1]),
    c: reader.readString(offsets[2]),
    id: id,
  );
  return object;
}

P _isarT2DeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _isarT2GetId(IsarT2 object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _isarT2GetLinks(IsarT2 object) {
  return [];
}

void _isarT2Attach(IsarCollection<dynamic> col, Id id, IsarT2 object) {
  object.id = id;
}

extension IsarT2QueryWhereSort on QueryBuilder<IsarT2, IsarT2, QWhere> {
  QueryBuilder<IsarT2, IsarT2, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension IsarT2QueryWhere on QueryBuilder<IsarT2, IsarT2, QWhereClause> {
  QueryBuilder<IsarT2, IsarT2, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<IsarT2, IsarT2, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<IsarT2, IsarT2, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<IsarT2, IsarT2, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<IsarT2, IsarT2, QAfterWhereClause> idBetween(
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

extension IsarT2QueryFilter on QueryBuilder<IsarT2, IsarT2, QFilterCondition> {
  QueryBuilder<IsarT2, IsarT2, QAfterFilterCondition> aEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'a',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarT2, IsarT2, QAfterFilterCondition> aGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'a',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarT2, IsarT2, QAfterFilterCondition> aLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'a',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarT2, IsarT2, QAfterFilterCondition> aBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'a',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarT2, IsarT2, QAfterFilterCondition> bEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'b',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarT2, IsarT2, QAfterFilterCondition> bGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'b',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarT2, IsarT2, QAfterFilterCondition> bLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'b',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarT2, IsarT2, QAfterFilterCondition> bBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'b',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarT2, IsarT2, QAfterFilterCondition> cEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'c',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarT2, IsarT2, QAfterFilterCondition> cGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'c',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarT2, IsarT2, QAfterFilterCondition> cLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'c',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarT2, IsarT2, QAfterFilterCondition> cBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'c',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarT2, IsarT2, QAfterFilterCondition> cStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'c',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarT2, IsarT2, QAfterFilterCondition> cEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'c',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarT2, IsarT2, QAfterFilterCondition> cContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'c',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarT2, IsarT2, QAfterFilterCondition> cMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'c',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarT2, IsarT2, QAfterFilterCondition> cIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'c',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarT2, IsarT2, QAfterFilterCondition> cIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'c',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarT2, IsarT2, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<IsarT2, IsarT2, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<IsarT2, IsarT2, QAfterFilterCondition> idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarT2, IsarT2, QAfterFilterCondition> idGreaterThan(
    Id? value, {
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

  QueryBuilder<IsarT2, IsarT2, QAfterFilterCondition> idLessThan(
    Id? value, {
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

  QueryBuilder<IsarT2, IsarT2, QAfterFilterCondition> idBetween(
    Id? lower,
    Id? upper, {
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
}

extension IsarT2QueryObject on QueryBuilder<IsarT2, IsarT2, QFilterCondition> {}

extension IsarT2QueryLinks on QueryBuilder<IsarT2, IsarT2, QFilterCondition> {}

extension IsarT2QuerySortBy on QueryBuilder<IsarT2, IsarT2, QSortBy> {
  QueryBuilder<IsarT2, IsarT2, QAfterSortBy> sortByA() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'a', Sort.asc);
    });
  }

  QueryBuilder<IsarT2, IsarT2, QAfterSortBy> sortByADesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'a', Sort.desc);
    });
  }

  QueryBuilder<IsarT2, IsarT2, QAfterSortBy> sortByB() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'b', Sort.asc);
    });
  }

  QueryBuilder<IsarT2, IsarT2, QAfterSortBy> sortByBDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'b', Sort.desc);
    });
  }

  QueryBuilder<IsarT2, IsarT2, QAfterSortBy> sortByC() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'c', Sort.asc);
    });
  }

  QueryBuilder<IsarT2, IsarT2, QAfterSortBy> sortByCDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'c', Sort.desc);
    });
  }
}

extension IsarT2QuerySortThenBy on QueryBuilder<IsarT2, IsarT2, QSortThenBy> {
  QueryBuilder<IsarT2, IsarT2, QAfterSortBy> thenByA() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'a', Sort.asc);
    });
  }

  QueryBuilder<IsarT2, IsarT2, QAfterSortBy> thenByADesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'a', Sort.desc);
    });
  }

  QueryBuilder<IsarT2, IsarT2, QAfterSortBy> thenByB() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'b', Sort.asc);
    });
  }

  QueryBuilder<IsarT2, IsarT2, QAfterSortBy> thenByBDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'b', Sort.desc);
    });
  }

  QueryBuilder<IsarT2, IsarT2, QAfterSortBy> thenByC() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'c', Sort.asc);
    });
  }

  QueryBuilder<IsarT2, IsarT2, QAfterSortBy> thenByCDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'c', Sort.desc);
    });
  }

  QueryBuilder<IsarT2, IsarT2, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<IsarT2, IsarT2, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension IsarT2QueryWhereDistinct on QueryBuilder<IsarT2, IsarT2, QDistinct> {
  QueryBuilder<IsarT2, IsarT2, QDistinct> distinctByA() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'a');
    });
  }

  QueryBuilder<IsarT2, IsarT2, QDistinct> distinctByB() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'b');
    });
  }

  QueryBuilder<IsarT2, IsarT2, QDistinct> distinctByC(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'c', caseSensitive: caseSensitive);
    });
  }
}

extension IsarT2QueryProperty on QueryBuilder<IsarT2, IsarT2, QQueryProperty> {
  QueryBuilder<IsarT2, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<IsarT2, int, QQueryOperations> aProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'a');
    });
  }

  QueryBuilder<IsarT2, int, QQueryOperations> bProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'b');
    });
  }

  QueryBuilder<IsarT2, String, QQueryOperations> cProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'c');
    });
  }
}
