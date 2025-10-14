import 'package:flutter/material.dart';
import 'package:lms/core/utils/styling/text_style.dart';
import 'package:lms/core/widgets/app_text_button.dart';
import 'package:lms/core/widgets/spacing_widgets.dart';
import 'package:lms/features/auth/presentation/widgets/otp.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  final formKey = GlobalKey<FormState>();
  final otpController = TextEditingController();
  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Text(
                  'Verification',
                  style: Styles.style25,
                ),
                const HeightSpace(20),
                Text(
                  'A verification OTP has been sent to your email. \nPlease check your inbox and click the link to verify your account.',
                  style: Styles.style18SemiBold,
                ),
                const HeightSpace(175),
                Otp(
                  otpController: otpController,
                  focusNode: focusNode,
                  validator: (value) {
                    return value == '222222' ? null : 'Pin is incorrect';
                  },
                ),
                const HeightSpace(50),
                AppTextButton(
                  text: 'Verify',
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('OTP Verified!')),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Invalid OTP')),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
