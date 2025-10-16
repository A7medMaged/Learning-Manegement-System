import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:lms/core/routes/app_routes.dart';
import 'package:lms/core/utils/app_regex.dart';
import 'package:lms/core/utils/styling/app_colors.dart';
import 'package:lms/core/utils/styling/text_style.dart';
import 'package:lms/core/widgets/app_text_button.dart';
import 'package:lms/core/widgets/app_text_form_field.dart';
import 'package:lms/core/widgets/spacing_widgets.dart';

class SendCodeToResetPassword extends StatefulWidget {
  const SendCodeToResetPassword({super.key});

  @override
  State<SendCodeToResetPassword> createState() =>
      _SendCodeToResetPasswordState();
}

class _SendCodeToResetPasswordState extends State<SendCodeToResetPassword> {
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get Code to Reset Password'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Enter your email to receive a reset code.',
                style: Styles.style18,
              ),
              const HeightSpace(16),
              AppTextFormField(
                controller: emailController,
                hintText: 'Enter your email',
                keyboardType: TextInputType.emailAddress,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                prefixIcon: const Icon(
                  FontAwesomeIcons.envelope,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  } else if (!AppRegex.isEmailValid(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const HeightSpace(24),
              AppTextButton(
                width: double.infinity,
                text: 'Send Code',
                textStyle: Styles.style18.copyWith(
                  color: white,
                ),
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    context.push(AppRoutes.verifyAndChangePasswordRoute);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
