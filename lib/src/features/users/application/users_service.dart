import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/users_repository.dart';
import '../model/user.dart';
part 'users_service.g.dart';

class UsersService {
  final UsersRepositoryInterface usersRepo;
  UsersService({
    required this.usersRepo,
  });

  Future<List<UserDto>> getUsers(
      {Map<String, dynamic>? queryParameters}) async {
    return await usersRepo.getUsers(queryParameters: queryParameters);
  }

  Future<UserDto> getUser(int id,
      {Map<String, dynamic>? queryParameters}) async {
    return await usersRepo.getUser(id, queryParameters: queryParameters);
  }
}

@Riverpod(keepAlive: true)
UsersService usersService(UsersServiceRef ref) {
  final serv = UsersService(
    usersRepo: ref.watch(usersRepositoryProvider),
  );
  return serv;
}
