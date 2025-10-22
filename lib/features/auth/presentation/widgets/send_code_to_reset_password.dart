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
import 'package:lms/generated/l10n.dart';
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
        title: Text(S.of(context).get_code),
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
                S.of(context).enter_your_email_to_get_code,
                style: Styles.style18,
              ),
              const HeightSpace(16),
              AppTextFormField(
                controller: emailController,
                hintText: S.of(context).email,
                keyboardType: TextInputType.emailAddress,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                prefixIcon: const Icon(
                  FontAwesomeIcons.envelope,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).please_enter_your_email;
                  } else if (!AppRegex.isEmailValid(value)) {
                    return S.of(context).please_enter_valid_email;
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
                      title: Text(S.of(context).code_sent),
                      description: Text(
                        state.sendResetCodeResponseModel.message!,
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
                      title: Text(S.of(context).error_occured),
                      description: Text(state.errorMessage),
                      type: ToastificationType.error,
                      style: ToastificationStyle.minimal,
                    );
                  }
                },
                builder: (context, state) {
                  return AppTextButton(
                    width: double.infinity,
                    text: S.of(context).send_code,
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
