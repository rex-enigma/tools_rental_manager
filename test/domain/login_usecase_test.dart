import 'package:flutter_test/flutter_test.dart';
import 'package:tools_rental_management/domain/entities/user_entity.dart';
import 'package:tools_rental_management/domain/usecases/login_usecase.dart';
import 'package:tools_rental_management/domain/usecases/usecase.dart';
import 'package:tools_rental_management/errors/exceptions.dart';

import '../fakes/repositories/fake_user_repository.dart';

void main() {
  late LoginUseCase loginUseCase;
  late FakeUserRepo fakeUserRepo;

  setUp(() {
    fakeUserRepo = FakeUserRepo();
    loginUseCase = LoginUseCase(userRepo: fakeUserRepo);
  });

  group('LoginUseCase Tests', () {
    test('should return UserEntity when credentials are valid', () async {
      final params = AccountParams(username: 'validUser', password: 'validPassword');
      final result = await loginUseCase.call(params);

      expect(result, isA<UserEntity>());
      expect(result?.username, 'validUser');
    });

    test('should throw UserNotFound exception when credentials are invalid', () async {
      final params = AccountParams(username: 'invalidUser', password: 'invalidPassword');

      expect(() async => await loginUseCase.call(params), throwsA(isA<UserNotFound>()));
    });

    test('should throw UserNotFound exception when user exists but password is wrong', () async {
      final params = AccountParams(username: 'validUser', password: 'wrongPassword');

      expect(() async => await loginUseCase.call(params), throwsA(isA<UserNotFound>()));
    });
  });
}
