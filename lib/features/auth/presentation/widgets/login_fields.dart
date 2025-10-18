import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lms/core/utils/app_regex.dart';
import 'package:lms/core/utils/styling/app_colors.dart';
import 'package:lms/core/widgets/app_text_form_field.dart';
import 'package:lms/core/widgets/spacing_widgets.dart';
import 'package:lms/generated/l10n.dart';

class LoginFields extends StatefulWidget {
  const LoginFields({
    super.key,
    this.emailController,
    this.passwordController,
  });
  final TextEditingController? emailController;
  final TextEditingController? passwordController;

  @override
  State<LoginFields> createState() => _LoginFieldsState();
}

class _LoginFieldsState extends State<LoginFields> {
  bool isObscureText1 = true;
  bool isObscureText2 = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextFormField(
          controller: widget.emailController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your email';
            } else if (!AppRegex.isEmailValid(value)) {
              return 'Please enter a valid email';
            }
            return null;
          },
          hintText: S.of(context).email,
          prefixIcon: const Icon(
            FontAwesomeIcons.envelope,
            size: 18,
            color: grey,
          ),
          keyboardType: TextInputType.emailAddress,
        ),
        const HeightSpace(16),
        AppTextFormField(
          controller: widget.passwordController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          keyboardType: TextInputType.visiblePassword,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'please enter your password';
            }
            return null;
          },
          hintText: S.of(context).password,
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
        ),
      ],
    );
  }
}
