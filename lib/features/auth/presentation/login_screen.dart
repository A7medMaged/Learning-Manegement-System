import 'package:flutter/material.dart';
import 'package:lms/core/utils/styling/text_style.dart';
import 'package:lms/core/widgets/app_text_button.dart';
import 'package:lms/core/widgets/spacing_widgets.dart';
import 'package:lms/features/auth/presentation/widgets/do_not_have_account.dart';
import 'package:lms/features/auth/presentation/widgets/login_fields.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    'Login Screen',
                    style: Styles.style25,
                  ),
                  const HeightSpace(18),
                  LoginFields(
                    emailController: emailController,
                    passwordController: passwordController,
                  ),
                  const HeightSpace(24),
                  AppTextButton(
                    text: 'Login',
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                      
                      }
                    },
                    width: double.infinity,
                  ),
                  const HeightSpace(8),
                  const DoNotHaveAccount(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
