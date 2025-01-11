// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $ToolUsersTable extends ToolUsers
    with TableInfo<$ToolUsersTable, ToolUserModel> {
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
  VerificationContext validateIntegrity(Insertable<ToolUserModel> instance,
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
  ToolUserModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ToolUserModel(
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

class ToolUsersCompanion extends UpdateCompanion<ToolUserModel> {
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
  static Insertable<ToolUserModel> custom({
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

class $ToolsTable extends Tools with TableInfo<$ToolsTable, ToolModel> {
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
  VerificationContext validateIntegrity(Insertable<ToolModel> instance,
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
  ToolModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ToolModel(
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

class ToolsCompanion extends UpdateCompanion<ToolModel> {
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
  static Insertable<ToolModel> custom({
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

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ToolUsersTable toolUsers = $ToolUsersTable(this);
  late final $ToolsTable tools = $ToolsTable(this);
  late final ToolUsersDao toolUsersDao = ToolUsersDao(this as AppDatabase);
  late final ToolsDao toolsDao = ToolsDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [toolUsers, tools];
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
    extends BaseReferences<_$AppDatabase, $ToolUsersTable, ToolUserModel> {
  $$ToolUsersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ToolsTable, List<ToolModel>> _toolsRefsTable(
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
    ToolUserModel,
    $$ToolUsersTableFilterComposer,
    $$ToolUsersTableOrderingComposer,
    $$ToolUsersTableAnnotationComposer,
    $$ToolUsersTableCreateCompanionBuilder,
    $$ToolUsersTableUpdateCompanionBuilder,
    (ToolUserModel, $$ToolUsersTableReferences),
    ToolUserModel,
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
    ToolUserModel,
    $$ToolUsersTableFilterComposer,
    $$ToolUsersTableOrderingComposer,
    $$ToolUsersTableAnnotationComposer,
    $$ToolUsersTableCreateCompanionBuilder,
    $$ToolUsersTableUpdateCompanionBuilder,
    (ToolUserModel, $$ToolUsersTableReferences),
    ToolUserModel,
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
    extends BaseReferences<_$AppDatabase, $ToolsTable, ToolModel> {
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
    ToolModel,
    $$ToolsTableFilterComposer,
    $$ToolsTableOrderingComposer,
    $$ToolsTableAnnotationComposer,
    $$ToolsTableCreateCompanionBuilder,
    $$ToolsTableUpdateCompanionBuilder,
    (ToolModel, $$ToolsTableReferences),
    ToolModel,
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
    ToolModel,
    $$ToolsTableFilterComposer,
    $$ToolsTableOrderingComposer,
    $$ToolsTableAnnotationComposer,
    $$ToolsTableCreateCompanionBuilder,
    $$ToolsTableUpdateCompanionBuilder,
    (ToolModel, $$ToolsTableReferences),
    ToolModel,
    PrefetchHooks Function({bool toolUserId})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ToolUsersTableTableManager get toolUsers =>
      $$ToolUsersTableTableManager(_db, _db.toolUsers);
  $$ToolsTableTableManager get tools =>
      $$ToolsTableTableManager(_db, _db.tools);
}
