import 'package:flutter/material.dart';
import 'package:lms/core/routes/app_router.dart';
import 'package:lms/core/utils/di.dart';
import 'package:lms/lms.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupDependencyInjection();
  
  runApp(
    LmsApp(
      appRouter: AppRouter(),
    ),
  );
}
