import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:lms/core/api/dio_factory.dart';
import 'package:lms/core/utils/storage_helper.dart';
import 'package:lms/features/auth/data/repos/auth_repo_impl.dart';
import 'package:lms/features/auth/presentation/maneger/login_cubit/login_cubit.dart';
import 'package:lms/features/auth/presentation/maneger/register_cubit/register_cubit.dart';
import 'package:lms/features/auth/presentation/maneger/verify_email_cubit/verify_email_cubit.dart';
import 'package:lms/features/home/data/repos/user_repo_impl.dart';
import 'package:lms/features/home/presentation/maneger/cubit/user_cubit.dart';
import 'package:lms/features/onboarding/data/repo/onboarding_repo.dart';
import 'package:lms/features/onboarding/presentation/maneger/cubit/onboarding_cubit.dart';

GetIt getIt = GetIt.instance;

Future<void> setupDependencyInjection() async {
  //  Dio >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  getIt.registerLazySingleton<Dio>(() => DioFactory.getDio());

  // Storage >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  getIt.registerLazySingleton<StorageHelper>(() => StorageHelper());

  getIt.registerLazySingletonAsync<SharedPrefsService>(
    () async {
      final s = SharedPrefsService();
      await s.init();
      return s;
    },
  );

  // Wait for async singletons that must be ready before registering dependents
  await getIt.isReady<SharedPrefsService>();

  // Reops >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  getIt.registerLazySingleton<AuthRepoImpl>(
    () => AuthRepoImpl(dio: getIt<Dio>()),
  );

  getIt.registerLazySingleton<OnboardingRepo>(
    () => OnboardingRepo(getIt<SharedPrefsService>()),
  );

  getIt.registerLazySingleton<UserRepoImpl>(
    () => UserRepoImpl(dio: getIt<Dio>()),
  );
  // cubits >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  getIt.registerFactory<RegisterCubit>(
    () => RegisterCubit(getIt<AuthRepoImpl>()),
  );

  getIt.registerFactory<VerifyEmailCubit>(
    () => VerifyEmailCubit(getIt<AuthRepoImpl>()),
  );

  getIt.registerFactory<LoginCubit>(
    () => LoginCubit(getIt<AuthRepoImpl>()),
  );

  getIt.registerFactory<OnboardingCubit>(
    () => OnboardingCubit(getIt<OnboardingRepo>()),
  );

  getIt.registerFactory<UserCubit>(
    () => UserCubit(getIt<UserRepoImpl>()),
  );
}
