// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $ToolUsersTable extends ToolUsers
    with TableInfo<$ToolUsersTable, ToolUser> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ToolUsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _toolUserIdMeta =
      const VerificationMeta('toolUserId');
  @override
  late final GeneratedColumn<int> toolUserId = GeneratedColumn<int>(
      'tool_user_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _firstNameMeta =
      const VerificationMeta('firstName');
  @override
  late final GeneratedColumn<String> firstName = GeneratedColumn<String>(
      'first_name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 6, maxTextLength: 16),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _lastNameMeta =
      const VerificationMeta('lastName');
  @override
  late final GeneratedColumn<String> lastName = GeneratedColumn<String>(
      'last_name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 6, maxTextLength: 16),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _frontNationalIdImagePathMeta =
      const VerificationMeta('frontNationalIdImagePath');
  @override
  late final GeneratedColumn<String> frontNationalIdImagePath =
      GeneratedColumn<String>(
          'front_national_id_image_path', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _backNationalIdImagePathMeta =
      const VerificationMeta('backNationalIdImagePath');
  @override
  late final GeneratedColumn<String> backNationalIdImagePath =
      GeneratedColumn<String>('back_national_id_image_path', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _avatarImagePathMeta =
      const VerificationMeta('avatarImagePath');
  @override
  late final GeneratedColumn<String> avatarImagePath = GeneratedColumn<String>(
      'avatar_image_path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _phoneNumberMeta =
      const VerificationMeta('phoneNumber');
  @override
  late final GeneratedColumn<int> phoneNumber = GeneratedColumn<int>(
      'phone_number', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _countryCallingCodeMeta =
      const VerificationMeta('countryCallingCode');
  @override
  late final GeneratedColumn<int> countryCallingCode = GeneratedColumn<int>(
      'country_calling_code', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        toolUserId,
        firstName,
        lastName,
        frontNationalIdImagePath,
        backNationalIdImagePath,
        avatarImagePath,
        phoneNumber,
        countryCallingCode
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tool_users';
  @override
  VerificationContext validateIntegrity(Insertable<ToolUser> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('tool_user_id')) {
      context.handle(
          _toolUserIdMeta,
          toolUserId.isAcceptableOrUnknown(
              data['tool_user_id']!, _toolUserIdMeta));
    }
    if (data.containsKey('first_name')) {
      context.handle(_firstNameMeta,
          firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta));
    } else if (isInserting) {
      context.missing(_firstNameMeta);
    }
    if (data.containsKey('last_name')) {
      context.handle(_lastNameMeta,
          lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta));
    } else if (isInserting) {
      context.missing(_lastNameMeta);
    }
    if (data.containsKey('front_national_id_image_path')) {
      context.handle(
          _frontNationalIdImagePathMeta,
          frontNationalIdImagePath.isAcceptableOrUnknown(
              data['front_national_id_image_path']!,
              _frontNationalIdImagePathMeta));
    } else if (isInserting) {
      context.missing(_frontNationalIdImagePathMeta);
    }
    if (data.containsKey('back_national_id_image_path')) {
      context.handle(
          _backNationalIdImagePathMeta,
          backNationalIdImagePath.isAcceptableOrUnknown(
              data['back_national_id_image_path']!,
              _backNationalIdImagePathMeta));
    } else if (isInserting) {
      context.missing(_backNationalIdImagePathMeta);
    }
    if (data.containsKey('avatar_image_path')) {
      context.handle(
          _avatarImagePathMeta,
          avatarImagePath.isAcceptableOrUnknown(
              data['avatar_image_path']!, _avatarImagePathMeta));
    } else if (isInserting) {
      context.missing(_avatarImagePathMeta);
    }
    if (data.containsKey('phone_number')) {
      context.handle(
          _phoneNumberMeta,
          phoneNumber.isAcceptableOrUnknown(
              data['phone_number']!, _phoneNumberMeta));
    } else if (isInserting) {
      context.missing(_phoneNumberMeta);
    }
    if (data.containsKey('country_calling_code')) {
      context.handle(
          _countryCallingCodeMeta,
          countryCallingCode.isAcceptableOrUnknown(
              data['country_calling_code']!, _countryCallingCodeMeta));
    } else if (isInserting) {
      context.missing(_countryCallingCodeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {toolUserId};
  @override
  ToolUser map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ToolUser(
      toolUserId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}tool_user_id'])!,
      firstName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}first_name'])!,
      lastName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}last_name'])!,
      frontNationalIdImagePath: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}front_national_id_image_path'])!,
      backNationalIdImagePath: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}back_national_id_image_path'])!,
      avatarImagePath: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}avatar_image_path'])!,
      phoneNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}phone_number'])!,
      countryCallingCode: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}country_calling_code'])!,
    );
  }

  @override
  $ToolUsersTable createAlias(String alias) {
    return $ToolUsersTable(attachedDatabase, alias);
  }
}

