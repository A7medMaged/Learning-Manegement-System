import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lms/core/routes/app_routes.dart';
import 'package:lms/core/utils/styling/app_colors.dart';
import 'package:lms/core/utils/styling/text_style.dart';
import 'package:lms/core/widgets/app_text_button.dart';
import 'package:lms/core/widgets/spacing_widgets.dart';
import 'package:lms/features/auth/data/models/verify_email_models/verify_email_request_model.dart';
import 'package:lms/features/auth/presentation/maneger/verify_email_cubit/verify_email_cubit.dart';
import 'package:lms/features/auth/presentation/widgets/otp.dart';
import 'package:lms/generated/l10n.dart';
import 'package:toastification/toastification.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final otpController = TextEditingController();
    final focusNode = FocusNode();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            S.of(context).verify_your_email,
            style: Styles.style20,
          ),
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    S.of(context).verify_your_email,
                    style: Styles.style25,
                  ),
                  const HeightSpace(20),
                  Text(
                    'A verification OTP has been sent to your email. \nPlease check your inbox and click the link to verify your account.',
                    style: Styles.style18SemiBold.copyWith(
                      color: grey,
                    ),
                  ),
                  const HeightSpace(175),
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
                  const HeightSpace(50),
                  BlocConsumer<VerifyEmailCubit, VerifyEmailState>(
                    listener: (context, state) {
                      if (state is VerifyEmailSuccess) {
                        toastification.show(
                          context: context,
                          dismissDirection: DismissDirection.up,
                          autoCloseDuration: const Duration(seconds: 4),
                          title: const Text('Verification Successful'),
                          description: Text(
                            state.verifyEmailResponse.message!,
                          ),
                          type: ToastificationType.success,
                          style: ToastificationStyle.minimal,
                        );
                        context.pushReplacement(AppRoutes.loginRoute);
                      } else if (state is VerifyEmailFailure) {
                        toastification.show(
                          context: context,
                          dismissDirection: DismissDirection.up,
                          autoCloseDuration: const Duration(seconds: 4),
                          type: ToastificationType.error,
                          title: const Text('Verification Failed'),
                          description: Text(
                            state.errorMessage,
                          ),
                          style: ToastificationStyle.minimal,
                        );
                      }
                    },
                    builder: (context, state) {
                      return AppTextButton(
                        width: double.infinity,
                        text: 'Verify',
                        textStyle: Styles.style18SemiBold.copyWith(
                          color: white,
                        ),
                        isLoading: state is VerifyEmailLoading ? true : false,
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            final otp = otpController.text.trim();
                            context.read<VerifyEmailCubit>().verifyEmail(
                              VerifyEmailRequestModel(
                                email: email,
                                code: int.tryParse(otp),
                              ),
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
        ),
      ),
    );
  }
}
