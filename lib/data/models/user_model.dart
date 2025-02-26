import 'package:flutter/foundation.dart';
import 'package:tools_rental_management/domain/entities/user_entity.dart';

class UserModel {
  final int? userId;
  final String username;
  final String password;

  UserModel(
      {required this.userId, required this.username, required this.password});

  factory UserModel.fromEntity(UserEntity userEntity) {
    return UserModel(
      userId: userEntity.userId,
      username: userEntity.username,
      password: userEntity.password,
    );
  }

  UserModel.fromMap(Map<String, dynamic> userMap)
      : userId = userMap['user_id'],
        username = userMap['username'],
        password = userMap['password'];

  UserModel copyWith({String? username, String? password}) {
    return UserModel(
      userId: userId,
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  @override
  bool operator ==(Object other) {
    return (other is UserModel &&
        userId == other.userId &&
        username == other.username &&
        password == other.password);
  }

  @override
  int get hashCode => userId.hashCode ^ username.hashCode ^ password.hashCode;

  UserEntity toEntity() {
    return UserEntity(
      userId: userId,
      username: username,
      password: password,
    );
  }

  @override
  String toString() {
    return """UserModel: {
    userId: $userId
    username: $username
    password: $password
    }""";
  }
}
