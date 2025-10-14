import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lms/core/routes/app_routes.dart';
import 'package:lms/core/utils/di.dart';
import 'package:lms/core/utils/storage_helper.dart';
import 'package:lms/core/utils/styling/app_assets.dart';
import 'package:lms/features/onboarding/presentation/maneger/cubit/onboarding_cubit.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1, milliseconds: 500),
    )..repeat(reverse: true);
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    );
    waitAnimationAndNavigate();
  }

  Future<void> waitAnimationAndNavigate() async {
    await Future.delayed(const Duration(seconds: 3));

    final storage = getIt<StorageHelper>();
    // ignore: use_build_context_synchronously
    final onboardingCubit = context.read<OnboardingCubit>();

    final token = await storage.getUserToken();

    if (token != null && token.isNotEmpty && mounted) {
      context.pushReplacement(AppRoutes.homeRoute);
      return;
    }

    // check if onboarding finished
    final completed = await onboardingCubit.isOnboardingCompleted();

    if (completed && mounted) {
      context.pushReplacement(AppRoutes.loginRoute);
    } else {
      // ignore: use_build_context_synchronously
      context.pushReplacement(AppRoutes.onboardingRoute);
    }
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LottieBuilder.asset(
          AppAssets.splash,
          width: 400,
          height: 400,
        ),
      ),
    );
  }
}
