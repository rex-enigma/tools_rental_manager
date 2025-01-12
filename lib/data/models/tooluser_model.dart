import 'package:tools_rental_management/data/models/tool_model.dart';
import 'package:tools_rental_management/domain/entities/tool_entity.dart';
import 'package:tools_rental_management/domain/entities/tooluser_entity.dart';

class ToolUserModel {
  /// its only null when creating a new toolUser that need to be inserted to the database.
  /// But when constructing this toolUser from a database record, [toolId] should have a non-nullable value.
  /// uniquely identifies a tool in the database (primary key)
  final int? toolUserId;
  final String firstName;
  final String lastName;
  final String frontNationalIdImagePath;
  final String backNationalIdImagePath;
  // path to where the toolUser image is stored.
  final String avatarImagePath;
  final int phoneNumber;

  /// only use one of class [CountryCallingCode] static fields to assign a value to this countryCallingCode field
  final int countryCallingCode;

  /// should be called when constructing a new tool from the old one by calling [copyWith] method.
  ToolUserModel({
    required this.toolUserId,
    required this.firstName,
    required this.lastName,
    required this.frontNationalIdImagePath,
    required this.backNationalIdImagePath,
    required this.avatarImagePath,
    required this.phoneNumber,
    required this.countryCallingCode,
  });

  /// should be called when this toolUser wants to be inserted to the database.
  // ToolUserModel.insert({
  //   this.toolUserId,
  //   required this.firstName,
  //   required this.lastName,
  //   required this.frontNationalIdImagePath,
  //   required this.backNationalIdImagePath,
  //   required this.avatarImagePath,
  //   required this.phoneNumber,
  //   required this.countryCallingCode,
  // });

  factory ToolUserModel.fromEntity(ToolUserEntity toolUserEntity) {
    return ToolUserModel(
        toolUserId: toolUserEntity.toolUserId,
        firstName: toolUserEntity.firstName,
        lastName: toolUserEntity.lastName,
        frontNationalIdImagePath: toolUserEntity.frontNationalIdImagePath,
        backNationalIdImagePath: toolUserEntity.backNationalIdImagePath,
        avatarImagePath: toolUserEntity.avatarImagePath,
        phoneNumber: toolUserEntity.phoneNumber,
        countryCallingCode: toolUserEntity.countryCallingCode);
  }

  /// should be called when this toolUser is constructed from a database record.
  ToolUserModel.fromMap({required Map<String, dynamic> toolUserMap})
      : toolUserId = toolUserMap['tool_user_id'],
        firstName = toolUserMap['first_name'],
        lastName = toolUserMap['last_name'],
        frontNationalIdImagePath = toolUserMap['front_national_id_image_path'],
        backNationalIdImagePath = toolUserMap['back_national_id_image_path'],
        avatarImagePath = toolUserMap['avatar_image_path'],
        phoneNumber = toolUserMap['phone_number'],
        countryCallingCode = toolUserMap['country_calling_code'];

  // excluded toolUserId because we don't what [copyWith] to accidentally be called with toolUserId that might later conflict with another
  // toolUser that might end up having the same toolUserId.
  // also excluded tools because it doesn't play any part when it comes to updating the toolUser.
  ToolUserModel copyWith({
    String? firstName,
    String? lastName,
    String? frontNationalIdImagePath,
    String? backNationalIdImagePath,
    String? imagePath,
    int? phoneNumber,
    int? countryCallingCode,
  }) {
    return ToolUserModel(
      toolUserId: toolUserId,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      frontNationalIdImagePath: frontNationalIdImagePath ?? this.frontNationalIdImagePath,
      backNationalIdImagePath: backNationalIdImagePath ?? this.backNationalIdImagePath,
      avatarImagePath: imagePath ?? avatarImagePath,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      countryCallingCode: countryCallingCode ?? this.countryCallingCode,
    );
  }

  @override
  bool operator ==(Object other) {
    return (other is ToolUserModel &&
        toolUserId == other.toolUserId &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        frontNationalIdImagePath == other.frontNationalIdImagePath &&
        backNationalIdImagePath == other.backNationalIdImagePath &&
        avatarImagePath == other.avatarImagePath &&
        phoneNumber == other.phoneNumber &&
        countryCallingCode == other.countryCallingCode);
  }

  @override
  int get hashCode => (toolUserId.hashCode ^
      firstName.hashCode ^
      lastName.hashCode ^
      frontNationalIdImagePath.hashCode ^
      backNationalIdImagePath.hashCode ^
      avatarImagePath.hashCode ^
      phoneNumber.hashCode ^
      countryCallingCode.hashCode);

  ToolUserEntity toEntity(List<ToolModel>? toolModels) {
    List<ToolEntity>? toolEntities = toolModels?.map((toolModel) {
      return toolModel.toEntity();
    }).toList();

    return ToolUserEntity(
      toolUserId: toolUserId,
      firstName: firstName,
      lastName: lastName,
      frontNationalIdImagePath: frontNationalIdImagePath,
      backNationalIdImagePath: backNationalIdImagePath,
      avatarImagePath: avatarImagePath,
      phoneNumber: phoneNumber,
      countryCallingCode: countryCallingCode,
      toolEntities: toolEntities,
    );
  }

  @override
  String toString() {
    return """ ToolUserModel: {
      toolUserId: $toolUserId 
      firstName: $firstName 
      lastName: $lastName 
      frontNationalIdImagePath: $frontNationalIdImagePath
      backNationalIdImagePath: $backNationalIdImagePath 
      imagePath: $avatarImagePath 
      phoneNumber: $phoneNumber 
      countryCallingCode: $countryCallingCode
    }""";
  }
}
