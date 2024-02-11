// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_database.dart';

// ignore_for_file: type=lint
class $ActionHistoryTable extends ActionHistory
    with TableInfo<$ActionHistoryTable, ActionHistoryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ActionHistoryTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumnWithTypeConverter<EAction, String> type =
      GeneratedColumn<String>('type', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<EAction>($ActionHistoryTable.$convertertype);
  static const VerificationMeta _changeCapacityMeta =
      const VerificationMeta('changeCapacity');
  @override
  late final GeneratedColumn<double> changeCapacity = GeneratedColumn<double>(
      'change_capacity', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, createdAt, updatedAt, type, changeCapacity];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'action_history';
  @override
  VerificationContext validateIntegrity(Insertable<ActionHistoryData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    context.handle(_typeMeta, const VerificationResult.success());
    if (data.containsKey('change_capacity')) {
      context.handle(
          _changeCapacityMeta,
          changeCapacity.isAcceptableOrUnknown(
              data['change_capacity']!, _changeCapacityMeta));
    } else if (isInserting) {
      context.missing(_changeCapacityMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ActionHistoryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ActionHistoryData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      type: $ActionHistoryTable.$convertertype.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!),
      changeCapacity: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}change_capacity'])!,
    );
  }

  @override
  $ActionHistoryTable createAlias(String alias) {
    return $ActionHistoryTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<EAction, String, String> $convertertype =
      const EnumNameConverter<EAction>(EAction.values);
}

class ActionHistoryData extends DataClass
    implements Insertable<ActionHistoryData> {
  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final EAction type;
  final double changeCapacity;
  const ActionHistoryData(
      {required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.type,
      required this.changeCapacity});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    {
      map['type'] =
          Variable<String>($ActionHistoryTable.$convertertype.toSql(type));
    }
    map['change_capacity'] = Variable<double>(changeCapacity);
    return map;
  }

  ActionHistoryCompanion toCompanion(bool nullToAbsent) {
    return ActionHistoryCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      type: Value(type),
      changeCapacity: Value(changeCapacity),
    );
  }

  factory ActionHistoryData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ActionHistoryData(
      id: serializer.fromJson<int>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      type: $ActionHistoryTable.$convertertype
          .fromJson(serializer.fromJson<String>(json['type'])),
      changeCapacity: serializer.fromJson<double>(json['changeCapacity']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'type': serializer
          .toJson<String>($ActionHistoryTable.$convertertype.toJson(type)),
      'changeCapacity': serializer.toJson<double>(changeCapacity),
    };
  }

  ActionHistoryData copyWith(
          {int? id,
          DateTime? createdAt,
          DateTime? updatedAt,
          EAction? type,
          double? changeCapacity}) =>
      ActionHistoryData(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        type: type ?? this.type,
        changeCapacity: changeCapacity ?? this.changeCapacity,
      );
  @override
  String toString() {
    return (StringBuffer('ActionHistoryData(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('type: $type, ')
          ..write('changeCapacity: $changeCapacity')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, createdAt, updatedAt, type, changeCapacity);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ActionHistoryData &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.type == this.type &&
          other.changeCapacity == this.changeCapacity);
}

class ActionHistoryCompanion extends UpdateCompanion<ActionHistoryData> {
  final Value<int> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<EAction> type;
  final Value<double> changeCapacity;
  const ActionHistoryCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.type = const Value.absent(),
    this.changeCapacity = const Value.absent(),
  });
  ActionHistoryCompanion.insert({
    this.id = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    required EAction type,
    required double changeCapacity,
  })  : createdAt = Value(createdAt),
        updatedAt = Value(updatedAt),
        type = Value(type),
        changeCapacity = Value(changeCapacity);
  static Insertable<ActionHistoryData> custom({
    Expression<int>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? type,
    Expression<double>? changeCapacity,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (type != null) 'type': type,
      if (changeCapacity != null) 'change_capacity': changeCapacity,
    });
  }

  ActionHistoryCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<EAction>? type,
      Value<double>? changeCapacity}) {
    return ActionHistoryCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      type: type ?? this.type,
      changeCapacity: changeCapacity ?? this.changeCapacity,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(
          $ActionHistoryTable.$convertertype.toSql(type.value));
    }
    if (changeCapacity.present) {
      map['change_capacity'] = Variable<double>(changeCapacity.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ActionHistoryCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('type: $type, ')
          ..write('changeCapacity: $changeCapacity')
          ..write(')'))
        .toString();
  }
}

