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
  static const VerificationMeta _userStatusMeta =
      const VerificationMeta('userStatus');
  @override
  late final GeneratedColumnWithTypeConverter<EUserStatus, String> userStatus =
      GeneratedColumn<String>('user_status', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<EUserStatus>($ActionHistoryTable.$converteruserStatus);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumnWithTypeConverter<EAction, String> type =
      GeneratedColumn<String>('type', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<EAction>($ActionHistoryTable.$convertertype);
  static const VerificationMeta _questionMeta =
      const VerificationMeta('question');
  @override
  late final GeneratedColumn<String> question = GeneratedColumn<String>(
      'question', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _answerMeta = const VerificationMeta('answer');
  @override
  late final GeneratedColumn<String> answer = GeneratedColumn<String>(
      'answer', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _changeCapacityMeta =
      const VerificationMeta('changeCapacity');
  @override
  late final GeneratedColumn<double> changeCapacity = GeneratedColumn<double>(
      'change_capacity', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        createdAt,
        updatedAt,
        userStatus,
        type,
        question,
        answer,
        changeCapacity
      ];
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
    context.handle(_userStatusMeta, const VerificationResult.success());
    context.handle(_typeMeta, const VerificationResult.success());
    if (data.containsKey('question')) {
      context.handle(_questionMeta,
          question.isAcceptableOrUnknown(data['question']!, _questionMeta));
    } else if (isInserting) {
      context.missing(_questionMeta);
    }
    if (data.containsKey('answer')) {
      context.handle(_answerMeta,
          answer.isAcceptableOrUnknown(data['answer']!, _answerMeta));
    } else if (isInserting) {
      context.missing(_answerMeta);
    }
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
      userStatus: $ActionHistoryTable.$converteruserStatus.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}user_status'])!),
      type: $ActionHistoryTable.$convertertype.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!),
      question: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}question'])!,
      answer: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}answer'])!,
      changeCapacity: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}change_capacity'])!,
    );
  }

  @override
  $ActionHistoryTable createAlias(String alias) {
    return $ActionHistoryTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<EUserStatus, String, String> $converteruserStatus =
      const EnumNameConverter<EUserStatus>(EUserStatus.values);
  static JsonTypeConverter2<EAction, String, String> $convertertype =
      const EnumNameConverter<EAction>(EAction.values);
}

class ActionHistoryData extends DataClass
    implements Insertable<ActionHistoryData> {
  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final EUserStatus userStatus;
  final EAction type;
  final String question;
  final String answer;
  final double changeCapacity;
  const ActionHistoryData(
      {required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.userStatus,
      required this.type,
      required this.question,
      required this.answer,
      required this.changeCapacity});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    {
      map['user_status'] = Variable<String>(
          $ActionHistoryTable.$converteruserStatus.toSql(userStatus));
    }
    {
      map['type'] =
          Variable<String>($ActionHistoryTable.$convertertype.toSql(type));
    }
    map['question'] = Variable<String>(question);
    map['answer'] = Variable<String>(answer);
    map['change_capacity'] = Variable<double>(changeCapacity);
    return map;
  }

  ActionHistoryCompanion toCompanion(bool nullToAbsent) {
    return ActionHistoryCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      userStatus: Value(userStatus),
      type: Value(type),
      question: Value(question),
      answer: Value(answer),
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
      userStatus: $ActionHistoryTable.$converteruserStatus
          .fromJson(serializer.fromJson<String>(json['userStatus'])),
      type: $ActionHistoryTable.$convertertype
          .fromJson(serializer.fromJson<String>(json['type'])),
      question: serializer.fromJson<String>(json['question']),
      answer: serializer.fromJson<String>(json['answer']),
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
      'userStatus': serializer.toJson<String>(
          $ActionHistoryTable.$converteruserStatus.toJson(userStatus)),
      'type': serializer
          .toJson<String>($ActionHistoryTable.$convertertype.toJson(type)),
      'question': serializer.toJson<String>(question),
      'answer': serializer.toJson<String>(answer),
      'changeCapacity': serializer.toJson<double>(changeCapacity),
    };
  }

  ActionHistoryData copyWith(
          {int? id,
          DateTime? createdAt,
          DateTime? updatedAt,
          EUserStatus? userStatus,
          EAction? type,
          String? question,
          String? answer,
          double? changeCapacity}) =>
      ActionHistoryData(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        userStatus: userStatus ?? this.userStatus,
        type: type ?? this.type,
        question: question ?? this.question,
        answer: answer ?? this.answer,
        changeCapacity: changeCapacity ?? this.changeCapacity,
      );
  @override
  String toString() {
    return (StringBuffer('ActionHistoryData(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('userStatus: $userStatus, ')
          ..write('type: $type, ')
          ..write('question: $question, ')
          ..write('answer: $answer, ')
          ..write('changeCapacity: $changeCapacity')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, createdAt, updatedAt, userStatus, type,
      question, answer, changeCapacity);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ActionHistoryData &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.userStatus == this.userStatus &&
          other.type == this.type &&
          other.question == this.question &&
          other.answer == this.answer &&
          other.changeCapacity == this.changeCapacity);
}

