import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lms/core/routes/app_routes.dart';
import 'package:lms/core/utils/styling/app_colors.dart';
import 'package:lms/core/utils/styling/text_style.dart';

class DoNotHaveAccount extends StatelessWidget {
  const DoNotHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Don\'t have an account?',
            style: Styles.style14.copyWith(
              color: black,
            ),
          ),
          TextSpan(
            text: ' Register',
            style: Styles.style14.copyWith(color: mainColor),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.pushReplacement(AppRoutes.registerRoute);
              },
          ),
        ],
      ),
    );
  }
}
