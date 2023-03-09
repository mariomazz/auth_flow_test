import 'package:dio/dio.dart';

class CorsInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (options.extra.containsKey("needsCors") &&
        options.extra["needsCors"] == true) {
      options.headers["Access-Control-Allow-Origin"] = "*";
    }
    super.onRequest(options, handler);
  }
}
