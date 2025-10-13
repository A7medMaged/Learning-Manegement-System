// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:lms/core/utils/styling/app_colors.dart';
import 'package:lms/core/utils/styling/text_style.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String? hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? backgroundColor;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final AutovalidateMode autovalidateMode;

  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.prefixIcon,
    this.backgroundColor,
    this.controller,
    this.validator,
    this.keyboardType,
    this.autovalidateMode = AutovalidateMode.disabled,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autovalidateMode: autovalidateMode,
      keyboardType: keyboardType ?? TextInputType.text,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        suffixIconColor: WidgetStateColor.resolveWith(
          (states) =>
              states.contains(WidgetState.focused) ? mainColor : lightGray,
        ),
        prefixIconColor: WidgetStateColor.resolveWith(
          (states) =>
              states.contains(WidgetState.focused) ? mainColor : lightGray,
        ),
        isDense: true,
        contentPadding:
            contentPadding ??
            const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        focusedBorder:
            focusedBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: mainColor,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
        enabledBorder:
            enabledBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(color: lightGray, width: 1.3),
              borderRadius: BorderRadius.circular(16.0),
            ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1.3),
          borderRadius: BorderRadius.circular(16.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1.3),
          borderRadius: BorderRadius.circular(16.0),
        ),
        hintStyle: hintStyle ?? Styles.style14.copyWith(color: lightGray),
        hintText: hintText ?? '',
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        fillColor: backgroundColor ?? white,
        filled: true,
      ),
      obscureText: isObscureText ?? false,
      style: Styles.style14.copyWith(color: lightGray),
      validator: validator,
    );
  }
}
