import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import '../network/dio_factory.dart';
import '../network/api_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  // 1. Dio
  getIt.registerLazySingleton<Dio>(() => DioFactory.getDio());

  // 2. Api Service
  getIt.registerLazySingleton<ApiService>(() => ApiService(getIt<Dio>()));
}