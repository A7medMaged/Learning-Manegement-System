import 'package:lms/core/routes/app_routes.dart';
import 'package:go_router/go_router.dart';
import 'package:lms/features/auth/presentation/login_screen.dart';
import 'package:lms/features/auth/presentation/register_screen.dart';
import 'package:lms/features/home/presentation/home_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.loginRoute,
    routes: [
      GoRoute(
        path: AppRoutes.registerRoute,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: AppRoutes.loginRoute,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: AppRoutes.homeRoute,
        builder: (context, state) => const HomeScreen(),
      ),
    ],
  );
}
