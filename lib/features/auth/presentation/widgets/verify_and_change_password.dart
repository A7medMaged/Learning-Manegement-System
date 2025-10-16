import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms/core/utils/styling/app_colors.dart';
import 'package:lms/core/utils/styling/text_style.dart';
import 'package:lms/core/widgets/app_text_button.dart';
import 'package:lms/core/widgets/app_text_form_field.dart';
import 'package:lms/core/widgets/spacing_widgets.dart';
import 'package:lms/features/auth/data/models/reset_password_models/verify_and_change_request_model.dart';
import 'package:lms/features/auth/presentation/maneger/reset_password_cubit/reset_password_cubit.dart';
import 'package:lms/features/auth/presentation/widgets/otp.dart';
import 'package:toastification/toastification.dart';

class VerifyAndChangePassword extends StatefulWidget {
  const VerifyAndChangePassword({super.key, required this.email});
  final String? email;

  @override
  State<VerifyAndChangePassword> createState() =>
      _VerifyAndChangePasswordState();
}

class _VerifyAndChangePasswordState extends State<VerifyAndChangePassword> {
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  TextEditingController newPasswordController = TextEditingController();
  final otpController = TextEditingController();
  final focusNode = FocusNode();

  @override
  void dispose() {
    newPasswordController.dispose();
    otpController.dispose();
    focusNode.dispose();
    super.dispose();
  }

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
              Otp(
                otpController: otpController,
                focusNode: focusNode,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the OTP code';
                  }
                  if (value.length != 6) {
                    return 'OTP must be 6 digits';
                  }
                  if (int.tryParse(value) == null) {
                    return 'OTP must contain only numbers';
                  }
                  return null;
                },
              ),
              const HeightSpace(16),
              AppTextFormField(
                controller: newPasswordController,
                hintText: 'New Password',
              ),
              const HeightSpace(24),
              BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
                listener: (context, state) {
                  if (state is VerifyAndChangeSuccess) {
                    toastification.show(
                      context: context,
                      title: const Text('Success'),
                      description: const Text(
                        'Reset password code sent successfully',
                      ),
                      type: ToastificationType.success,
                      style: ToastificationStyle.minimal,
                    );
                  } else if (state is VerifyAndChangeFailure) {
                    toastification.show(
                      context: context,
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
                    text: 'Change Password',
                    textStyle: Styles.style18.copyWith(
                      color: white,
                    ),
                    isLoading: state is VerifyAndChangeLoading ? true : false,
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        final otp = otpController.text.trim();
                        final VerifyAndChangeRequestModel
                        verifyAndChangeReques = VerifyAndChangeRequestModel(
                          email: widget.email!,
                          newPassword: newPasswordController.text.trim(),
                          code: int.tryParse(otp),
                        );
                        context
                            .read<ResetPasswordCubit>()
                            .verifyAndChangePassword(verifyAndChangeReques);
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
