import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:lms/core/api/dio_factory.dart';
import 'package:lms/core/utils/storage_helper.dart';
import 'package:lms/features/auth/data/repos/register_repo_impl.dart';
import 'package:lms/features/auth/presentation/maneger/cubit/register_cubit.dart';

GetIt getIt = GetIt.instance;

void setupDependencyInjection() {
  //  Dio
  getIt.registerLazySingleton<Dio>(() => DioFactory.getDio());

  // Storage
  getIt.registerLazySingleton<StorageHelper>(() => StorageHelper());

  // Reops
  getIt.registerLazySingleton<RegisterRepoImpl>(
    () => RegisterRepoImpl(dio: getIt<Dio>()),
  );

  // cubits
  getIt.registerFactory<RegisterCubit>(
    () => RegisterCubit(getIt<RegisterRepoImpl>()),
  );
}
