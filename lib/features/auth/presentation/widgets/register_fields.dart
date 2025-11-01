import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lms/core/utils/app_regex.dart';
import 'package:lms/core/utils/styling/app_colors.dart';
import 'package:lms/core/widgets/app_text_form_field.dart';
import 'package:lms/core/widgets/spacing_widgets.dart';
import 'package:lms/features/auth/presentation/widgets/user_city.dart';
import 'package:lms/generated/l10n.dart';

class RegisterFields extends StatefulWidget {
  const RegisterFields({
    super.key,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.emailController,
    this.passwordController,
    this.confirmPasswordController,
    this.cityIdController,
  });
  final TextEditingController? firstName;
  final TextEditingController? lastName;
  final TextEditingController? phoneNumber;
  final TextEditingController? emailController;
  final TextEditingController? passwordController;
  final TextEditingController? confirmPasswordController;
  final TextEditingController? cityIdController;

  @override
  State<RegisterFields> createState() => _RegisterFieldsState();
}

class _RegisterFieldsState extends State<RegisterFields> {
  bool isObscureText1 = true;
  bool isObscureText2 = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextFormField(
          controller: widget.firstName,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return S.of(context).please_enter_first_name;
            }
            return null;
          },
          hintText: S.of(context).first_name,
          prefixIcon: const Icon(
            FontAwesomeIcons.user,
            size: 18,
            color: grey,
          ),
        ),
        const HeightSpace(16),
        AppTextFormField(
          controller: widget.lastName,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return S.of(context).please_enter_last_name;
            }
            return null;
          },
          hintText: S.of(context).last_name,
          prefixIcon: const Icon(
            FontAwesomeIcons.user,
            size: 18,
            color: grey,
          ),
        ),
        const HeightSpace(16),
        AppTextFormField(
          controller: widget.phoneNumber,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return S.of(context).please_enter_phone_number;
            } else if (!AppRegex.isPhoneNumberValid(value)) {
              return S.of(context).please_enter_valid_phone_number;
            }
            return null;
          },
          hintText: S.of(context).phone_number,
          prefixIcon: const Icon(
            Icons.phone_outlined,
            size: 18,
            color: grey,
          ),
          keyboardType: TextInputType.phone,
        ),
        const HeightSpace(16),
        AppTextFormField(
          controller: widget.emailController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return S.of(context).please_enter_your_email;
            } else if (!AppRegex.isEmailValid(value)) {
              return S.of(context).please_enter_valid_email;
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
              return S.of(context).please_enter_your_password;
            } else if (!AppRegex.isPasswordValid(value)) {
              return S.of(context).valid_password;
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
        const HeightSpace(16),
        AppTextFormField(
          controller: widget.confirmPasswordController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          keyboardType: TextInputType.visiblePassword,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return S.of(context).please_enter_confirm_password;
            } else if (value != widget.passwordController!.text) {
              return S.of(context).passwords_do_not_match;
            }
            return null;
          },
          hintText: S.of(context).confirm_password,
          prefixIcon: const Icon(
            Icons.lock_outlined,
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
        ),
        const HeightSpace(16),
        CityTextFieldSelector(
          cityNameController: TextEditingController(),
          cityIdController: widget.cityIdController!,
          hintText: S.of(context).city,
        ),
      ],
    );
  }
}
