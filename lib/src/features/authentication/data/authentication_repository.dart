import 'dart:async';
import 'package:faker/faker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../model/login/auth_data_dto.dart';
part 'authentication_repository.g.dart';

abstract class AuthenticationRepositoryInterface {
  Future<AuthDataDto> login();
  Future<AuthDataDto> refreshToken(String refreshToken);
}

class AuthenticationRepository implements AuthenticationRepositoryInterface {
  @override
  Future<AuthDataDto> login() async {
    return await Future.delayed(const Duration(seconds: 2), () {
      return AuthDataDto(
        accessToken: faker.randomGenerator.string(16, min: 16),
        refreshToken: faker.randomGenerator.string(16, min: 16),
      );
    });
  }

  @override
  Future<AuthDataDto> refreshToken(String refreshToken) async {
    return await Future.delayed(const Duration(seconds: 2), () {
      return AuthDataDto(
        accessToken: faker.randomGenerator.string(16, min: 16),
        refreshToken: faker.randomGenerator.string(16, min: 16),
      );
    });
  }
}

@Riverpod(keepAlive: true)
AuthenticationRepositoryInterface authenticationRepository(
    AuthenticationRepositoryRef ref) {
  final authRepo = AuthenticationRepository();
  return authRepo;
}
