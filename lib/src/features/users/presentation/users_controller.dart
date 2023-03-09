import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../application/users_service.dart';
import '../model/user.dart';
part 'users_controller.g.dart';

@riverpod
class UsersController extends _$UsersController {
  @override
  Future<List<UserDto>> build() async {
    final serv = ref.read(usersServiceProvider);
    return await serv.getUsers();
  }
}
