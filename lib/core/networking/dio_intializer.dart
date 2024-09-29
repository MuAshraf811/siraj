import 'package:dio/dio.dart';

class DioIntializer {
  DioIntializer._();
  static Dio? _dio;

  static Dio init() {
    if (_dio == null) {
      _dio = Dio();
      _dio!.interceptors.add(
        LogInterceptor(
          error: true,
          responseHeader: true,
          request: true,
          requestBody: true,
          responseBody: true,
          requestHeader: true,
        ),
      );
      return _dio!;
    } else {
      return _dio!;
    }
  }
}
