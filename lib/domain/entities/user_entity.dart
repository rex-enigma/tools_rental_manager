class UserEntity {
  final int? userId;
  final String username;
  final String password;

  UserEntity(
      {required this.userId, required this.username, required this.password});

  /// should be called when a new user wants to be persisted.
  UserEntity.insert(
      {this.userId, required this.username, required this.password});

  UserEntity copyWith({String? username, String? password}) {
    return UserEntity(
      userId: userId,
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  @override
  bool operator ==(Object other) {
    return (other is UserEntity &&
        userId == other.userId &&
        username == other.username &&
        password == other.password);
  }

  @override
  int get hashCode => userId.hashCode ^ username.hashCode ^ password.hashCode;

  @override
  String toString() {
    return """UserEntity: {
    userId: $userId
    username: $username
    password: $password
    }""";
  }
}
