import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../application/login_service.dart';

class LoginScreenController extends StateNotifier<AsyncValue<void>> {
  LoginScreenController(super.value, this.loginService);
  final LoginService loginService;
  void didTapLogin(String redirectUri) {
    state = const AsyncValue.loading();
    loginService.redirectToLoginSuccess(redirectUri);
    // ignore: void_checks
    state = AsyncValue.data(() => {});
  }
}

final loginScreenControllerProvider =
    StateNotifierProvider<LoginScreenController, AsyncValue<void>>(
  (ref) => LoginScreenController(
    const AsyncValue.loading(),
    ref.watch(loginServiceProvider),
  ),
);
