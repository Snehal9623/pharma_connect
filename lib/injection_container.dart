import 'package:dio/dio.dart';
import 'package:dio_log/interceptor/dio_log_interceptor.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pharma_connect/local/global_storage.dart';
import 'package:pharma_connect/network/dio_client.dart';

import 'interceptor/auth_interceptor.dart';
import 'interceptor/error_interceptor.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /// Dio
  var dio = Dio();
  DioLogInterceptor.enablePrintLog = false;
  dio.interceptors.add(DioLogInterceptor());
  dio.interceptors.add(AuthInterceptor());
  dio.interceptors.add(ErrorInterceptor());

  sl.registerLazySingleton(() => DioClient(dio));
  sl.registerLazySingleton(() => GlobalStorage(GetStorage()));
}
