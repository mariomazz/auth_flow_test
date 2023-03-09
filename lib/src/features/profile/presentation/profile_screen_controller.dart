import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../authentication/application/authentication_service.dart';
part 'profile_screen_controller.g.dart';

@riverpod
class ProfileScreenController extends _$ProfileScreenController {
  Future<void> didTapLogout() async {
    final authenticationService = ref.read(authenticationServiceProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(
        () async => await authenticationService.logout());
  }

  @override
  FutureOr<void> build() {}
}
