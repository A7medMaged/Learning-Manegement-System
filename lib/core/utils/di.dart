import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:lms/core/api/dio_factory.dart';
import 'package:lms/core/utils/shared_pref_helper.dart';
import 'package:lms/features/auth/data/repos/auth_repo_impl.dart';
import 'package:lms/features/auth/presentation/maneger/city_cubit/city_cubit.dart';
import 'package:lms/features/auth/presentation/maneger/login_cubit/login_cubit.dart';
import 'package:lms/features/auth/presentation/maneger/register_cubit/register_cubit.dart';
import 'package:lms/features/auth/presentation/maneger/reset_password_cubit/reset_password_cubit.dart';
import 'package:lms/features/auth/presentation/maneger/verify_email_cubit/verify_email_cubit.dart';
import 'package:lms/features/profile/data/repos/profile_repo_impl.dart';
import 'package:lms/features/profile/presentation/maneger/change_avatar_cubit/change_avatar_cubit.dart';
import 'package:lms/features/profile/presentation/maneger/change_password_cubit/change_password_cubit.dart';
import 'package:lms/features/profile/presentation/maneger/update_info_cubit/update_info_cubit.dart';
import 'package:lms/features/profile/presentation/maneger/user_cubit/user_cubit.dart';
import 'package:lms/features/onboarding/data/repo/onboarding_repo.dart';
import 'package:lms/features/onboarding/presentation/maneger/cubit/onboarding_cubit.dart';

GetIt getIt = GetIt.instance;

Future<void> setupDependencyInjection() async {
  //  Dio >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  getIt.registerLazySingleton<Dio>(() => DioFactory.getDio());

  // Storage Helper >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  getIt.registerLazySingleton<SharedPrefHelper>(
    () => SharedPrefHelper(),
  );

  // Reops >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  getIt.registerLazySingleton<AuthRepoImpl>(
    () => AuthRepoImpl(dio: getIt<Dio>()),
  );

  getIt.registerLazySingleton<OnboardingRepo>(
    () => OnboardingRepo(getIt<SharedPrefHelper>()),
  );

  getIt.registerLazySingleton<ProfileRepoImpl>(
    () => ProfileRepoImpl(dio: getIt<Dio>()),
  );
  // cubits >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  getIt.registerFactory<RegisterCubit>(
    () => RegisterCubit(getIt<AuthRepoImpl>()),
  );

  getIt.registerFactory<CityCubit>(
    () => CityCubit(getIt<AuthRepoImpl>()),
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
    () => UserCubit(getIt<ProfileRepoImpl>()),
  );

  getIt.registerFactory<UpdateInfoCubit>(
    () => UpdateInfoCubit(getIt<ProfileRepoImpl>()),
  );

  getIt.registerFactory<ChangePasswordCubit>(
    () => ChangePasswordCubit(getIt<ProfileRepoImpl>()),
  );

  getIt.registerFactory<ResetPasswordCubit>(
    () => ResetPasswordCubit(getIt<AuthRepoImpl>()),
  );

  getIt.registerFactory<ChangeAvatarCubit>(
    () => ChangeAvatarCubit(getIt<ProfileRepoImpl>()),
  );
}
