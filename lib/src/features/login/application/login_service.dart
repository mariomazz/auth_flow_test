import 'package:faker/faker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:universal_html/html.dart' as html;

class LoginService {
  void redirectToLoginSuccess(String redirectUri) {
    final uri = Uri.parse(redirectUri);
    final initialQuery = <String, dynamic>{};
    initialQuery.addAll(uri.queryParameters);
    final code = faker.randomGenerator.string(32, min: 32);
    initialQuery["code"] = code;
    final uriAp = uri.replace(queryParameters: initialQuery);
    html.window.location.href = uriAp.toString();
  }
}

final loginServiceProvider = Provider<LoginService>((ref) {
  return LoginService();
});
