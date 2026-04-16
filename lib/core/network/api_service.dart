import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  // Method عامة لأي Get Request
  Future<Map<String, dynamic>> get({required String endpoint}) async {
    var response = await _dio.get(endpoint);
    return response.data;
  }

  // Method عامة لأي Post Request (زي إرسال الأوردر)
  Future<Map<String, dynamic>> post({
    required String endpoint,
    required Map<String, dynamic> data,
  }) async {
    var response = await _dio.post(endpoint, data: data);
    return response.data;
  }
}