class $ChallengeHistoryTable extends ChallengeHistory
    with TableInfo<$ChallengeHistoryTable, ChallengeHistoryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChallengeHistoryTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumnWithTypeConverter<EChallenge, String> type =
      GeneratedColumn<String>('type', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<EChallenge>($ChallengeHistoryTable.$convertertype);
  static const VerificationMeta _changeCapacityMeta =
      const VerificationMeta('changeCapacity');
  @override
  late final GeneratedColumn<double> changeCapacity = GeneratedColumn<double>(
      'change_capacity', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, createdAt, updatedAt, type, changeCapacity];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'challenge_history';
  @override
  VerificationContext validateIntegrity(
      Insertable<ChallengeHistoryData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    context.handle(_typeMeta, const VerificationResult.success());
    if (data.containsKey('change_capacity')) {
      context.handle(
          _changeCapacityMeta,
          changeCapacity.isAcceptableOrUnknown(
              data['change_capacity']!, _changeCapacityMeta));
    } else if (isInserting) {
      context.missing(_changeCapacityMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ChallengeHistoryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ChallengeHistoryData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      type: $ChallengeHistoryTable.$convertertype.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!),
      changeCapacity: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}change_capacity'])!,
    );
  }

  @override
  $ChallengeHistoryTable createAlias(String alias) {
    return $ChallengeHistoryTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<EChallenge, String, String> $convertertype =
      const EnumNameConverter<EChallenge>(EChallenge.values);
}

class ChallengeHistoryData extends DataClass
    implements Insertable<ChallengeHistoryData> {
  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final EChallenge type;
  final double changeCapacity;
  const ChallengeHistoryData(
      {required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.type,
      required this.changeCapacity});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    {
      map['type'] =
          Variable<String>($ChallengeHistoryTable.$convertertype.toSql(type));
    }
    map['change_capacity'] = Variable<double>(changeCapacity);
    return map;
  }

  ChallengeHistoryCompanion toCompanion(bool nullToAbsent) {
    return ChallengeHistoryCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      type: Value(type),
      changeCapacity: Value(changeCapacity),
    );
  }

  factory ChallengeHistoryData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ChallengeHistoryData(
      id: serializer.fromJson<int>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      type: $ChallengeHistoryTable.$convertertype
          .fromJson(serializer.fromJson<String>(json['type'])),
      changeCapacity: serializer.fromJson<double>(json['changeCapacity']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'type': serializer
          .toJson<String>($ChallengeHistoryTable.$convertertype.toJson(type)),
      'changeCapacity': serializer.toJson<double>(changeCapacity),
    };
  }

  ChallengeHistoryData copyWith(
          {int? id,
          DateTime? createdAt,
          DateTime? updatedAt,
          EChallenge? type,
          double? changeCapacity}) =>
      ChallengeHistoryData(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        type: type ?? this.type,
        changeCapacity: changeCapacity ?? this.changeCapacity,
      );
  @override
  String toString() {
    return (StringBuffer('ChallengeHistoryData(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('type: $type, ')
          ..write('changeCapacity: $changeCapacity')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, createdAt, updatedAt, type, changeCapacity);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ChallengeHistoryData &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.type == this.type &&
          other.changeCapacity == this.changeCapacity);
}

class ChallengeHistoryCompanion extends UpdateCompanion<ChallengeHistoryData> {
  final Value<int> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<EChallenge> type;
  final Value<double> changeCapacity;
  const ChallengeHistoryCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.type = const Value.absent(),
    this.changeCapacity = const Value.absent(),
  });
  ChallengeHistoryCompanion.insert({
    this.id = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    required EChallenge type,
    required double changeCapacity,
  })  : createdAt = Value(createdAt),
        updatedAt = Value(updatedAt),
        type = Value(type),
        changeCapacity = Value(changeCapacity);
  static Insertable<ChallengeHistoryData> custom({
    Expression<int>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? type,
    Expression<double>? changeCapacity,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (type != null) 'type': type,
      if (changeCapacity != null) 'change_capacity': changeCapacity,
    });
  }

  ChallengeHistoryCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<EChallenge>? type,
      Value<double>? changeCapacity}) {
    return ChallengeHistoryCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      type: type ?? this.type,
      changeCapacity: changeCapacity ?? this.changeCapacity,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(
          $ChallengeHistoryTable.$convertertype.toSql(type.value));
    }
    if (changeCapacity.present) {
      map['change_capacity'] = Variable<double>(changeCapacity.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChallengeHistoryCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('type: $type, ')
          ..write('changeCapacity: $changeCapacity')
          ..write(')'))
        .toString();
  }
}

abstract class _$LocalDatabase extends GeneratedDatabase {
  _$LocalDatabase(QueryExecutor e) : super(e);
  late final $ActionHistoryTable actionHistory = $ActionHistoryTable(this);
  late final $ChallengeHistoryTable challengeHistory =
      $ChallengeHistoryTable(this);
  late final ActionHistoryDao actionHistoryDao =
      ActionHistoryDao(this as LocalDatabase);
  late final ChallengeHistoryDao challengeHistoryDao =
      ChallengeHistoryDao(this as LocalDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [actionHistory, challengeHistory];
}
