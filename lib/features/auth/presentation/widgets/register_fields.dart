import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lms/core/utils/app_regex.dart';

import 'package:lms/core/utils/styling/app_colors.dart';
import 'package:lms/core/widgets/app_text_form_field.dart';
import 'package:lms/core/widgets/spacing_widgets.dart';

class RegisterFields extends StatefulWidget {
  const RegisterFields({
    super.key,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.emailController,
    this.passwordController,
    this.cityIdController,
    this.confirmPasswordController,
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
              return 'Please enter your first name';
            }
            return null;
          },
          hintText: 'First Name',
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
              return 'Please enter your last name';
            }
            return null;
          },
          hintText: 'Last Name',
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
            if (value == null ||
                value.isEmpty ||
                AppRegex.isPhoneNumberValid(value)) {
              return 'Please enter your phone number';
            }
            return null;
          },
          hintText: 'Phone number',
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
            if (value == null ||
                value.isEmpty ||
                !AppRegex.isEmailValid(value)) {
              return 'Please enter a valid email';
            }
            return null;
          },
          hintText: 'Email',
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
            if (value == null ||
                value.isEmpty ||
                !AppRegex.isPasswordValid(value)) {
              return 'Password must be at least 8 characters long, include uppercase,\nlowercase, number, and special character.';
            }
            return null;
          },
          hintText: 'Password',
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
            if (value == null ||
                value.isEmpty ||
                value != widget.passwordController!.text) {
              return 'Passwords do not match';
            }
            return null;
          },
          hintText: 'Confirm Password',
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
        AppTextFormField(
          controller: widget.cityIdController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your city id';
            }
            return null;
          },
          hintText: 'City id',
          keyboardType: TextInputType.number,
          prefixIcon: const Icon(
            FontAwesomeIcons.city,
            size: 18,
            color: grey,
          ),
        ),
      ],
    );
  }
}
