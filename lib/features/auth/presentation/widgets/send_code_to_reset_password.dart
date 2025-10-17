import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:lms/core/routes/app_routes.dart';
import 'package:lms/core/utils/app_regex.dart';
import 'package:lms/core/utils/styling/app_colors.dart';
import 'package:lms/core/utils/styling/text_style.dart';
import 'package:lms/core/widgets/app_text_button.dart';
import 'package:lms/core/widgets/app_text_form_field.dart';
import 'package:lms/core/widgets/spacing_widgets.dart';
import 'package:lms/features/auth/data/models/reset_password_models/send_reset_code_request_model.dart';
import 'package:lms/features/auth/presentation/maneger/reset_password_cubit/reset_password_cubit.dart';
import 'package:toastification/toastification.dart';

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
              BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
                listener: (context, state) {
                  if (state is SendResetCodeSuccess) {
                    final email = emailController.text.trim();
                    toastification.show(
                      context: context,
                      dismissDirection: DismissDirection.up,
                      autoCloseDuration: const Duration(seconds: 4),
                      title: const Text('Success'),
                      description: const Text(
                        'Reset password code sent successfully',
                      ),
                      type: ToastificationType.success,
                      style: ToastificationStyle.minimal,
                    );
                    context.push(
                      AppRoutes.verifyAndChangePasswordRoute,
                      extra: {'email': email},
                    );
                  } else if (state is SendResetCodeFailure) {
                    toastification.show(
                      context: context,
                      dismissDirection: DismissDirection.up,
                      autoCloseDuration: const Duration(seconds: 4),
                      title: const Text('Error'),
                      description: Text(state.errorMessage),
                      type: ToastificationType.error,
                      style: ToastificationStyle.minimal,
                    );
                  }
                },
                builder: (context, state) {
                  return AppTextButton(
                    width: double.infinity,
                    text: 'Send Code',
                    textStyle: Styles.style18.copyWith(
                      color: white,
                    ),
                    isLoading: state is SendResetCodeLoading ? true : false,
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        final SendResetCodeRequestModel sendResetCodeRequest =
                            SendResetCodeRequestModel(
                              email: emailController.text.trim(),
                            );
                        context.read<ResetPasswordCubit>().sendResetCode(
                          sendResetCodeRequest,
                        );
                      }
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
