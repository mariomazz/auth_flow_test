import 'package:faker/faker.dart';
import '../model/login/auth_data_dto.dart';
import 'authentication_repository.dart';

class MockAuthenticationRepository
    implements AuthenticationRepositoryInterface {
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
