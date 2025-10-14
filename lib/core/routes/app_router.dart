import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms/core/routes/app_routes.dart';
import 'package:go_router/go_router.dart';
import 'package:lms/core/utils/di.dart';
import 'package:lms/features/auth/presentation/login_screen.dart';
import 'package:lms/features/auth/presentation/maneger/cubit/register_cubit.dart';
import 'package:lms/features/auth/presentation/register_screen.dart';
import 'package:lms/features/auth/presentation/verify_email_screen.dart';
import 'package:lms/features/home/presentation/home_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.registerRoute,
    routes: [
      GoRoute(
        path: AppRoutes.registerRoute,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<RegisterCubit>(),
          child: const RegisterScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.loginRoute,
        builder: (context, state) => const LoginScreen(),
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
