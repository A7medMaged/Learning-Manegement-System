import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lms/core/routes/app_routes.dart';
import 'package:lms/core/utils/styling/text_style.dart';
import 'package:lms/core/widgets/app_text_button.dart';
import 'package:lms/core/widgets/spacing_widgets.dart';
import 'package:lms/features/auth/data/models/login_models/login_request_model.dart';
import 'package:lms/features/auth/presentation/maneger/login_cubit/login_cubit.dart';
import 'package:lms/features/auth/presentation/widgets/do_not_have_account.dart';
import 'package:lms/features/auth/presentation/widgets/login_fields.dart';
import 'package:toastification/toastification.dart';

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
                  BlocConsumer<LoginCubit, LoginState>(
                    listener: (context, state) {
                      if (state is LoginSuccess) {
                        toastification.show(
                          context: context,
                          title: const Text('Login Successful'),
                          description: const Text(
                            'You have successfully logged in.',
                          ),
                          type: ToastificationType.success,
                          style: ToastificationStyle.minimal,
                        );
                        context.pushReplacement(AppRoutes.homeRoute);
                      } else if (state is LoginFailure) {
                        toastification.show(
                          context: context,
                          title: const Text('Login Failed'),
                          description: Text(state.errorMessage),
                          type: ToastificationType.error,
                          style: ToastificationStyle.minimal,
                        );
                      }
                    },
                    builder: (context, state) {
                      return AppTextButton(
                        text: 'Login',
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            final loginRequest = LoginRequestModel(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                            );
                            context.read<LoginCubit>().loginUsers(loginRequest);
                          }
                        },
                        width: double.infinity,
                      );
                    },
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
