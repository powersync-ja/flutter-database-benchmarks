// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_t3.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetIsarT3Collection on Isar {
  IsarCollection<IsarT3> get isarT3s => this.collection();
}

const IsarT3Schema = CollectionSchema(
  name: r'IsarT3',
  id: -4840348949355186165,
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
  estimateSize: _isarT3EstimateSize,
  serialize: _isarT3Serialize,
  deserialize: _isarT3Deserialize,
  deserializeProp: _isarT3DeserializeProp,
  idName: r'id',
  indexes: {
    r'a': IndexSchema(
      id: -1817709641818812897,
      name: r'a',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'a',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'b': IndexSchema(
      id: 6294355645245719615,
      name: r'b',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'b',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _isarT3GetId,
  getLinks: _isarT3GetLinks,
  attach: _isarT3Attach,
  version: '3.0.5',
);

int _isarT3EstimateSize(
  IsarT3 object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.c.length * 3;
  return bytesCount;
}

void _isarT3Serialize(
  IsarT3 object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.a);
  writer.writeLong(offsets[1], object.b);
  writer.writeString(offsets[2], object.c);
}

IsarT3 _isarT3Deserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarT3(
    a: reader.readLong(offsets[0]),
    b: reader.readLong(offsets[1]),
    c: reader.readString(offsets[2]),
    id: id,
  );
  return object;
}

P _isarT3DeserializeProp<P>(
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

Id _isarT3GetId(IsarT3 object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _isarT3GetLinks(IsarT3 object) {
  return [];
}

void _isarT3Attach(IsarCollection<dynamic> col, Id id, IsarT3 object) {
  object.id = id;
}

extension IsarT3QueryWhereSort on QueryBuilder<IsarT3, IsarT3, QWhere> {
  QueryBuilder<IsarT3, IsarT3, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<IsarT3, IsarT3, QAfterWhere> anyA() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'a'),
      );
    });
  }

  QueryBuilder<IsarT3, IsarT3, QAfterWhere> anyB() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'b'),
      );
    });
  }
}

