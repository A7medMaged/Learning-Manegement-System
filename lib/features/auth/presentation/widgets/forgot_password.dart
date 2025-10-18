import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lms/core/routes/app_routes.dart';
import 'package:lms/core/utils/styling/text_style.dart';
import 'package:lms/generated/l10n.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(AppRoutes.resetPasswordRoute);
      },
      child: Container(
        alignment: Alignment.centerRight,
        child: Text(
          S.of(context).forgot_password,
          style: Styles.style14.copyWith(
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}
