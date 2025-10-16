import 'package:flutter/material.dart';
import 'package:lms/core/utils/styling/app_colors.dart';
import 'package:lms/core/utils/styling/text_style.dart';
import 'package:lms/core/widgets/app_text_button.dart';
import 'package:lms/core/widgets/app_text_form_field.dart';
import 'package:lms/core/widgets/spacing_widgets.dart';
import 'package:lms/features/auth/presentation/widgets/otp.dart';

class VerifyAndChangePassword extends StatefulWidget {
  const VerifyAndChangePassword({super.key});

  @override
  State<VerifyAndChangePassword> createState() =>
      _VerifyAndChangePasswordState();
}

class _VerifyAndChangePasswordState extends State<VerifyAndChangePassword> {
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  TextEditingController newPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify and Change Password'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              Text(
                'Enter the code sent to your email and change your password.',
                style: Styles.style18,
              ),
              const HeightSpace(16),
              const Otp(),
              const HeightSpace(16),
              AppTextFormField(
                controller: newPasswordController,
                hintText: 'New Password',
              ),
              const HeightSpace(24),
              AppTextButton(
                width: double.infinity,
                text: 'Change Password',
                textStyle: Styles.style18.copyWith(
                  color: white,
                ),
                onTap: () {
                  if (formKey.currentState!.validate()) {}
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
