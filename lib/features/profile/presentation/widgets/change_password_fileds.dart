import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lms/core/utils/app_regex.dart';
import 'package:lms/core/utils/styling/app_colors.dart';
import 'package:lms/core/utils/styling/text_style.dart';
import 'package:lms/core/widgets/app_text_form_field.dart';
import 'package:lms/core/widgets/spacing_widgets.dart';

class CahngePasswordFileds extends StatefulWidget {
  const CahngePasswordFileds({
    super.key,
    this.currentPasswordController,
    this.newPasswordController,
    this.confirmNewPasswordController,
  });
  final TextEditingController? currentPasswordController;
  final TextEditingController? newPasswordController;
  final TextEditingController? confirmNewPasswordController;

  @override
  State<CahngePasswordFileds> createState() => _CahngePasswordFiledsState();
}

class _CahngePasswordFiledsState extends State<CahngePasswordFileds> {
  bool isObscureText1 = true;
  bool isObscureText2 = true;
  bool isObscureText3 = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextFormField(
          controller: widget.currentPasswordController,
          hintText: 'current password',
          keyboardType: TextInputType.visiblePassword,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          inputTextStyle: Styles.style14,
          prefixIcon: const Icon(
            Icons.lock_outline,
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
              return 'Please enter your current password';
            }
            return null;
          },
        ),
        const HeightSpace(12),
        AppTextFormField(
          controller: widget.newPasswordController,
          hintText: 'new password',
          keyboardType: TextInputType.visiblePassword,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          inputTextStyle: Styles.style14,
          prefixIcon: const Icon(
            Icons.lock_outline,
            size: 18,
            color: grey,
          ),
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
          validator: (value) {
            if (value == null ||
                value.isEmpty ||
                !AppRegex.isPasswordValid(value)) {
              return 'Password must be at least 8 characters long, include uppercase,\nlowercase, number, and special character.';
            }
            return null;
          },
        ),
        const HeightSpace(12),
        AppTextFormField(
          controller: widget.confirmNewPasswordController,
          hintText: 'confirm new password',
          keyboardType: TextInputType.visiblePassword,
          inputTextStyle: Styles.style14,
          prefixIcon: const Icon(
            Icons.lock_outline,
            size: 18,
            color: grey,
          ),
          isObscureText: isObscureText3,
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                isObscureText3 = !isObscureText3;
              });
            },
            child: isObscureText3
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
            if (value == null ||
                value.isEmpty ||
                value != widget.confirmNewPasswordController!.text) {
              return 'Passwords do not match';
            }
            return null;
          },
        ),
      ],
    );
  }
}
