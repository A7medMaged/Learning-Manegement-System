import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lms/core/routes/app_router.dart';
import 'package:lms/core/utils/styling/app_colors.dart';
import 'package:lms/features/translation/cubit/local_cubit.dart';
import 'package:lms/generated/l10n.dart';

class LmsApp extends StatelessWidget {
  const LmsApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocaleCubit(),
      child: BlocBuilder<LocaleCubit, Locale>(
        builder: (context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            locale: Locale(state.languageCode),
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            theme: ThemeData(
              textTheme: GoogleFonts.ubuntuTextTheme(
                Theme.of(context).textTheme,
              ),
              scaffoldBackgroundColor: white,
            ),
            routerConfig: appRouter.router,
          );
        },
      ),
    );
  }
}