class ActionHistoryCompanion extends UpdateCompanion<ActionHistoryData> {
  final Value<int> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<EUserStatus> userStatus;
  final Value<EAction> type;
  final Value<String> question;
  final Value<String> answer;
  final Value<double> changeCapacity;
  const ActionHistoryCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.userStatus = const Value.absent(),
    this.type = const Value.absent(),
    this.question = const Value.absent(),
    this.answer = const Value.absent(),
    this.changeCapacity = const Value.absent(),
  });
  ActionHistoryCompanion.insert({
    this.id = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    required EUserStatus userStatus,
    required EAction type,
    required String question,
    required String answer,
    required double changeCapacity,
  })  : createdAt = Value(createdAt),
        updatedAt = Value(updatedAt),
        userStatus = Value(userStatus),
        type = Value(type),
        question = Value(question),
        answer = Value(answer),
        changeCapacity = Value(changeCapacity);
  static Insertable<ActionHistoryData> custom({
    Expression<int>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? userStatus,
    Expression<String>? type,
    Expression<String>? question,
    Expression<String>? answer,
    Expression<double>? changeCapacity,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (userStatus != null) 'user_status': userStatus,
      if (type != null) 'type': type,
      if (question != null) 'question': question,
      if (answer != null) 'answer': answer,
      if (changeCapacity != null) 'change_capacity': changeCapacity,
    });
  }

  ActionHistoryCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<EUserStatus>? userStatus,
      Value<EAction>? type,
      Value<String>? question,
      Value<String>? answer,
      Value<double>? changeCapacity}) {
    return ActionHistoryCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      userStatus: userStatus ?? this.userStatus,
      type: type ?? this.type,
      question: question ?? this.question,
      answer: answer ?? this.answer,
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
    if (userStatus.present) {
      map['user_status'] = Variable<String>(
          $ActionHistoryTable.$converteruserStatus.toSql(userStatus.value));
    }
    if (type.present) {
      map['type'] = Variable<String>(
          $ActionHistoryTable.$convertertype.toSql(type.value));
    }
    if (question.present) {
      map['question'] = Variable<String>(question.value);
    }
    if (answer.present) {
      map['answer'] = Variable<String>(answer.value);
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
          ..write('userStatus: $userStatus, ')
          ..write('type: $type, ')
          ..write('question: $question, ')
          ..write('answer: $answer, ')
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
  static const VerificationMeta _userStatusMeta =
      const VerificationMeta('userStatus');
  @override
  late final GeneratedColumnWithTypeConverter<EUserStatus, String> userStatus =
      GeneratedColumn<String>('user_status', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<EUserStatus>(
              $ChallengeHistoryTable.$converteruserStatus);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumnWithTypeConverter<EChallenge, String> type =
      GeneratedColumn<String>('type', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<EChallenge>($ChallengeHistoryTable.$convertertype);
  static const VerificationMeta _analysisContentMeta =
      const VerificationMeta('analysisContent');
  @override
  late final GeneratedColumn<String> analysisContent = GeneratedColumn<String>(
      'analysis_content', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _changeCapacityMeta =
      const VerificationMeta('changeCapacity');
  @override
  late final GeneratedColumn<double> changeCapacity = GeneratedColumn<double>(
      'change_capacity', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        createdAt,
        updatedAt,
        userStatus,
        type,
        analysisContent,
        changeCapacity
      ];
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
    context.handle(_userStatusMeta, const VerificationResult.success());
    context.handle(_typeMeta, const VerificationResult.success());
    if (data.containsKey('analysis_content')) {
      context.handle(
          _analysisContentMeta,
          analysisContent.isAcceptableOrUnknown(
              data['analysis_content']!, _analysisContentMeta));
    } else if (isInserting) {
      context.missing(_analysisContentMeta);
    }
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
      userStatus: $ChallengeHistoryTable.$converteruserStatus.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}user_status'])!),
      type: $ChallengeHistoryTable.$convertertype.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!),
      analysisContent: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}analysis_content'])!,
      changeCapacity: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}change_capacity'])!,
    );
  }

  @override
  $ChallengeHistoryTable createAlias(String alias) {
    return $ChallengeHistoryTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<EUserStatus, String, String> $converteruserStatus =
      const EnumNameConverter<EUserStatus>(EUserStatus.values);
  static JsonTypeConverter2<EChallenge, String, String> $convertertype =
      const EnumNameConverter<EChallenge>(EChallenge.values);
}

