import 'dart:convert';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../common/shared_preferences/data/shared_pref_repository.dart';
import '../../../common/utils/in_memory_store.dart';
import '../data/authentication_repository.dart';
import '../model/login/auth_data_dto.dart';
part 'authentication_service.g.dart';

class AuthenticationService {
  final AuthenticationRepositoryInterface authenticationRepository;
  final SharedPrefRepositortInterface sharedPrefRepository;
  final _authState = InMemoryStore<AuthDataDto?>(null);

  AuthDataDto? get currentUser => _authState.value;

  AuthenticationService({
    required this.authenticationRepository,
    required this.sharedPrefRepository,
  });

  Stream<AuthDataDto?> authStateChanges() {
    return _authState.stream;
  }

  Future<void> loadSession() async {
    _authState.value = await getCredentials();
  }

  Future<AuthDataDto> login() async {
    try {
      final authData = await authenticationRepository.login();
      _authState.value = authData;
      await _saveCredentials(authData);
      return authData;
    } catch (error) {
      rethrow;
    }
  }

  Future<void> logout() async {
    await _destroyCurrentCredentials();
    _authState.value = null;
  }

  Future<String?> refreshToken() async {
    final credentials = await getCredentials();
    if (credentials?.accessToken != null) {
      try {
        final authData = await authenticationRepository
            .refreshToken(credentials!.accessToken);

        _saveCredentials(authData);
        return authData.accessToken;
      } catch (error) {
        rethrow;
      }
    }
    return null;
  }

  _saveCredentials(AuthDataDto data) async {
    final mapData = data.toJson();
    sharedPrefRepository.save('credentials', json.encode(mapData));
  }

  _destroyCurrentCredentials() async {
    await sharedPrefRepository.remove('credentials');
    await sharedPrefRepository.remove('userdata');
  }

  Future<AuthDataDto?> getCredentials() async {
    final stringData = await sharedPrefRepository.read('credentials');
    if (stringData != null) {
      final jsonData = json.decode(stringData);
      final loginData = AuthDataDto.fromJson(jsonData);
      return loginData;
    }
    return null;
  }
}

@Riverpod(keepAlive: true)
AuthenticationService authenticationService(AuthenticationServiceRef ref) {
  final authService = AuthenticationService(
    authenticationRepository: ref.watch(authenticationRepositoryProvider),
    sharedPrefRepository: ref.watch(sharedPrefRepositoryProvider),
  );

  return authService;
}
