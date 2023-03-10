import 'package:auth_flow_test/src/common/extensions/widget.dart';
import 'package:auth_flow_test/src/common/utils/app_sizes.dart';
import 'package:auth_flow_test/src/features/login/presentation/login_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({required this.redirectUriAfterLogin, super.key});
  final String redirectUriAfterLogin;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginScreenController =
        ref.read(loginScreenControllerProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Accedi con credenziali"),
      ),
      body: Column(
        children: [
          gapH64,
          const TextField().size(width: 400).padding(const EdgeInsets.all(20)),
          const TextField().size(width: 400).padding(const EdgeInsets.all(20)),
          gapH32,
          ElevatedButton(
            onPressed: () {
              loginScreenController.didTapLogin(redirectUriAfterLogin);
            },
            child: const Text("LOGIN"),
          ).padding(const EdgeInsets.all(10)),
          gapH64,
        ],
      ).expand(),
    );
  }
}
