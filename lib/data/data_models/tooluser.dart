import 'package:flutter/foundation.dart';
import 'package:tools_rental_management/data/data_models/tool.dart';

class ToolUser {
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
  // list of tools which is currently being used by this toolUser
  // can be null if this tool user is not using any tool(s)
  final List<Tool>? tools;

  /// should be called when constructing a new tool from the old one by calling [copyWith] method.
  ToolUser({
    required this.toolUserId,
    required this.firstName,
    required this.lastName,
    required this.frontNationalIdImagePath,
    required this.backNationalIdImagePath,
    required this.avatarImagePath,
    required this.phoneNumber,
    required this.countryCallingCode,
    this.tools,
  });

  /// should be called when this toolUser wants to be inserted to the database.
  ToolUser.insert({
    this.toolUserId,
    required this.firstName,
    required this.lastName,
    required this.frontNationalIdImagePath,
    required this.backNationalIdImagePath,
    required this.avatarImagePath,
    required this.phoneNumber,
    required this.countryCallingCode,
    this.tools,
  });

  /// should be called when this toolUser is constructed from a database record.
  ToolUser.fromMap({required Map<String, dynamic> toolUserMap})
      : toolUserId = toolUserMap['tool_user_id'],
        firstName = toolUserMap['first_name'],
        lastName = toolUserMap['last_name'],
        frontNationalIdImagePath = toolUserMap['front_national_id_image_path'],
        backNationalIdImagePath = toolUserMap['back_national_id_image_path'],
        avatarImagePath = toolUserMap['avatar_image_path'],
        phoneNumber = toolUserMap['phone_number'],
        countryCallingCode = toolUserMap['country_calling_code'],
        tools = toolUserMap['tools'];

  // excluded toolUserId because we don't what [copyWith] to accidentally be called with toolUserId that might later conflict with another
  // toolUser that might end up having the same toolUserId.
  // also excluded tools because it doesn't play any part when it comes to updating the toolUser.
  ToolUser copyWith({
    String? firstName,
    String? lastName,
    String? frontNationalIdImagePath,
    String? backNationalIdImagePath,
    String? imagePath,
    int? phoneNumber,
    int? countryCallingCode,
  }) {
    return ToolUser(
      toolUserId: toolUserId,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      frontNationalIdImagePath: frontNationalIdImagePath ?? this.frontNationalIdImagePath,
      backNationalIdImagePath: backNationalIdImagePath ?? this.backNationalIdImagePath,
      avatarImagePath: imagePath ?? avatarImagePath,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      countryCallingCode: countryCallingCode ?? this.countryCallingCode,
      tools: tools,
    );
  }

  @override
  bool operator ==(Object other) {
    return (other is ToolUser &&
        toolUserId == other.toolUserId &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        frontNationalIdImagePath == other.frontNationalIdImagePath &&
        backNationalIdImagePath == other.backNationalIdImagePath &&
        avatarImagePath == other.avatarImagePath &&
        phoneNumber == other.phoneNumber &&
        countryCallingCode == other.countryCallingCode &&
        listEquals(tools, other.tools));
  }

  @override
  int get hashCode {
    final int combinedFieldsHashCode = (toolUserId.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        frontNationalIdImagePath.hashCode ^
        backNationalIdImagePath.hashCode ^
        avatarImagePath.hashCode ^
        phoneNumber.hashCode ^
        countryCallingCode.hashCode);

    if (tools == null) {
      return combinedFieldsHashCode ^ tools.hashCode;
    } else {
      final int combinedToolsHashCode = tools!
          // transform a list of tools into a list of hashCodes
          .map(
            (tool) => tool.hashCode,
          )
          // combine all the hashCodes into a single hashCode value
          .reduce(
            (value, element) => value.hashCode ^ element.hashCode,
          );
      return combinedFieldsHashCode ^ combinedToolsHashCode;
    }
  }

  @override
  String toString() {
    return """ ToolUser: {
      toolUserId: $toolUserId 
      firstName: $firstName 
      lastName: $lastName 
      frontNationalIdImagePath: $frontNationalIdImagePath
      backNationalIdImagePath: $backNationalIdImagePath 
      imagePath: $avatarImagePath 
      phoneNumber: $phoneNumber 
      countryCallingCode: $countryCallingCode
      tool count : ${tools == null ? '0' : tools!.length}
    }""";
  }
}