class ToolUser extends DataClass implements Insertable<ToolUser> {
  final int toolUserId;
  final String firstName;
  final String lastName;
  final String frontNationalIdImagePath;
  final String backNationalIdImagePath;
  final String avatarImagePath;
  final int phoneNumber;
  final int countryCallingCode;
  const ToolUser(
      {required this.toolUserId,
      required this.firstName,
      required this.lastName,
      required this.frontNationalIdImagePath,
      required this.backNationalIdImagePath,
      required this.avatarImagePath,
      required this.phoneNumber,
      required this.countryCallingCode});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['tool_user_id'] = Variable<int>(toolUserId);
    map['first_name'] = Variable<String>(firstName);
    map['last_name'] = Variable<String>(lastName);
    map['front_national_id_image_path'] =
        Variable<String>(frontNationalIdImagePath);
    map['back_national_id_image_path'] =
        Variable<String>(backNationalIdImagePath);
    map['avatar_image_path'] = Variable<String>(avatarImagePath);
    map['phone_number'] = Variable<int>(phoneNumber);
    map['country_calling_code'] = Variable<int>(countryCallingCode);
    return map;
  }

  ToolUsersCompanion toCompanion(bool nullToAbsent) {
    return ToolUsersCompanion(
      toolUserId: Value(toolUserId),
      firstName: Value(firstName),
      lastName: Value(lastName),
      frontNationalIdImagePath: Value(frontNationalIdImagePath),
      backNationalIdImagePath: Value(backNationalIdImagePath),
      avatarImagePath: Value(avatarImagePath),
      phoneNumber: Value(phoneNumber),
      countryCallingCode: Value(countryCallingCode),
    );
  }

  factory ToolUser.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ToolUser(
      toolUserId: serializer.fromJson<int>(json['toolUserId']),
      firstName: serializer.fromJson<String>(json['firstName']),
      lastName: serializer.fromJson<String>(json['lastName']),
      frontNationalIdImagePath:
          serializer.fromJson<String>(json['frontNationalIdImagePath']),
      backNationalIdImagePath:
          serializer.fromJson<String>(json['backNationalIdImagePath']),
      avatarImagePath: serializer.fromJson<String>(json['avatarImagePath']),
      phoneNumber: serializer.fromJson<int>(json['phoneNumber']),
      countryCallingCode: serializer.fromJson<int>(json['countryCallingCode']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'toolUserId': serializer.toJson<int>(toolUserId),
      'firstName': serializer.toJson<String>(firstName),
      'lastName': serializer.toJson<String>(lastName),
      'frontNationalIdImagePath':
          serializer.toJson<String>(frontNationalIdImagePath),
      'backNationalIdImagePath':
          serializer.toJson<String>(backNationalIdImagePath),
      'avatarImagePath': serializer.toJson<String>(avatarImagePath),
      'phoneNumber': serializer.toJson<int>(phoneNumber),
      'countryCallingCode': serializer.toJson<int>(countryCallingCode),
    };
  }

  ToolUser copyWith(
          {int? toolUserId,
          String? firstName,
          String? lastName,
          String? frontNationalIdImagePath,
          String? backNationalIdImagePath,
          String? avatarImagePath,
          int? phoneNumber,
          int? countryCallingCode}) =>
      ToolUser(
        toolUserId: toolUserId ?? this.toolUserId,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        frontNationalIdImagePath:
            frontNationalIdImagePath ?? this.frontNationalIdImagePath,
        backNationalIdImagePath:
            backNationalIdImagePath ?? this.backNationalIdImagePath,
        avatarImagePath: avatarImagePath ?? this.avatarImagePath,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        countryCallingCode: countryCallingCode ?? this.countryCallingCode,
      );
  ToolUser copyWithCompanion(ToolUsersCompanion data) {
    return ToolUser(
      toolUserId:
          data.toolUserId.present ? data.toolUserId.value : this.toolUserId,
      firstName: data.firstName.present ? data.firstName.value : this.firstName,
      lastName: data.lastName.present ? data.lastName.value : this.lastName,
      frontNationalIdImagePath: data.frontNationalIdImagePath.present
          ? data.frontNationalIdImagePath.value
          : this.frontNationalIdImagePath,
      backNationalIdImagePath: data.backNationalIdImagePath.present
          ? data.backNationalIdImagePath.value
          : this.backNationalIdImagePath,
      avatarImagePath: data.avatarImagePath.present
          ? data.avatarImagePath.value
          : this.avatarImagePath,
      phoneNumber:
          data.phoneNumber.present ? data.phoneNumber.value : this.phoneNumber,
      countryCallingCode: data.countryCallingCode.present
          ? data.countryCallingCode.value
          : this.countryCallingCode,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ToolUser(')
          ..write('toolUserId: $toolUserId, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('frontNationalIdImagePath: $frontNationalIdImagePath, ')
          ..write('backNationalIdImagePath: $backNationalIdImagePath, ')
          ..write('avatarImagePath: $avatarImagePath, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('countryCallingCode: $countryCallingCode')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      toolUserId,
      firstName,
      lastName,
      frontNationalIdImagePath,
      backNationalIdImagePath,
      avatarImagePath,
      phoneNumber,
      countryCallingCode);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ToolUser &&
          other.toolUserId == this.toolUserId &&
          other.firstName == this.firstName &&
          other.lastName == this.lastName &&
          other.frontNationalIdImagePath == this.frontNationalIdImagePath &&
          other.backNationalIdImagePath == this.backNationalIdImagePath &&
          other.avatarImagePath == this.avatarImagePath &&
          other.phoneNumber == this.phoneNumber &&
          other.countryCallingCode == this.countryCallingCode);
}

class ToolUsersCompanion extends UpdateCompanion<ToolUser> {
  final Value<int> toolUserId;
  final Value<String> firstName;
  final Value<String> lastName;
  final Value<String> frontNationalIdImagePath;
  final Value<String> backNationalIdImagePath;
  final Value<String> avatarImagePath;
  final Value<int> phoneNumber;
  final Value<int> countryCallingCode;
  const ToolUsersCompanion({
    this.toolUserId = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.frontNationalIdImagePath = const Value.absent(),
    this.backNationalIdImagePath = const Value.absent(),
    this.avatarImagePath = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.countryCallingCode = const Value.absent(),
  });
  ToolUsersCompanion.insert({
    this.toolUserId = const Value.absent(),
    required String firstName,
    required String lastName,
    required String frontNationalIdImagePath,
    required String backNationalIdImagePath,
    required String avatarImagePath,
    required int phoneNumber,
    required int countryCallingCode,
  })  : firstName = Value(firstName),
        lastName = Value(lastName),
        frontNationalIdImagePath = Value(frontNationalIdImagePath),
        backNationalIdImagePath = Value(backNationalIdImagePath),
        avatarImagePath = Value(avatarImagePath),
        phoneNumber = Value(phoneNumber),
        countryCallingCode = Value(countryCallingCode);
  static Insertable<ToolUser> custom({
    Expression<int>? toolUserId,
    Expression<String>? firstName,
    Expression<String>? lastName,
    Expression<String>? frontNationalIdImagePath,
    Expression<String>? backNationalIdImagePath,
    Expression<String>? avatarImagePath,
    Expression<int>? phoneNumber,
    Expression<int>? countryCallingCode,
  }) {
    return RawValuesInsertable({
      if (toolUserId != null) 'tool_user_id': toolUserId,
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
      if (frontNationalIdImagePath != null)
        'front_national_id_image_path': frontNationalIdImagePath,
      if (backNationalIdImagePath != null)
        'back_national_id_image_path': backNationalIdImagePath,
      if (avatarImagePath != null) 'avatar_image_path': avatarImagePath,
      if (phoneNumber != null) 'phone_number': phoneNumber,
      if (countryCallingCode != null)
        'country_calling_code': countryCallingCode,
    });
  }

  ToolUsersCompanion copyWith(
      {Value<int>? toolUserId,
      Value<String>? firstName,
      Value<String>? lastName,
      Value<String>? frontNationalIdImagePath,
      Value<String>? backNationalIdImagePath,
      Value<String>? avatarImagePath,
      Value<int>? phoneNumber,
      Value<int>? countryCallingCode}) {
    return ToolUsersCompanion(
      toolUserId: toolUserId ?? this.toolUserId,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      frontNationalIdImagePath:
          frontNationalIdImagePath ?? this.frontNationalIdImagePath,
      backNationalIdImagePath:
          backNationalIdImagePath ?? this.backNationalIdImagePath,
      avatarImagePath: avatarImagePath ?? this.avatarImagePath,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      countryCallingCode: countryCallingCode ?? this.countryCallingCode,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (toolUserId.present) {
      map['tool_user_id'] = Variable<int>(toolUserId.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String>(firstName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String>(lastName.value);
    }
    if (frontNationalIdImagePath.present) {
      map['front_national_id_image_path'] =
          Variable<String>(frontNationalIdImagePath.value);
    }
    if (backNationalIdImagePath.present) {
      map['back_national_id_image_path'] =
          Variable<String>(backNationalIdImagePath.value);
    }
    if (avatarImagePath.present) {
      map['avatar_image_path'] = Variable<String>(avatarImagePath.value);
    }
    if (phoneNumber.present) {
      map['phone_number'] = Variable<int>(phoneNumber.value);
    }
    if (countryCallingCode.present) {
      map['country_calling_code'] = Variable<int>(countryCallingCode.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ToolUsersCompanion(')
          ..write('toolUserId: $toolUserId, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('frontNationalIdImagePath: $frontNationalIdImagePath, ')
          ..write('backNationalIdImagePath: $backNationalIdImagePath, ')
          ..write('avatarImagePath: $avatarImagePath, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('countryCallingCode: $countryCallingCode')
          ..write(')'))
        .toString();
  }
}

class $ToolsTable extends Tools with TableInfo<$ToolsTable, Tool> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ToolsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _toolIdMeta = const VerificationMeta('toolId');
  @override
  late final GeneratedColumn<int> toolId = GeneratedColumn<int>(
      'tool_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 4, maxTextLength: 18),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _boughtAtMeta =
      const VerificationMeta('boughtAt');
  @override
  late final GeneratedColumn<DateTime> boughtAt = GeneratedColumn<DateTime>(
      'bought_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _purchasedPriceMeta =
      const VerificationMeta('purchasedPrice');
  @override
  late final GeneratedColumn<int> purchasedPrice = GeneratedColumn<int>(
      'purchased_price', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _rateMeta = const VerificationMeta('rate');
  @override
  late final GeneratedColumn<int> rate = GeneratedColumn<int>(
      'rate', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _rentCountMeta =
      const VerificationMeta('rentCount');
  @override
  late final GeneratedColumn<int> rentCount = GeneratedColumn<int>(
      'rent_count', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _currencyMeta =
      const VerificationMeta('currency');
  @override
  late final GeneratedColumnWithTypeConverter<Currency, String> currency =
      GeneratedColumn<String>('currency', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<Currency>($ToolsTable.$convertercurrency);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumnWithTypeConverter<Category, String> category =
      GeneratedColumn<String>('category', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<Category>($ToolsTable.$convertercategory);
  static const VerificationMeta _toolImagePathMeta =
      const VerificationMeta('toolImagePath');
  @override
  late final GeneratedColumn<String> toolImagePath = GeneratedColumn<String>(
      'tool_image_path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _toolUniqueIdMeta =
      const VerificationMeta('toolUniqueId');
  @override
  late final GeneratedColumn<int> toolUniqueId = GeneratedColumn<int>(
      'tool_unique_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _toolUserIdMeta =
      const VerificationMeta('toolUserId');
  @override
  late final GeneratedColumn<int> toolUserId = GeneratedColumn<int>(
      'tool_user_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES tool_users (tool_user_id) ON DELETE SET NULL'));
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumnWithTypeConverter<Status, String> status =
      GeneratedColumn<String>('status', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<Status>($ToolsTable.$converterstatus);
  @override
  List<GeneratedColumn> get $columns => [
        toolId,
        name,
        boughtAt,
        purchasedPrice,
        rate,
        rentCount,
        currency,
        category,
        toolImagePath,
        toolUniqueId,
        toolUserId,
        status
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tools';
  @override
  VerificationContext validateIntegrity(Insertable<Tool> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('tool_id')) {
      context.handle(_toolIdMeta,
          toolId.isAcceptableOrUnknown(data['tool_id']!, _toolIdMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('bought_at')) {
      context.handle(_boughtAtMeta,
          boughtAt.isAcceptableOrUnknown(data['bought_at']!, _boughtAtMeta));
    } else if (isInserting) {
      context.missing(_boughtAtMeta);
    }
    if (data.containsKey('purchased_price')) {
      context.handle(
          _purchasedPriceMeta,
          purchasedPrice.isAcceptableOrUnknown(
              data['purchased_price']!, _purchasedPriceMeta));
    } else if (isInserting) {
      context.missing(_purchasedPriceMeta);
    }
    if (data.containsKey('rate')) {
      context.handle(
          _rateMeta, rate.isAcceptableOrUnknown(data['rate']!, _rateMeta));
    } else if (isInserting) {
      context.missing(_rateMeta);
    }
    if (data.containsKey('rent_count')) {
      context.handle(_rentCountMeta,
          rentCount.isAcceptableOrUnknown(data['rent_count']!, _rentCountMeta));
    } else if (isInserting) {
      context.missing(_rentCountMeta);
    }
    context.handle(_currencyMeta, const VerificationResult.success());
    context.handle(_categoryMeta, const VerificationResult.success());
    if (data.containsKey('tool_image_path')) {
      context.handle(
          _toolImagePathMeta,
          toolImagePath.isAcceptableOrUnknown(
              data['tool_image_path']!, _toolImagePathMeta));
    } else if (isInserting) {
      context.missing(_toolImagePathMeta);
    }
    if (data.containsKey('tool_unique_id')) {
      context.handle(
          _toolUniqueIdMeta,
          toolUniqueId.isAcceptableOrUnknown(
              data['tool_unique_id']!, _toolUniqueIdMeta));
    } else if (isInserting) {
      context.missing(_toolUniqueIdMeta);
    }
    if (data.containsKey('tool_user_id')) {
      context.handle(
          _toolUserIdMeta,
          toolUserId.isAcceptableOrUnknown(
              data['tool_user_id']!, _toolUserIdMeta));
    }
    context.handle(_statusMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {toolId};
  @override
  Tool map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Tool(
      toolId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}tool_id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      boughtAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}bought_at'])!,
      purchasedPrice: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}purchased_price'])!,
      rate: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}rate'])!,
      rentCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}rent_count'])!,
      currency: $ToolsTable.$convertercurrency.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}currency'])!),
      category: $ToolsTable.$convertercategory.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!),
      toolImagePath: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}tool_image_path'])!,
      toolUniqueId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}tool_unique_id'])!,
      toolUserId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}tool_user_id']),
      status: $ToolsTable.$converterstatus.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!),
    );
  }

  @override
  $ToolsTable createAlias(String alias) {
    return $ToolsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<Currency, String, String> $convertercurrency =
      const EnumNameConverter<Currency>(Currency.values);
  static JsonTypeConverter2<Category, String, String> $convertercategory =
      const EnumNameConverter<Category>(Category.values);
  static JsonTypeConverter2<Status, String, String> $converterstatus =
      const EnumNameConverter<Status>(Status.values);
}

class Tool extends DataClass implements Insertable<Tool> {
  final int toolId;
  final String name;
  final DateTime boughtAt;
  final int purchasedPrice;
  final int rate;
  final int rentCount;
  final Currency currency;
  final Category category;
  final String toolImagePath;
  final int toolUniqueId;
  final int? toolUserId;
  final Status status;
  const Tool(
      {required this.toolId,
      required this.name,
      required this.boughtAt,
      required this.purchasedPrice,
      required this.rate,
      required this.rentCount,
      required this.currency,
      required this.category,
      required this.toolImagePath,
      required this.toolUniqueId,
      this.toolUserId,
      required this.status});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['tool_id'] = Variable<int>(toolId);
    map['name'] = Variable<String>(name);
    map['bought_at'] = Variable<DateTime>(boughtAt);
    map['purchased_price'] = Variable<int>(purchasedPrice);
    map['rate'] = Variable<int>(rate);
    map['rent_count'] = Variable<int>(rentCount);
    {
      map['currency'] =
          Variable<String>($ToolsTable.$convertercurrency.toSql(currency));
    }
    {
      map['category'] =
          Variable<String>($ToolsTable.$convertercategory.toSql(category));
    }
    map['tool_image_path'] = Variable<String>(toolImagePath);
    map['tool_unique_id'] = Variable<int>(toolUniqueId);
    if (!nullToAbsent || toolUserId != null) {
      map['tool_user_id'] = Variable<int>(toolUserId);
    }
    {
      map['status'] =
          Variable<String>($ToolsTable.$converterstatus.toSql(status));
    }
    return map;
  }

  ToolsCompanion toCompanion(bool nullToAbsent) {
    return ToolsCompanion(
      toolId: Value(toolId),
      name: Value(name),
      boughtAt: Value(boughtAt),
      purchasedPrice: Value(purchasedPrice),
      rate: Value(rate),
      rentCount: Value(rentCount),
      currency: Value(currency),
      category: Value(category),
      toolImagePath: Value(toolImagePath),
      toolUniqueId: Value(toolUniqueId),
      toolUserId: toolUserId == null && nullToAbsent
          ? const Value.absent()
          : Value(toolUserId),
      status: Value(status),
    );
  }

  factory Tool.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Tool(
      toolId: serializer.fromJson<int>(json['toolId']),
      name: serializer.fromJson<String>(json['name']),
      boughtAt: serializer.fromJson<DateTime>(json['boughtAt']),
      purchasedPrice: serializer.fromJson<int>(json['purchasedPrice']),
      rate: serializer.fromJson<int>(json['rate']),
      rentCount: serializer.fromJson<int>(json['rentCount']),
      currency: $ToolsTable.$convertercurrency
          .fromJson(serializer.fromJson<String>(json['currency'])),
      category: $ToolsTable.$convertercategory
          .fromJson(serializer.fromJson<String>(json['category'])),
      toolImagePath: serializer.fromJson<String>(json['toolImagePath']),
      toolUniqueId: serializer.fromJson<int>(json['toolUniqueId']),
      toolUserId: serializer.fromJson<int?>(json['toolUserId']),
      status: $ToolsTable.$converterstatus
          .fromJson(serializer.fromJson<String>(json['status'])),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'toolId': serializer.toJson<int>(toolId),
      'name': serializer.toJson<String>(name),
      'boughtAt': serializer.toJson<DateTime>(boughtAt),
      'purchasedPrice': serializer.toJson<int>(purchasedPrice),
      'rate': serializer.toJson<int>(rate),
      'rentCount': serializer.toJson<int>(rentCount),
      'currency': serializer
          .toJson<String>($ToolsTable.$convertercurrency.toJson(currency)),
      'category': serializer
          .toJson<String>($ToolsTable.$convertercategory.toJson(category)),
      'toolImagePath': serializer.toJson<String>(toolImagePath),
      'toolUniqueId': serializer.toJson<int>(toolUniqueId),
      'toolUserId': serializer.toJson<int?>(toolUserId),
      'status': serializer
          .toJson<String>($ToolsTable.$converterstatus.toJson(status)),
    };
  }

  Tool copyWith(
          {int? toolId,
          String? name,
          DateTime? boughtAt,
          int? purchasedPrice,
          int? rate,
          int? rentCount,
          Currency? currency,
          Category? category,
          String? toolImagePath,
          int? toolUniqueId,
          Value<int?> toolUserId = const Value.absent(),
          Status? status}) =>
      Tool(
        toolId: toolId ?? this.toolId,
        name: name ?? this.name,
        boughtAt: boughtAt ?? this.boughtAt,
        purchasedPrice: purchasedPrice ?? this.purchasedPrice,
        rate: rate ?? this.rate,
        rentCount: rentCount ?? this.rentCount,
        currency: currency ?? this.currency,
        category: category ?? this.category,
        toolImagePath: toolImagePath ?? this.toolImagePath,
        toolUniqueId: toolUniqueId ?? this.toolUniqueId,
        toolUserId: toolUserId.present ? toolUserId.value : this.toolUserId,
        status: status ?? this.status,
      );
  Tool copyWithCompanion(ToolsCompanion data) {
    return Tool(
      toolId: data.toolId.present ? data.toolId.value : this.toolId,
      name: data.name.present ? data.name.value : this.name,
      boughtAt: data.boughtAt.present ? data.boughtAt.value : this.boughtAt,
      purchasedPrice: data.purchasedPrice.present
          ? data.purchasedPrice.value
          : this.purchasedPrice,
      rate: data.rate.present ? data.rate.value : this.rate,
      rentCount: data.rentCount.present ? data.rentCount.value : this.rentCount,
      currency: data.currency.present ? data.currency.value : this.currency,
      category: data.category.present ? data.category.value : this.category,
      toolImagePath: data.toolImagePath.present
          ? data.toolImagePath.value
          : this.toolImagePath,
      toolUniqueId: data.toolUniqueId.present
          ? data.toolUniqueId.value
          : this.toolUniqueId,
      toolUserId:
          data.toolUserId.present ? data.toolUserId.value : this.toolUserId,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Tool(')
          ..write('toolId: $toolId, ')
          ..write('name: $name, ')
          ..write('boughtAt: $boughtAt, ')
          ..write('purchasedPrice: $purchasedPrice, ')
          ..write('rate: $rate, ')
          ..write('rentCount: $rentCount, ')
          ..write('currency: $currency, ')
          ..write('category: $category, ')
          ..write('toolImagePath: $toolImagePath, ')
          ..write('toolUniqueId: $toolUniqueId, ')
          ..write('toolUserId: $toolUserId, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      toolId,
      name,
      boughtAt,
      purchasedPrice,
      rate,
      rentCount,
      currency,
      category,
      toolImagePath,
      toolUniqueId,
      toolUserId,
      status);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Tool &&
          other.toolId == this.toolId &&
          other.name == this.name &&
          other.boughtAt == this.boughtAt &&
          other.purchasedPrice == this.purchasedPrice &&
          other.rate == this.rate &&
          other.rentCount == this.rentCount &&
          other.currency == this.currency &&
          other.category == this.category &&
          other.toolImagePath == this.toolImagePath &&
          other.toolUniqueId == this.toolUniqueId &&
          other.toolUserId == this.toolUserId &&
          other.status == this.status);
}

class ToolsCompanion extends UpdateCompanion<Tool> {
  final Value<int> toolId;
  final Value<String> name;
  final Value<DateTime> boughtAt;
  final Value<int> purchasedPrice;
  final Value<int> rate;
  final Value<int> rentCount;
  final Value<Currency> currency;
  final Value<Category> category;
  final Value<String> toolImagePath;
  final Value<int> toolUniqueId;
  final Value<int?> toolUserId;
  final Value<Status> status;
  const ToolsCompanion({
    this.toolId = const Value.absent(),
    this.name = const Value.absent(),
    this.boughtAt = const Value.absent(),
    this.purchasedPrice = const Value.absent(),
    this.rate = const Value.absent(),
    this.rentCount = const Value.absent(),
    this.currency = const Value.absent(),
    this.category = const Value.absent(),
    this.toolImagePath = const Value.absent(),
    this.toolUniqueId = const Value.absent(),
    this.toolUserId = const Value.absent(),
    this.status = const Value.absent(),
  });
  ToolsCompanion.insert({
    this.toolId = const Value.absent(),
    required String name,
    required DateTime boughtAt,
    required int purchasedPrice,
    required int rate,
    required int rentCount,
    required Currency currency,
    required Category category,
    required String toolImagePath,
    required int toolUniqueId,
    this.toolUserId = const Value.absent(),
    required Status status,
  })  : name = Value(name),
        boughtAt = Value(boughtAt),
        purchasedPrice = Value(purchasedPrice),
        rate = Value(rate),
        rentCount = Value(rentCount),
        currency = Value(currency),
        category = Value(category),
        toolImagePath = Value(toolImagePath),
        toolUniqueId = Value(toolUniqueId),
        status = Value(status);
  static Insertable<Tool> custom({
    Expression<int>? toolId,
    Expression<String>? name,
    Expression<DateTime>? boughtAt,
    Expression<int>? purchasedPrice,
    Expression<int>? rate,
    Expression<int>? rentCount,
    Expression<String>? currency,
    Expression<String>? category,
    Expression<String>? toolImagePath,
    Expression<int>? toolUniqueId,
    Expression<int>? toolUserId,
    Expression<String>? status,
  }) {
    return RawValuesInsertable({
      if (toolId != null) 'tool_id': toolId,
      if (name != null) 'name': name,
      if (boughtAt != null) 'bought_at': boughtAt,
      if (purchasedPrice != null) 'purchased_price': purchasedPrice,
      if (rate != null) 'rate': rate,
      if (rentCount != null) 'rent_count': rentCount,
      if (currency != null) 'currency': currency,
      if (category != null) 'category': category,
      if (toolImagePath != null) 'tool_image_path': toolImagePath,
      if (toolUniqueId != null) 'tool_unique_id': toolUniqueId,
      if (toolUserId != null) 'tool_user_id': toolUserId,
      if (status != null) 'status': status,
    });
  }

  ToolsCompanion copyWith(
      {Value<int>? toolId,
      Value<String>? name,
      Value<DateTime>? boughtAt,
      Value<int>? purchasedPrice,
      Value<int>? rate,
      Value<int>? rentCount,
      Value<Currency>? currency,
      Value<Category>? category,
      Value<String>? toolImagePath,
      Value<int>? toolUniqueId,
      Value<int?>? toolUserId,
      Value<Status>? status}) {
    return ToolsCompanion(
      toolId: toolId ?? this.toolId,
      name: name ?? this.name,
      boughtAt: boughtAt ?? this.boughtAt,
      purchasedPrice: purchasedPrice ?? this.purchasedPrice,
      rate: rate ?? this.rate,
      rentCount: rentCount ?? this.rentCount,
      currency: currency ?? this.currency,
      category: category ?? this.category,
      toolImagePath: toolImagePath ?? this.toolImagePath,
      toolUniqueId: toolUniqueId ?? this.toolUniqueId,
      toolUserId: toolUserId ?? this.toolUserId,
      status: status ?? this.status,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (toolId.present) {
      map['tool_id'] = Variable<int>(toolId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (boughtAt.present) {
      map['bought_at'] = Variable<DateTime>(boughtAt.value);
    }
    if (purchasedPrice.present) {
      map['purchased_price'] = Variable<int>(purchasedPrice.value);
    }
    if (rate.present) {
      map['rate'] = Variable<int>(rate.value);
    }
    if (rentCount.present) {
      map['rent_count'] = Variable<int>(rentCount.value);
    }
    if (currency.present) {
      map['currency'] = Variable<String>(
          $ToolsTable.$convertercurrency.toSql(currency.value));
    }
    if (category.present) {
      map['category'] = Variable<String>(
          $ToolsTable.$convertercategory.toSql(category.value));
    }
    if (toolImagePath.present) {
      map['tool_image_path'] = Variable<String>(toolImagePath.value);
    }
    if (toolUniqueId.present) {
      map['tool_unique_id'] = Variable<int>(toolUniqueId.value);
    }
    if (toolUserId.present) {
      map['tool_user_id'] = Variable<int>(toolUserId.value);
    }
    if (status.present) {
      map['status'] =
          Variable<String>($ToolsTable.$converterstatus.toSql(status.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ToolsCompanion(')
          ..write('toolId: $toolId, ')
          ..write('name: $name, ')
          ..write('boughtAt: $boughtAt, ')
          ..write('purchasedPrice: $purchasedPrice, ')
          ..write('rate: $rate, ')
          ..write('rentCount: $rentCount, ')
          ..write('currency: $currency, ')
          ..write('category: $category, ')
          ..write('toolImagePath: $toolImagePath, ')
          ..write('toolUniqueId: $toolUniqueId, ')
          ..write('toolUserId: $toolUserId, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }
}

class $UserTable extends User with TableInfo<$UserTable, UserData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _usernameMeta =
      const VerificationMeta('username');
  @override
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
      'username', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 6, maxTextLength: 16),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _passwordMeta =
      const VerificationMeta('password');
  @override
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
      'password', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 6, maxTextLength: 16),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [userId, username, password];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user';
  @override
  VerificationContext validateIntegrity(Insertable<UserData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    }
    if (data.containsKey('username')) {
      context.handle(_usernameMeta,
          username.isAcceptableOrUnknown(data['username']!, _usernameMeta));
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('password')) {
      context.handle(_passwordMeta,
          password.isAcceptableOrUnknown(data['password']!, _passwordMeta));
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {userId};
  @override
  UserData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserData(
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
      username: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}username'])!,
      password: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}password'])!,
    );
  }

  @override
  $UserTable createAlias(String alias) {
    return $UserTable(attachedDatabase, alias);
  }
}

class UserData extends DataClass implements Insertable<UserData> {
  final int userId;
  final String username;
  final String password;
  const UserData(
      {required this.userId, required this.username, required this.password});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_id'] = Variable<int>(userId);
    map['username'] = Variable<String>(username);
    map['password'] = Variable<String>(password);
    return map;
  }

  UserCompanion toCompanion(bool nullToAbsent) {
    return UserCompanion(
      userId: Value(userId),
      username: Value(username),
      password: Value(password),
    );
  }

  factory UserData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserData(
      userId: serializer.fromJson<int>(json['userId']),
      username: serializer.fromJson<String>(json['username']),
      password: serializer.fromJson<String>(json['password']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userId': serializer.toJson<int>(userId),
      'username': serializer.toJson<String>(username),
      'password': serializer.toJson<String>(password),
    };
  }

  UserData copyWith({int? userId, String? username, String? password}) =>
      UserData(
        userId: userId ?? this.userId,
        username: username ?? this.username,
        password: password ?? this.password,
      );
  UserData copyWithCompanion(UserCompanion data) {
    return UserData(
      userId: data.userId.present ? data.userId.value : this.userId,
      username: data.username.present ? data.username.value : this.username,
      password: data.password.present ? data.password.value : this.password,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserData(')
          ..write('userId: $userId, ')
          ..write('username: $username, ')
          ..write('password: $password')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(userId, username, password);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserData &&
          other.userId == this.userId &&
          other.username == this.username &&
          other.password == this.password);
}

class UserCompanion extends UpdateCompanion<UserData> {
  final Value<int> userId;
  final Value<String> username;
  final Value<String> password;
  const UserCompanion({
    this.userId = const Value.absent(),
    this.username = const Value.absent(),
    this.password = const Value.absent(),
  });
  UserCompanion.insert({
    this.userId = const Value.absent(),
    required String username,
    required String password,
  })  : username = Value(username),
        password = Value(password);
  static Insertable<UserData> custom({
    Expression<int>? userId,
    Expression<String>? username,
    Expression<String>? password,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (username != null) 'username': username,
      if (password != null) 'password': password,
    });
  }

  UserCompanion copyWith(
      {Value<int>? userId, Value<String>? username, Value<String>? password}) {
    return UserCompanion(
      userId: userId ?? this.userId,
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserCompanion(')
          ..write('userId: $userId, ')
          ..write('username: $username, ')
          ..write('password: $password')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ToolUsersTable toolUsers = $ToolUsersTable(this);
  late final $ToolsTable tools = $ToolsTable(this);
  late final $UserTable user = $UserTable(this);
  late final ToolUsersDao toolUsersDao = ToolUsersDao(this as AppDatabase);
  late final ToolsDao toolsDao = ToolsDao(this as AppDatabase);
  late final UserDao userDao = UserDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [toolUsers, tools, user];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('tool_users',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('tools', kind: UpdateKind.update),
            ],
          ),
        ],
      );
}

typedef $$ToolUsersTableCreateCompanionBuilder = ToolUsersCompanion Function({
  Value<int> toolUserId,
  required String firstName,
  required String lastName,
  required String frontNationalIdImagePath,
  required String backNationalIdImagePath,
  required String avatarImagePath,
  required int phoneNumber,
  required int countryCallingCode,
});
typedef $$ToolUsersTableUpdateCompanionBuilder = ToolUsersCompanion Function({
  Value<int> toolUserId,
  Value<String> firstName,
  Value<String> lastName,
  Value<String> frontNationalIdImagePath,
  Value<String> backNationalIdImagePath,
  Value<String> avatarImagePath,
  Value<int> phoneNumber,
  Value<int> countryCallingCode,
});

final class $$ToolUsersTableReferences
    extends BaseReferences<_$AppDatabase, $ToolUsersTable, ToolUser> {
  $$ToolUsersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ToolsTable, List<Tool>> _toolsRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.tools,
          aliasName: $_aliasNameGenerator(
              db.toolUsers.toolUserId, db.tools.toolUserId));

  $$ToolsTableProcessedTableManager get toolsRefs {
    final manager = $$ToolsTableTableManager($_db, $_db.tools)
        .filter((f) => f.toolUserId.toolUserId($_item.toolUserId));

    final cache = $_typedResult.readTableOrNull(_toolsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$ToolUsersTableFilterComposer
    extends Composer<_$AppDatabase, $ToolUsersTable> {
  $$ToolUsersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get toolUserId => $composableBuilder(
      column: $table.toolUserId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get firstName => $composableBuilder(
      column: $table.firstName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get lastName => $composableBuilder(
      column: $table.lastName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get frontNationalIdImagePath => $composableBuilder(
      column: $table.frontNationalIdImagePath,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get backNationalIdImagePath => $composableBuilder(
      column: $table.backNationalIdImagePath,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get avatarImagePath => $composableBuilder(
      column: $table.avatarImagePath,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get phoneNumber => $composableBuilder(
      column: $table.phoneNumber, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get countryCallingCode => $composableBuilder(
      column: $table.countryCallingCode,
      builder: (column) => ColumnFilters(column));

  Expression<bool> toolsRefs(
      Expression<bool> Function($$ToolsTableFilterComposer f) f) {
    final $$ToolsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.toolUserId,
        referencedTable: $db.tools,
        getReferencedColumn: (t) => t.toolUserId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ToolsTableFilterComposer(
              $db: $db,
              $table: $db.tools,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ToolUsersTableOrderingComposer
    extends Composer<_$AppDatabase, $ToolUsersTable> {
  $$ToolUsersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get toolUserId => $composableBuilder(
      column: $table.toolUserId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get firstName => $composableBuilder(
      column: $table.firstName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get lastName => $composableBuilder(
      column: $table.lastName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get frontNationalIdImagePath => $composableBuilder(
      column: $table.frontNationalIdImagePath,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get backNationalIdImagePath => $composableBuilder(
      column: $table.backNationalIdImagePath,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get avatarImagePath => $composableBuilder(
      column: $table.avatarImagePath,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get phoneNumber => $composableBuilder(
      column: $table.phoneNumber, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get countryCallingCode => $composableBuilder(
      column: $table.countryCallingCode,
      builder: (column) => ColumnOrderings(column));
}

class $$ToolUsersTableAnnotationComposer
    extends Composer<_$AppDatabase, $ToolUsersTable> {
  $$ToolUsersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get toolUserId => $composableBuilder(
      column: $table.toolUserId, builder: (column) => column);

  GeneratedColumn<String> get firstName =>
      $composableBuilder(column: $table.firstName, builder: (column) => column);

  GeneratedColumn<String> get lastName =>
      $composableBuilder(column: $table.lastName, builder: (column) => column);

  GeneratedColumn<String> get frontNationalIdImagePath => $composableBuilder(
      column: $table.frontNationalIdImagePath, builder: (column) => column);

  GeneratedColumn<String> get backNationalIdImagePath => $composableBuilder(
      column: $table.backNationalIdImagePath, builder: (column) => column);

  GeneratedColumn<String> get avatarImagePath => $composableBuilder(
      column: $table.avatarImagePath, builder: (column) => column);

  GeneratedColumn<int> get phoneNumber => $composableBuilder(
      column: $table.phoneNumber, builder: (column) => column);

  GeneratedColumn<int> get countryCallingCode => $composableBuilder(
      column: $table.countryCallingCode, builder: (column) => column);

  Expression<T> toolsRefs<T extends Object>(
      Expression<T> Function($$ToolsTableAnnotationComposer a) f) {
    final $$ToolsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.toolUserId,
        referencedTable: $db.tools,
        getReferencedColumn: (t) => t.toolUserId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ToolsTableAnnotationComposer(
              $db: $db,
              $table: $db.tools,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ToolUsersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ToolUsersTable,
    ToolUser,
    $$ToolUsersTableFilterComposer,
    $$ToolUsersTableOrderingComposer,
    $$ToolUsersTableAnnotationComposer,
    $$ToolUsersTableCreateCompanionBuilder,
    $$ToolUsersTableUpdateCompanionBuilder,
    (ToolUser, $$ToolUsersTableReferences),
    ToolUser,
    PrefetchHooks Function({bool toolsRefs})> {
  $$ToolUsersTableTableManager(_$AppDatabase db, $ToolUsersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ToolUsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ToolUsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ToolUsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> toolUserId = const Value.absent(),
            Value<String> firstName = const Value.absent(),
            Value<String> lastName = const Value.absent(),
            Value<String> frontNationalIdImagePath = const Value.absent(),
            Value<String> backNationalIdImagePath = const Value.absent(),
            Value<String> avatarImagePath = const Value.absent(),
            Value<int> phoneNumber = const Value.absent(),
            Value<int> countryCallingCode = const Value.absent(),
          }) =>
              ToolUsersCompanion(
            toolUserId: toolUserId,
            firstName: firstName,
            lastName: lastName,
            frontNationalIdImagePath: frontNationalIdImagePath,
            backNationalIdImagePath: backNationalIdImagePath,
            avatarImagePath: avatarImagePath,
            phoneNumber: phoneNumber,
            countryCallingCode: countryCallingCode,
          ),
          createCompanionCallback: ({
            Value<int> toolUserId = const Value.absent(),
            required String firstName,
            required String lastName,
            required String frontNationalIdImagePath,
            required String backNationalIdImagePath,
            required String avatarImagePath,
            required int phoneNumber,
            required int countryCallingCode,
          }) =>
              ToolUsersCompanion.insert(
            toolUserId: toolUserId,
            firstName: firstName,
            lastName: lastName,
            frontNationalIdImagePath: frontNationalIdImagePath,
            backNationalIdImagePath: backNationalIdImagePath,
            avatarImagePath: avatarImagePath,
            phoneNumber: phoneNumber,
            countryCallingCode: countryCallingCode,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ToolUsersTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({toolsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (toolsRefs) db.tools],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (toolsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$ToolUsersTableReferences._toolsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ToolUsersTableReferences(db, table, p0).toolsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.toolUserId == item.toolUserId),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$ToolUsersTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ToolUsersTable,
    ToolUser,
    $$ToolUsersTableFilterComposer,
    $$ToolUsersTableOrderingComposer,
    $$ToolUsersTableAnnotationComposer,
    $$ToolUsersTableCreateCompanionBuilder,
    $$ToolUsersTableUpdateCompanionBuilder,
    (ToolUser, $$ToolUsersTableReferences),
    ToolUser,
    PrefetchHooks Function({bool toolsRefs})>;
typedef $$ToolsTableCreateCompanionBuilder = ToolsCompanion Function({
  Value<int> toolId,
  required String name,
  required DateTime boughtAt,
  required int purchasedPrice,
  required int rate,
  required int rentCount,
  required Currency currency,
  required Category category,
  required String toolImagePath,
  required int toolUniqueId,
  Value<int?> toolUserId,
  required Status status,
});
typedef $$ToolsTableUpdateCompanionBuilder = ToolsCompanion Function({
  Value<int> toolId,
  Value<String> name,
  Value<DateTime> boughtAt,
  Value<int> purchasedPrice,
  Value<int> rate,
  Value<int> rentCount,
  Value<Currency> currency,
  Value<Category> category,
  Value<String> toolImagePath,
  Value<int> toolUniqueId,
  Value<int?> toolUserId,
  Value<Status> status,
});

final class $$ToolsTableReferences
    extends BaseReferences<_$AppDatabase, $ToolsTable, Tool> {
  $$ToolsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ToolUsersTable _toolUserIdTable(_$AppDatabase db) =>
      db.toolUsers.createAlias(
          $_aliasNameGenerator(db.tools.toolUserId, db.toolUsers.toolUserId));

  $$ToolUsersTableProcessedTableManager? get toolUserId {
    if ($_item.toolUserId == null) return null;
    final manager = $$ToolUsersTableTableManager($_db, $_db.toolUsers)
        .filter((f) => f.toolUserId($_item.toolUserId!));
    final item = $_typedResult.readTableOrNull(_toolUserIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$ToolsTableFilterComposer extends Composer<_$AppDatabase, $ToolsTable> {
  $$ToolsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get toolId => $composableBuilder(
      column: $table.toolId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get boughtAt => $composableBuilder(
      column: $table.boughtAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get purchasedPrice => $composableBuilder(
      column: $table.purchasedPrice,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get rate => $composableBuilder(
      column: $table.rate, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get rentCount => $composableBuilder(
      column: $table.rentCount, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<Currency, Currency, String> get currency =>
      $composableBuilder(
          column: $table.currency,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<Category, Category, String> get category =>
      $composableBuilder(
          column: $table.category,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<String> get toolImagePath => $composableBuilder(
      column: $table.toolImagePath, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get toolUniqueId => $composableBuilder(
      column: $table.toolUniqueId, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<Status, Status, String> get status =>
      $composableBuilder(
          column: $table.status,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  $$ToolUsersTableFilterComposer get toolUserId {
    final $$ToolUsersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.toolUserId,
        referencedTable: $db.toolUsers,
        getReferencedColumn: (t) => t.toolUserId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ToolUsersTableFilterComposer(
              $db: $db,
              $table: $db.toolUsers,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ToolsTableOrderingComposer
    extends Composer<_$AppDatabase, $ToolsTable> {
  $$ToolsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get toolId => $composableBuilder(
      column: $table.toolId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get boughtAt => $composableBuilder(
      column: $table.boughtAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get purchasedPrice => $composableBuilder(
      column: $table.purchasedPrice,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get rate => $composableBuilder(
      column: $table.rate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get rentCount => $composableBuilder(
      column: $table.rentCount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get currency => $composableBuilder(
      column: $table.currency, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get toolImagePath => $composableBuilder(
      column: $table.toolImagePath,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get toolUniqueId => $composableBuilder(
      column: $table.toolUniqueId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  $$ToolUsersTableOrderingComposer get toolUserId {
    final $$ToolUsersTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.toolUserId,
        referencedTable: $db.toolUsers,
        getReferencedColumn: (t) => t.toolUserId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ToolUsersTableOrderingComposer(
              $db: $db,
              $table: $db.toolUsers,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ToolsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ToolsTable> {
  $$ToolsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get toolId =>
      $composableBuilder(column: $table.toolId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<DateTime> get boughtAt =>
      $composableBuilder(column: $table.boughtAt, builder: (column) => column);

  GeneratedColumn<int> get purchasedPrice => $composableBuilder(
      column: $table.purchasedPrice, builder: (column) => column);

  GeneratedColumn<int> get rate =>
      $composableBuilder(column: $table.rate, builder: (column) => column);

  GeneratedColumn<int> get rentCount =>
      $composableBuilder(column: $table.rentCount, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Currency, String> get currency =>
      $composableBuilder(column: $table.currency, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Category, String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get toolImagePath => $composableBuilder(
      column: $table.toolImagePath, builder: (column) => column);

  GeneratedColumn<int> get toolUniqueId => $composableBuilder(
      column: $table.toolUniqueId, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Status, String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  $$ToolUsersTableAnnotationComposer get toolUserId {
    final $$ToolUsersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.toolUserId,
        referencedTable: $db.toolUsers,
        getReferencedColumn: (t) => t.toolUserId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ToolUsersTableAnnotationComposer(
              $db: $db,
              $table: $db.toolUsers,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ToolsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ToolsTable,
    Tool,
    $$ToolsTableFilterComposer,
    $$ToolsTableOrderingComposer,
    $$ToolsTableAnnotationComposer,
    $$ToolsTableCreateCompanionBuilder,
    $$ToolsTableUpdateCompanionBuilder,
    (Tool, $$ToolsTableReferences),
    Tool,
    PrefetchHooks Function({bool toolUserId})> {
  $$ToolsTableTableManager(_$AppDatabase db, $ToolsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ToolsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ToolsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ToolsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> toolId = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<DateTime> boughtAt = const Value.absent(),
            Value<int> purchasedPrice = const Value.absent(),
            Value<int> rate = const Value.absent(),
            Value<int> rentCount = const Value.absent(),
            Value<Currency> currency = const Value.absent(),
            Value<Category> category = const Value.absent(),
            Value<String> toolImagePath = const Value.absent(),
            Value<int> toolUniqueId = const Value.absent(),
            Value<int?> toolUserId = const Value.absent(),
            Value<Status> status = const Value.absent(),
          }) =>
              ToolsCompanion(
            toolId: toolId,
            name: name,
            boughtAt: boughtAt,
            purchasedPrice: purchasedPrice,
            rate: rate,
            rentCount: rentCount,
            currency: currency,
            category: category,
            toolImagePath: toolImagePath,
            toolUniqueId: toolUniqueId,
            toolUserId: toolUserId,
            status: status,
          ),
          createCompanionCallback: ({
            Value<int> toolId = const Value.absent(),
            required String name,
            required DateTime boughtAt,
            required int purchasedPrice,
            required int rate,
            required int rentCount,
            required Currency currency,
            required Category category,
            required String toolImagePath,
            required int toolUniqueId,
            Value<int?> toolUserId = const Value.absent(),
            required Status status,
          }) =>
              ToolsCompanion.insert(
            toolId: toolId,
            name: name,
            boughtAt: boughtAt,
            purchasedPrice: purchasedPrice,
            rate: rate,
            rentCount: rentCount,
            currency: currency,
            category: category,
            toolImagePath: toolImagePath,
            toolUniqueId: toolUniqueId,
            toolUserId: toolUserId,
            status: status,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$ToolsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({toolUserId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (toolUserId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.toolUserId,
                    referencedTable:
                        $$ToolsTableReferences._toolUserIdTable(db),
                    referencedColumn:
                        $$ToolsTableReferences._toolUserIdTable(db).toolUserId,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$ToolsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ToolsTable,
    Tool,
    $$ToolsTableFilterComposer,
    $$ToolsTableOrderingComposer,
    $$ToolsTableAnnotationComposer,
    $$ToolsTableCreateCompanionBuilder,
    $$ToolsTableUpdateCompanionBuilder,
    (Tool, $$ToolsTableReferences),
    Tool,
    PrefetchHooks Function({bool toolUserId})>;
typedef $$UserTableCreateCompanionBuilder = UserCompanion Function({
  Value<int> userId,
  required String username,
  required String password,
});
typedef $$UserTableUpdateCompanionBuilder = UserCompanion Function({
  Value<int> userId,
  Value<String> username,
  Value<String> password,
});

class $$UserTableFilterComposer extends Composer<_$AppDatabase, $UserTable> {
  $$UserTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get username => $composableBuilder(
      column: $table.username, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get password => $composableBuilder(
      column: $table.password, builder: (column) => ColumnFilters(column));
}

class $$UserTableOrderingComposer extends Composer<_$AppDatabase, $UserTable> {
  $$UserTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get username => $composableBuilder(
      column: $table.username, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get password => $composableBuilder(
      column: $table.password, builder: (column) => ColumnOrderings(column));
}

class $$UserTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserTable> {
  $$UserTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get username =>
      $composableBuilder(column: $table.username, builder: (column) => column);

  GeneratedColumn<String> get password =>
      $composableBuilder(column: $table.password, builder: (column) => column);
}

class $$UserTableTableManager extends RootTableManager<
    _$AppDatabase,
    $UserTable,
    UserData,
    $$UserTableFilterComposer,
    $$UserTableOrderingComposer,
    $$UserTableAnnotationComposer,
    $$UserTableCreateCompanionBuilder,
    $$UserTableUpdateCompanionBuilder,
    (UserData, BaseReferences<_$AppDatabase, $UserTable, UserData>),
    UserData,
    PrefetchHooks Function()> {
  $$UserTableTableManager(_$AppDatabase db, $UserTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> userId = const Value.absent(),
            Value<String> username = const Value.absent(),
            Value<String> password = const Value.absent(),
          }) =>
              UserCompanion(
            userId: userId,
            username: username,
            password: password,
          ),
          createCompanionCallback: ({
            Value<int> userId = const Value.absent(),
            required String username,
            required String password,
          }) =>
              UserCompanion.insert(
            userId: userId,
            username: username,
            password: password,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$UserTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $UserTable,
    UserData,
    $$UserTableFilterComposer,
    $$UserTableOrderingComposer,
    $$UserTableAnnotationComposer,
    $$UserTableCreateCompanionBuilder,
    $$UserTableUpdateCompanionBuilder,
    (UserData, BaseReferences<_$AppDatabase, $UserTable, UserData>),
    UserData,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ToolUsersTableTableManager get toolUsers =>
      $$ToolUsersTableTableManager(_db, _db.toolUsers);
  $$ToolsTableTableManager get tools =>
      $$ToolsTableTableManager(_db, _db.tools);
  $$UserTableTableManager get user => $$UserTableTableManager(_db, _db.user);
}
