import 'package:flutter/material.dart';
import 'package:lms/core/utils/styling/text_style.dart';
import 'package:lms/core/widgets/app_text_button.dart';
import 'package:lms/core/widgets/spacing_widgets.dart';
import 'package:lms/features/auth/presentation/widgets/fields.dart';
import 'package:lms/features/auth/presentation/widgets/pick_avatar.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController cityIdController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    cityIdController.dispose();
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
                  Center(
                    child: Text(
                      'Register Screen',
                      style: Styles.style25,
                    ),
                  ),
                  const HeightSpace(20),
                  Text(
                    '👋 Welcome!\n Create your account to get started with our app.',
                    style: Styles.style18Bold,
                  ),
                  const HeightSpace(48),
                  const PickAvatar(),
                  const HeightSpace(24),
                  Fields(
                    firstName: firstNameController,
                    lastName: lastNameController,
                    phoneNumber: phoneController,
                    emailController: emailController,
                    passwordController: passwordController,
                    confirmPasswordController: confirmPasswordController,
                    cityIdController: cityIdController,
                  ),
                  const HeightSpace(32),
                  AppTextButton(
                    text: 'Register',
                    width: double.infinity,
                    textStyle: Styles.style18Bold,
                    onTap: () {
                      if (formKey.currentState!.validate()) {}
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
