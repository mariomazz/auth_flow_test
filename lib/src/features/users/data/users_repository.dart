import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../common/constants.dart';
import '../../../core/services/cors_interceptor.dart';
import '../model/user.dart';
part 'users_repository.g.dart';

abstract class UsersRepositoryInterface {
  Future<List<UserDto>> getUsers({Map<String, dynamic>? queryParameters});
  Future<UserDto> getUser(int id, {Map<String, dynamic>? queryParameters});
  void dispose();
}

class UsersRepository implements UsersRepositoryInterface {
  final Dio client;
  UsersRepository({
    required this.client,
  });
  @override
  Future<UserDto> getUser(int id,
      {Map<String, dynamic>? queryParameters}) async {
    final re = await client.get("users/${id.toString()}",
        queryParameters: queryParameters);
    return UserDto.fromJson(re.data);
  }

  @override
  Future<List<UserDto>> getUsers(
      {Map<String, dynamic>? queryParameters}) async {
    final re = await client.get("users", queryParameters: queryParameters);
    return userDtoFromList(re.data);
  }

  @override
  void dispose() {
    client.close();
  }
}

@Riverpod(keepAlive: true)
UsersRepositoryInterface usersRepository(UsersRepositoryRef ref) {
  final BaseOptions options = BaseOptions(
    connectTimeout: const Duration(milliseconds: 60000),
    receiveTimeout: const Duration(milliseconds: 30000),
    baseUrl: jsonPlaceholderAPIbaseUrl,
    extra: {"needsCors": true},
  );
  final Dio client = Dio(options);
  client.interceptors.addAll([CorsInterceptor()]);
  final repo = UsersRepository(client: client);
  ref.onDispose(() => repo.dispose());
  return repo;
}
