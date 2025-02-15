import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';

import '../local/global_storage.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      EasyLoading.showToast("Session timed out.\nPlease login again.");
      // Navigator.pushAndRemoveUntil(
      //   ContextHolder.currentContext,
      //   MaterialPageRoute(builder: (context) => const LoginScreen()),
      //   (route) => false,
      // );
      return;
    }
    super.onError(err, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    GlobalStorage globalStorage = GetIt.instance();
    bool isAuth = options.extra['auth'] ?? false;
    if (isAuth) {
      options.headers.addAll({"x-woloo-token": globalStorage.getToken()});
    }
    super.onRequest(options, handler);
  }
}
