import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms/core/routes/app_routes.dart';
import 'package:go_router/go_router.dart';
import 'package:lms/core/utils/di.dart';
import 'package:lms/features/auth/presentation/login_screen.dart';
import 'package:lms/features/auth/presentation/maneger/login_cubit/login_cubit.dart';
import 'package:lms/features/auth/presentation/maneger/register_cubit/register_cubit.dart';
import 'package:lms/features/auth/presentation/register_screen.dart';
import 'package:lms/features/auth/presentation/verify_email_screen.dart';
import 'package:lms/features/home/presentation/home_screen.dart';
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
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<RegisterCubit>(),
          child: const RegisterScreen(),
        ),
      ),

      GoRoute(
        path: AppRoutes.loginRoute,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<LoginCubit>(),
          child: const LoginScreen(),
        ),
      ),

      GoRoute(
        path: AppRoutes.homeRoute,
        builder: (context, state) => const HomeScreen(),
      ),

      GoRoute(
        path: AppRoutes.otpVerificationRoute,
        builder: (context, state) => const VerifyEmailScreen(),
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
