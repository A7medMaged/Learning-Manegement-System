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
import 'package:lms/features/auth/data/models/reset_password_models/verify_and_change_request_model.dart';
import 'package:lms/features/auth/presentation/maneger/reset_password_cubit/reset_password_cubit.dart';
import 'package:lms/features/auth/presentation/widgets/otp.dart';
import 'package:lms/generated/l10n.dart';
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
  TextEditingController confirmNewPasswordController = TextEditingController();
  final otpController = TextEditingController();
  final focusNode = FocusNode();
  bool isObscureText1 = true;
  bool isObscureText2 = true;

  @override
  void dispose() {
    newPasswordController.dispose();
    confirmNewPasswordController.dispose();
    otpController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).verify_and_change_password),
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
                    return S.of(context).please_enter_otp;
                  }
                  if (value.length != 6) {
                    return S.of(context).otp_must_be_6_digits;
                  }
                  if (int.tryParse(value) == null) {
                    return S.of(context).otp_must_contain_only_numbers;
                  }
                  return null;
                },
              ),
              const HeightSpace(16),
              AppTextFormField(
                controller: newPasswordController,
                hintText: S.of(context).new_password,
                keyboardType: TextInputType.visiblePassword,
                prefixIcon: const Icon(
                  Icons.lock_outlined,
                  size: 18,
                  color: grey,
                ),
                isObscureText: isObscureText1,
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      isObscureText1 = !isObscureText1;
                    });
                  },
                  child: isObscureText1
                      ? const Icon(
                          FontAwesomeIcons.eyeSlash,
                          color: grey,
                          size: 18,
                        )
                      : const Icon(
                          FontAwesomeIcons.eye,
                          color: grey,
                          size: 18,
                        ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).please_enter_your_password;
                  } else if (!AppRegex.isPasswordValid(value)) {
                    return S.of(context).valid_password;
                  }
                  return null;
                },
              ),
              const HeightSpace(12),
              AppTextFormField(
                controller: confirmNewPasswordController,
                hintText: S.of(context).confirm_new_password,
                keyboardType: TextInputType.visiblePassword,
                prefixIcon: const Icon(
                  Icons.lock_outlined,
                  size: 18,
                  color: grey,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).please_enter_confirm_password;
                  } else if (value != newPasswordController.text) {
                    return S.of(context).passwords_do_not_match;
                  }
                  return null;
                },
                isObscureText: isObscureText2,
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      isObscureText2 = !isObscureText2;
                    });
                  },
                  child: isObscureText2
                      ? const Icon(
                          FontAwesomeIcons.eyeSlash,
                          color: grey,
                          size: 18,
                        )
                      : const Icon(
                          FontAwesomeIcons.eye,
                          color: grey,
                          size: 18,
                        ),
                ),
              ),
              const HeightSpace(24),
              BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
                listener: (context, state) {
                  if (state is VerifyAndChangeSuccess) {
                    toastification.show(
                      context: context,
                      dismissDirection: DismissDirection.up,
                      autoCloseDuration: const Duration(seconds: 4),
                      title: Text(S.of(context).password_changed_successfully),
                      description: Text(
                        state.verifyAndChangeResponseModel.message!,
                      ),
                      type: ToastificationType.success,
                      style: ToastificationStyle.minimal,
                    );
                    context.pushReplacement(AppRoutes.loginRoute);
                  } else if (state is VerifyAndChangeFailure) {
                    toastification.show(
                      context: context,
                      dismissDirection: DismissDirection.up,
                      autoCloseDuration: const Duration(seconds: 4),
                      title: Text(S.of(context).error_occured),
                      description: Text(state.errorMessage),
                      type: ToastificationType.error,
                      style: ToastificationStyle.minimal,
                    );
                    context.pop();
                  }
                },
                builder: (context, state) {
                  return AppTextButton(
                    width: double.infinity,
                    text: S.of(context).change_password,
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
