import 'package:flutter/material.dart';
import 'package:lms/core/utils/styling/app_colors.dart';
import 'package:lms/core/utils/styling/text_style.dart';
import 'package:pinput/pinput.dart';

class Otp extends StatefulWidget {
  const Otp({super.key, this.otpController, this.focusNode, this.validator});
  final TextEditingController? otpController;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = mainColor;
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = mainColor;

    final defaultPinTheme = PinTheme(
      width: 75,
      height: 75,
      textStyle: Styles.style18,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderColor),
      ),
    );

    return Column(
      children: [
        Directionality(
          textDirection: TextDirection.ltr,
          child: Pinput(
            enableInteractiveSelection: true,
            controller: widget.otpController,
            length: 6,
            focusNode: widget.focusNode,
            defaultPinTheme: defaultPinTheme,
            separatorBuilder: (index) => const SizedBox(width: 8),
            validator: widget.validator,
            hapticFeedbackType: HapticFeedbackType.lightImpact,
            pinAnimationType: PinAnimationType.fade,

            onCompleted: (pin) {
              debugPrint('onCompleted: $pin');
            },
            onChanged: (value) {
              debugPrint('onChanged: $value');
            },
            cursor: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 9),
                  width: 22,
                  height: 1,
                  color: focusedBorderColor,
                ),
              ],
            ),
            focusedPinTheme: defaultPinTheme.copyWith(
              decoration: defaultPinTheme.decoration!,
            ),
            submittedPinTheme: defaultPinTheme.copyWith(
              decoration: defaultPinTheme.decoration!.copyWith(
                color: fillColor,
                borderRadius: BorderRadius.circular(19),
                border: Border.all(color: focusedBorderColor),
              ),
            ),
            errorPinTheme: defaultPinTheme.copyBorderWith(
              border: Border.all(color: Colors.redAccent),
            ),
          ),
        ),
      ],
    );
  }
}