class ChallengeHistoryData extends DataClass
    implements Insertable<ChallengeHistoryData> {
  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final EUserStatus userStatus;
  final EChallenge type;
  final String analysisContent;
  final double changeCapacity;
  const ChallengeHistoryData(
      {required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.userStatus,
      required this.type,
      required this.analysisContent,
      required this.changeCapacity});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    {
      map['user_status'] = Variable<String>(
          $ChallengeHistoryTable.$converteruserStatus.toSql(userStatus));
    }
    {
      map['type'] =
          Variable<String>($ChallengeHistoryTable.$convertertype.toSql(type));
    }
    map['analysis_content'] = Variable<String>(analysisContent);
    map['change_capacity'] = Variable<double>(changeCapacity);
    return map;
  }

  ChallengeHistoryCompanion toCompanion(bool nullToAbsent) {
    return ChallengeHistoryCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      userStatus: Value(userStatus),
      type: Value(type),
      analysisContent: Value(analysisContent),
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
      userStatus: $ChallengeHistoryTable.$converteruserStatus
          .fromJson(serializer.fromJson<String>(json['userStatus'])),
      type: $ChallengeHistoryTable.$convertertype
          .fromJson(serializer.fromJson<String>(json['type'])),
      analysisContent: serializer.fromJson<String>(json['analysisContent']),
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
      'userStatus': serializer.toJson<String>(
          $ChallengeHistoryTable.$converteruserStatus.toJson(userStatus)),
      'type': serializer
          .toJson<String>($ChallengeHistoryTable.$convertertype.toJson(type)),
      'analysisContent': serializer.toJson<String>(analysisContent),
      'changeCapacity': serializer.toJson<double>(changeCapacity),
    };
  }

  ChallengeHistoryData copyWith(
          {int? id,
          DateTime? createdAt,
          DateTime? updatedAt,
          EUserStatus? userStatus,
          EChallenge? type,
          String? analysisContent,
          double? changeCapacity}) =>
      ChallengeHistoryData(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        userStatus: userStatus ?? this.userStatus,
        type: type ?? this.type,
        analysisContent: analysisContent ?? this.analysisContent,
        changeCapacity: changeCapacity ?? this.changeCapacity,
      );
  @override
  String toString() {
    return (StringBuffer('ChallengeHistoryData(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('userStatus: $userStatus, ')
          ..write('type: $type, ')
          ..write('analysisContent: $analysisContent, ')
          ..write('changeCapacity: $changeCapacity')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, createdAt, updatedAt, userStatus, type,
      analysisContent, changeCapacity);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ChallengeHistoryData &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.userStatus == this.userStatus &&
          other.type == this.type &&
          other.analysisContent == this.analysisContent &&
          other.changeCapacity == this.changeCapacity);
}

class ChallengeHistoryCompanion extends UpdateCompanion<ChallengeHistoryData> {
  final Value<int> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<EUserStatus> userStatus;
  final Value<EChallenge> type;
  final Value<String> analysisContent;
  final Value<double> changeCapacity;
  const ChallengeHistoryCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.userStatus = const Value.absent(),
    this.type = const Value.absent(),
    this.analysisContent = const Value.absent(),
    this.changeCapacity = const Value.absent(),
  });
  ChallengeHistoryCompanion.insert({
    this.id = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    required EUserStatus userStatus,
    required EChallenge type,
    required String analysisContent,
    required double changeCapacity,
  })  : createdAt = Value(createdAt),
        updatedAt = Value(updatedAt),
        userStatus = Value(userStatus),
        type = Value(type),
        analysisContent = Value(analysisContent),
        changeCapacity = Value(changeCapacity);
  static Insertable<ChallengeHistoryData> custom({
    Expression<int>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? userStatus,
    Expression<String>? type,
    Expression<String>? analysisContent,
    Expression<double>? changeCapacity,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (userStatus != null) 'user_status': userStatus,
      if (type != null) 'type': type,
      if (analysisContent != null) 'analysis_content': analysisContent,
      if (changeCapacity != null) 'change_capacity': changeCapacity,
    });
  }

  ChallengeHistoryCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<EUserStatus>? userStatus,
      Value<EChallenge>? type,
      Value<String>? analysisContent,
      Value<double>? changeCapacity}) {
    return ChallengeHistoryCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      userStatus: userStatus ?? this.userStatus,
      type: type ?? this.type,
      analysisContent: analysisContent ?? this.analysisContent,
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
    if (userStatus.present) {
      map['user_status'] = Variable<String>(
          $ChallengeHistoryTable.$converteruserStatus.toSql(userStatus.value));
    }
    if (type.present) {
      map['type'] = Variable<String>(
          $ChallengeHistoryTable.$convertertype.toSql(type.value));
    }
    if (analysisContent.present) {
      map['analysis_content'] = Variable<String>(analysisContent.value);
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
          ..write('userStatus: $userStatus, ')
          ..write('type: $type, ')
          ..write('analysisContent: $analysisContent, ')
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