extension IsarT3QueryWhere on QueryBuilder<IsarT3, IsarT3, QWhereClause> {
  QueryBuilder<IsarT3, IsarT3, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<IsarT3, IsarT3, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<IsarT3, IsarT3, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<IsarT3, IsarT3, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<IsarT3, IsarT3, QAfterWhereClause> idBetween(
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

  QueryBuilder<IsarT3, IsarT3, QAfterWhereClause> aEqualTo(int a) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'a',
        value: [a],
      ));
    });
  }

  QueryBuilder<IsarT3, IsarT3, QAfterWhereClause> aNotEqualTo(int a) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'a',
              lower: [],
              upper: [a],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'a',
              lower: [a],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'a',
              lower: [a],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'a',
              lower: [],
              upper: [a],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<IsarT3, IsarT3, QAfterWhereClause> aGreaterThan(
    int a, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'a',
        lower: [a],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<IsarT3, IsarT3, QAfterWhereClause> aLessThan(
    int a, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'a',
        lower: [],
        upper: [a],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<IsarT3, IsarT3, QAfterWhereClause> aBetween(
    int lowerA,
    int upperA, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'a',
        lower: [lowerA],
        includeLower: includeLower,
        upper: [upperA],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarT3, IsarT3, QAfterWhereClause> bEqualTo(int b) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'b',
        value: [b],
      ));
    });
  }

  QueryBuilder<IsarT3, IsarT3, QAfterWhereClause> bNotEqualTo(int b) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'b',
              lower: [],
              upper: [b],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'b',
              lower: [b],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'b',
              lower: [b],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'b',
              lower: [],
              upper: [b],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<IsarT3, IsarT3, QAfterWhereClause> bGreaterThan(
    int b, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'b',
        lower: [b],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<IsarT3, IsarT3, QAfterWhereClause> bLessThan(
    int b, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'b',
        lower: [],
        upper: [b],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<IsarT3, IsarT3, QAfterWhereClause> bBetween(
    int lowerB,
    int upperB, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'b',
        lower: [lowerB],
        includeLower: includeLower,
        upper: [upperB],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension IsarT3QueryFilter on QueryBuilder<IsarT3, IsarT3, QFilterCondition> {
  QueryBuilder<IsarT3, IsarT3, QAfterFilterCondition> aEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'a',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarT3, IsarT3, QAfterFilterCondition> aGreaterThan(
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

  QueryBuilder<IsarT3, IsarT3, QAfterFilterCondition> aLessThan(
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

  QueryBuilder<IsarT3, IsarT3, QAfterFilterCondition> aBetween(
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

  QueryBuilder<IsarT3, IsarT3, QAfterFilterCondition> bEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'b',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarT3, IsarT3, QAfterFilterCondition> bGreaterThan(
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

  QueryBuilder<IsarT3, IsarT3, QAfterFilterCondition> bLessThan(
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

  QueryBuilder<IsarT3, IsarT3, QAfterFilterCondition> bBetween(
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

  QueryBuilder<IsarT3, IsarT3, QAfterFilterCondition> cEqualTo(
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

  QueryBuilder<IsarT3, IsarT3, QAfterFilterCondition> cGreaterThan(
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

  QueryBuilder<IsarT3, IsarT3, QAfterFilterCondition> cLessThan(
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

  QueryBuilder<IsarT3, IsarT3, QAfterFilterCondition> cBetween(
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

  QueryBuilder<IsarT3, IsarT3, QAfterFilterCondition> cStartsWith(
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

  QueryBuilder<IsarT3, IsarT3, QAfterFilterCondition> cEndsWith(
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

  QueryBuilder<IsarT3, IsarT3, QAfterFilterCondition> cContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'c',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarT3, IsarT3, QAfterFilterCondition> cMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'c',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarT3, IsarT3, QAfterFilterCondition> cIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'c',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarT3, IsarT3, QAfterFilterCondition> cIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'c',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarT3, IsarT3, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<IsarT3, IsarT3, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<IsarT3, IsarT3, QAfterFilterCondition> idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarT3, IsarT3, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<IsarT3, IsarT3, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<IsarT3, IsarT3, QAfterFilterCondition> idBetween(
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

extension IsarT3QueryObject on QueryBuilder<IsarT3, IsarT3, QFilterCondition> {}

extension IsarT3QueryLinks on QueryBuilder<IsarT3, IsarT3, QFilterCondition> {}

extension IsarT3QuerySortBy on QueryBuilder<IsarT3, IsarT3, QSortBy> {
  QueryBuilder<IsarT3, IsarT3, QAfterSortBy> sortByA() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'a', Sort.asc);
    });
  }

  QueryBuilder<IsarT3, IsarT3, QAfterSortBy> sortByADesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'a', Sort.desc);
    });
  }

  QueryBuilder<IsarT3, IsarT3, QAfterSortBy> sortByB() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'b', Sort.asc);
    });
  }

  QueryBuilder<IsarT3, IsarT3, QAfterSortBy> sortByBDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'b', Sort.desc);
    });
  }

  QueryBuilder<IsarT3, IsarT3, QAfterSortBy> sortByC() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'c', Sort.asc);
    });
  }

  QueryBuilder<IsarT3, IsarT3, QAfterSortBy> sortByCDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'c', Sort.desc);
    });
  }
}

extension IsarT3QuerySortThenBy on QueryBuilder<IsarT3, IsarT3, QSortThenBy> {
  QueryBuilder<IsarT3, IsarT3, QAfterSortBy> thenByA() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'a', Sort.asc);
    });
  }

  QueryBuilder<IsarT3, IsarT3, QAfterSortBy> thenByADesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'a', Sort.desc);
    });
  }

  QueryBuilder<IsarT3, IsarT3, QAfterSortBy> thenByB() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'b', Sort.asc);
    });
  }

  QueryBuilder<IsarT3, IsarT3, QAfterSortBy> thenByBDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'b', Sort.desc);
    });
  }

  QueryBuilder<IsarT3, IsarT3, QAfterSortBy> thenByC() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'c', Sort.asc);
    });
  }

  QueryBuilder<IsarT3, IsarT3, QAfterSortBy> thenByCDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'c', Sort.desc);
    });
  }

  QueryBuilder<IsarT3, IsarT3, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<IsarT3, IsarT3, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension IsarT3QueryWhereDistinct on QueryBuilder<IsarT3, IsarT3, QDistinct> {
  QueryBuilder<IsarT3, IsarT3, QDistinct> distinctByA() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'a');
    });
  }

  QueryBuilder<IsarT3, IsarT3, QDistinct> distinctByB() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'b');
    });
  }

  QueryBuilder<IsarT3, IsarT3, QDistinct> distinctByC(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'c', caseSensitive: caseSensitive);
    });
  }
}

extension IsarT3QueryProperty on QueryBuilder<IsarT3, IsarT3, QQueryProperty> {
  QueryBuilder<IsarT3, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<IsarT3, int, QQueryOperations> aProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'a');
    });
  }

  QueryBuilder<IsarT3, int, QQueryOperations> bProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'b');
    });
  }

  QueryBuilder<IsarT3, String, QQueryOperations> cProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'c');
    });
  }
}
