import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms/core/routes/app_routes.dart';
import 'package:go_router/go_router.dart';
import 'package:lms/core/utils/di.dart';
import 'package:lms/features/auth/presentation/login_screen.dart';
import 'package:lms/features/auth/presentation/maneger/city_cubit/city_cubit.dart';
import 'package:lms/features/auth/presentation/maneger/login_cubit/login_cubit.dart';
import 'package:lms/features/auth/presentation/maneger/register_cubit/register_cubit.dart';
import 'package:lms/features/auth/presentation/maneger/reset_password_cubit/reset_password_cubit.dart';
import 'package:lms/features/auth/presentation/maneger/verify_email_cubit/verify_email_cubit.dart';
import 'package:lms/features/auth/presentation/register_screen.dart';
import 'package:lms/features/auth/presentation/verify_email_screen.dart';
import 'package:lms/features/auth/presentation/widgets/send_code_to_reset_password.dart';
import 'package:lms/features/auth/presentation/widgets/verify_and_change_password.dart';
import 'package:lms/features/home/presentation/course_details_screen.dart';
import 'package:lms/features/home/presentation/manager/course_details_cubit/course_details_cubit.dart';
import 'package:lms/features/main/presentation/main_screen.dart';
import 'package:lms/features/profile/presentation/change_password_screen.dart';
import 'package:lms/features/profile/presentation/maneger/change_avatar_cubit/change_avatar_cubit.dart';
import 'package:lms/features/profile/presentation/maneger/change_password_cubit/change_password_cubit.dart';
import 'package:lms/features/profile/presentation/maneger/update_info_cubit/update_info_cubit.dart';
import 'package:lms/features/profile/presentation/maneger/user_cubit/user_cubit.dart';
import 'package:lms/features/main/presentation/settings_screen.dart';
import 'package:lms/features/profile/presentation/update_info_screen.dart';
import 'package:lms/features/onboarding/presentation/maneger/cubit/onboarding_cubit.dart';
import 'package:lms/features/onboarding/presentation/onboarding_screen.dart';
import 'package:lms/features/splash_screen/splash_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.splashRoute,
    routes: [
      GoRoute(
        path: AppRoutes.splashRoute,
        pageBuilder: (context, state) => _fadeTransition(
          BlocProvider(
            create: (context) => getIt<OnboardingCubit>(),
            child: const SplashScreen(),
          ),
        ),
      ),

      GoRoute(
        path: AppRoutes.onboardingRoute,
        pageBuilder: (context, state) => _fadeTransition(
          BlocProvider(
            create: (context) => getIt<OnboardingCubit>(),
            child: const OnboardingScreen(),
          ),
        ),
      ),

      GoRoute(
        path: AppRoutes.registerRoute,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => getIt<RegisterCubit>(),
            ),
            BlocProvider(
              create: (context) => getIt<CityCubit>(),
            ),
          ],
          child: const RegisterScreen(),
        ),
      ),

      GoRoute(
        path: AppRoutes.otpVerificationRoute,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          final email = extra?['email'] as String? ?? '';
          return BlocProvider(
            create: (context) => getIt<VerifyEmailCubit>(),
            child: VerifyEmailScreen(email: email),
          );
        },
      ),

      GoRoute(
        path: AppRoutes.loginRoute,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<LoginCubit>(),
          child: const LoginScreen(),
        ),
      ),

      GoRoute(
        path: AppRoutes.mainRoute,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<UserCubit>()..getUserData(),
          child: const MainScreen(),
        ),
      ),

      GoRoute(
        path: AppRoutes.settingsRoute,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => getIt<UserCubit>()..getUserData(),
            ),
            BlocProvider(
              create: (context) => getIt<ChangeAvatarCubit>(),
            ),
          ],
          child: const SettingsScreen(),
        ),
      ),

      GoRoute(
        path: AppRoutes.updateInfoRoute,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => getIt<UserCubit>()..getUserData(),
            ),
            BlocProvider(
              create: (context) => getIt<UpdateInfoCubit>(),
            ),
          ],
          child: const UpdateInfoScreen(),
        ),
      ),

      GoRoute(
        path: AppRoutes.cahngePasswordRoute,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<ChangePasswordCubit>(),
          child: const ChangePasswordScreen(),
        ),
      ),

      GoRoute(
        path: AppRoutes.resetPasswordRoute,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<ResetPasswordCubit>(),
          child: const SendCodeToResetPassword(),
        ),
      ),

      GoRoute(
        path: AppRoutes.verifyAndChangePasswordRoute,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          final email = extra?['email'] as String? ?? '';
          return BlocProvider(
            create: (context) => getIt<ResetPasswordCubit>(),
            child: VerifyAndChangePassword(
              email: email,
            ),
          );
        },
      ),

      GoRoute(
        path: AppRoutes.courseDetailsRoute,
        builder: (context, state) {
          final courseId = state.extra as int?;
          return BlocProvider(
            create: (context) {
              final cubit = getIt<CourseDetailsCubit>();
              cubit.fetchCourseDetails(courseId!);
              return cubit;
            },

            child: const CourseDetailsScreen(),
          );
        },
      ),
    ],
  );
}

CustomTransitionPage _fadeTransition(Widget child) {
  return CustomTransitionPage(
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: CurvedAnimation(
          parent: animation,
          curve: Curves.easeInOut,
        ),
        child: child,
      );
    },
    transitionDuration: const Duration(milliseconds: 500),
  );
}
