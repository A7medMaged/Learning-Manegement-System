import 'package:flutter/material.dart';
import 'package:lms/core/utils/styling/text_style.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key, this.onTap});
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.centerRight,
        child: Text(
          'Forgot Password?',
          style: Styles.style14,
        ),
      ),
    );
  }
}
