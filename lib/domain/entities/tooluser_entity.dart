import 'package:flutter/foundation.dart';
import 'package:tools_rental_management/domain/entities/tool_entity.dart';

class ToolUserEntity {
  final int? toolUserId;
  final String firstName;
  final String lastName;
  final String frontNationalIdImagePath;
  final String backNationalIdImagePath;
  final String avatarImagePath;
  final int phoneNumber;
  final int countryCallingCode;
  final List<ToolEntity>? toolEntities;

  ToolUserEntity({
    required this.toolUserId,
    required this.firstName,
    required this.lastName,
    required this.frontNationalIdImagePath,
    required this.backNationalIdImagePath,
    required this.avatarImagePath,
    required this.phoneNumber,
    required this.countryCallingCode,
    this.toolEntities,
  });

  /// should be called when a new tool user wants to be persisted.
  ToolUserEntity.insert(
      {this.toolUserId,
      required this.firstName,
      required this.lastName,
      required this.frontNationalIdImagePath,
      required this.backNationalIdImagePath,
      required this.avatarImagePath,
      required this.phoneNumber,
      required this.countryCallingCode,
      this.toolEntities});

  // excluded toolUserId because we don't what [copyWith] to accidentally be called with toolUserId that might later conflict with another
  // toolUser that might end up having the same toolUserId.
  // also excluded tools because it doesn't play any part when it comes to updating the toolUser.
  ToolUserEntity copyWith({
    String? firstName,
    String? lastName,
    String? frontNationalIdImagePath,
    String? backNationalIdImagePath,
    String? imagePath,
    int? phoneNumber,
    int? countryCallingCode,
  }) {
    return ToolUserEntity(
      toolUserId: toolUserId,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      frontNationalIdImagePath:
          frontNationalIdImagePath ?? this.frontNationalIdImagePath,
      backNationalIdImagePath:
          backNationalIdImagePath ?? this.backNationalIdImagePath,
      avatarImagePath: imagePath ?? avatarImagePath,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      countryCallingCode: countryCallingCode ?? this.countryCallingCode,
      toolEntities: toolEntities,
    );
  }

  @override
  bool operator ==(Object other) {
    return (other is ToolUserEntity &&
        toolUserId == other.toolUserId &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        frontNationalIdImagePath == other.frontNationalIdImagePath &&
        backNationalIdImagePath == other.backNationalIdImagePath &&
        avatarImagePath == other.avatarImagePath &&
        phoneNumber == other.phoneNumber &&
        countryCallingCode == other.countryCallingCode &&
        listEquals(toolEntities, other.toolEntities));
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

    if (toolEntities == null) {
      return combinedFieldsHashCode ^ toolEntities.hashCode;
    } else {
      final int combinedToolsHashCode = toolEntities!
          // transform a list of tools into a list of hashCodes
          .map((tool) => tool.hashCode)
          // combine all the hashCodes into a single hashCode value
          .reduce((value, element) => value.hashCode ^ element.hashCode);
      return combinedFieldsHashCode ^ combinedToolsHashCode;
    }
  }

  @override
  String toString() {
    return """ToolUserEntity: {
      toolUserId: $toolUserId 
      firstName: $firstName 
      lastName: $lastName 
      frontNationalIdImagePath: $frontNationalIdImagePath
      backNationalIdImagePath: $backNationalIdImagePath 
      imagePath: $avatarImagePath 
      phoneNumber: $phoneNumber 
      countryCallingCode: $countryCallingCode
      tool count : ${toolEntities == null ? '0' : toolEntities!.length}
      tools : $toolEntities
    }""";
  }
}
