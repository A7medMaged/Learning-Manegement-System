import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lms/core/utils/styling/app_colors.dart';
import 'package:lms/core/utils/styling/text_style.dart';
import 'package:lms/core/widgets/app_text_form_field.dart';
import 'package:lms/core/widgets/spacing_widgets.dart';

class UpdateInfoFields extends StatelessWidget {
  const UpdateInfoFields({
    super.key,
    this.firstNameController,
    this.lastNameController,
    this.phoneController,
    this.emailController,
  });
  final TextEditingController? firstNameController;
  final TextEditingController? lastNameController;
  final TextEditingController? phoneController;
  final TextEditingController? emailController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextFormField(
          controller: firstNameController,
          keyboardType: TextInputType.name,
          inputTextStyle: Styles.style14,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          prefixIcon: const Icon(
            FontAwesomeIcons.user,
            size: 18,
            color: grey,
          ),
        ),
        const HeightSpace(12),
        AppTextFormField(
          controller: lastNameController,
          keyboardType: TextInputType.name,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          inputTextStyle: Styles.style14,
          prefixIcon: const Icon(
            FontAwesomeIcons.user,
            size: 18,
            color: grey,
          ),
        ),
        const HeightSpace(12),
        AppTextFormField(
          enabled: false,
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          inputTextStyle: Styles.style14,
          prefixIcon: const Icon(
            FontAwesomeIcons.envelope,
            size: 18,
            color: grey,
          ),
        ),
        const HeightSpace(12),
        AppTextFormField(
          controller: phoneController,
          keyboardType: TextInputType.phone,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          prefixIcon: const Icon(
            FontAwesomeIcons.phone,
            size: 18,
            color: grey,
          ),
        ),
      ],
    );
  }
}
