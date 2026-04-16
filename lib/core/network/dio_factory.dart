import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  static Dio? _dio;

  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 30);

    if (_dio == null) {
      _dio = Dio();
      _dio!
        ..options.baseUrl = "https://dummyjson.com/"
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;

      addDioInterceptor();
    }
    return _dio!;
  }

  static void addDioInterceptor() {
    _dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
        
      ),
    );
  }
}