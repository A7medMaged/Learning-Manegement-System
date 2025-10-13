import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:lms/core/api/dio_factory.dart';
import 'package:lms/core/utils/storage_helper.dart';

GetIt getIt = GetIt.instance;

void setupDependencyInjection() {
  //  Dio
  getIt.registerLazySingleton<Dio>(() => DioFactory.getDio());

  // Storage
  getIt.registerLazySingleton<StorageHelper>(() => StorageHelper());

  // Reops
}
