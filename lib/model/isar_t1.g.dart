// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_t1.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetIsarT1Collection on Isar {
  IsarCollection<IsarT1> get isarT1s => this.collection();
}

const IsarT1Schema = CollectionSchema(
  name: r'IsarT1',
  id: 2497676931812558969,
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
  estimateSize: _isarT1EstimateSize,
  serialize: _isarT1Serialize,
  deserialize: _isarT1Deserialize,
  deserializeProp: _isarT1DeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _isarT1GetId,
  getLinks: _isarT1GetLinks,
  attach: _isarT1Attach,
  version: '3.0.5',
);

int _isarT1EstimateSize(
  IsarT1 object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.c.length * 3;
  return bytesCount;
}

void _isarT1Serialize(
  IsarT1 object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.a);
  writer.writeLong(offsets[1], object.b);
  writer.writeString(offsets[2], object.c);
}

IsarT1 _isarT1Deserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarT1(
    a: reader.readLong(offsets[0]),
    b: reader.readLong(offsets[1]),
    c: reader.readString(offsets[2]),
    id: id,
  );
  return object;
}

P _isarT1DeserializeProp<P>(
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

Id _isarT1GetId(IsarT1 object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _isarT1GetLinks(IsarT1 object) {
  return [];
}

void _isarT1Attach(IsarCollection<dynamic> col, Id id, IsarT1 object) {
  object.id = id;
}

extension IsarT1QueryWhereSort on QueryBuilder<IsarT1, IsarT1, QWhere> {
  QueryBuilder<IsarT1, IsarT1, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension IsarT1QueryWhere on QueryBuilder<IsarT1, IsarT1, QWhereClause> {
  QueryBuilder<IsarT1, IsarT1, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<IsarT1, IsarT1, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<IsarT1, IsarT1, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<IsarT1, IsarT1, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<IsarT1, IsarT1, QAfterWhereClause> idBetween(
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

extension IsarT1QueryFilter on QueryBuilder<IsarT1, IsarT1, QFilterCondition> {
  QueryBuilder<IsarT1, IsarT1, QAfterFilterCondition> aEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'a',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarT1, IsarT1, QAfterFilterCondition> aGreaterThan(
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

  QueryBuilder<IsarT1, IsarT1, QAfterFilterCondition> aLessThan(
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

  QueryBuilder<IsarT1, IsarT1, QAfterFilterCondition> aBetween(
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

  QueryBuilder<IsarT1, IsarT1, QAfterFilterCondition> bEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'b',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarT1, IsarT1, QAfterFilterCondition> bGreaterThan(
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

  QueryBuilder<IsarT1, IsarT1, QAfterFilterCondition> bLessThan(
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

  QueryBuilder<IsarT1, IsarT1, QAfterFilterCondition> bBetween(
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

  QueryBuilder<IsarT1, IsarT1, QAfterFilterCondition> cEqualTo(
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

  QueryBuilder<IsarT1, IsarT1, QAfterFilterCondition> cGreaterThan(
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

  QueryBuilder<IsarT1, IsarT1, QAfterFilterCondition> cLessThan(
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

  QueryBuilder<IsarT1, IsarT1, QAfterFilterCondition> cBetween(
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

  QueryBuilder<IsarT1, IsarT1, QAfterFilterCondition> cStartsWith(
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

  QueryBuilder<IsarT1, IsarT1, QAfterFilterCondition> cEndsWith(
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

  QueryBuilder<IsarT1, IsarT1, QAfterFilterCondition> cContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'c',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarT1, IsarT1, QAfterFilterCondition> cMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'c',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarT1, IsarT1, QAfterFilterCondition> cIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'c',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarT1, IsarT1, QAfterFilterCondition> cIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'c',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarT1, IsarT1, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<IsarT1, IsarT1, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<IsarT1, IsarT1, QAfterFilterCondition> idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarT1, IsarT1, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<IsarT1, IsarT1, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<IsarT1, IsarT1, QAfterFilterCondition> idBetween(
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

extension IsarT1QueryObject on QueryBuilder<IsarT1, IsarT1, QFilterCondition> {}

extension IsarT1QueryLinks on QueryBuilder<IsarT1, IsarT1, QFilterCondition> {}

extension IsarT1QuerySortBy on QueryBuilder<IsarT1, IsarT1, QSortBy> {
  QueryBuilder<IsarT1, IsarT1, QAfterSortBy> sortByA() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'a', Sort.asc);
    });
  }

  QueryBuilder<IsarT1, IsarT1, QAfterSortBy> sortByADesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'a', Sort.desc);
    });
  }

  QueryBuilder<IsarT1, IsarT1, QAfterSortBy> sortByB() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'b', Sort.asc);
    });
  }

  QueryBuilder<IsarT1, IsarT1, QAfterSortBy> sortByBDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'b', Sort.desc);
    });
  }

  QueryBuilder<IsarT1, IsarT1, QAfterSortBy> sortByC() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'c', Sort.asc);
    });
  }

  QueryBuilder<IsarT1, IsarT1, QAfterSortBy> sortByCDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'c', Sort.desc);
    });
  }
}

extension IsarT1QuerySortThenBy on QueryBuilder<IsarT1, IsarT1, QSortThenBy> {
  QueryBuilder<IsarT1, IsarT1, QAfterSortBy> thenByA() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'a', Sort.asc);
    });
  }

  QueryBuilder<IsarT1, IsarT1, QAfterSortBy> thenByADesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'a', Sort.desc);
    });
  }

  QueryBuilder<IsarT1, IsarT1, QAfterSortBy> thenByB() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'b', Sort.asc);
    });
  }

  QueryBuilder<IsarT1, IsarT1, QAfterSortBy> thenByBDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'b', Sort.desc);
    });
  }

  QueryBuilder<IsarT1, IsarT1, QAfterSortBy> thenByC() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'c', Sort.asc);
    });
  }

  QueryBuilder<IsarT1, IsarT1, QAfterSortBy> thenByCDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'c', Sort.desc);
    });
  }

  QueryBuilder<IsarT1, IsarT1, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<IsarT1, IsarT1, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension IsarT1QueryWhereDistinct on QueryBuilder<IsarT1, IsarT1, QDistinct> {
  QueryBuilder<IsarT1, IsarT1, QDistinct> distinctByA() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'a');
    });
  }

  QueryBuilder<IsarT1, IsarT1, QDistinct> distinctByB() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'b');
    });
  }

  QueryBuilder<IsarT1, IsarT1, QDistinct> distinctByC(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'c', caseSensitive: caseSensitive);
    });
  }
}

extension IsarT1QueryProperty on QueryBuilder<IsarT1, IsarT1, QQueryProperty> {
  QueryBuilder<IsarT1, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<IsarT1, int, QQueryOperations> aProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'a');
    });
  }

  QueryBuilder<IsarT1, int, QQueryOperations> bProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'b');
    });
  }

  QueryBuilder<IsarT1, String, QQueryOperations> cProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'c');
    });
  }
}
