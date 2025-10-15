import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lms/core/utils/styling/app_colors.dart';
import 'package:lms/core/utils/styling/text_style.dart';
import 'package:lms/core/widgets/app_text_form_field.dart';
import 'package:lms/core/widgets/spacing_widgets.dart';

class UpdateInfoFields extends StatefulWidget {
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
  State<UpdateInfoFields> createState() => _UpdateInfoFieldsState();
}

class _UpdateInfoFieldsState extends State<UpdateInfoFields> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextFormField(
          controller: widget.firstNameController,
          keyboardType: TextInputType.name,
          inputTextStyle: Styles.style14,
          prefixIcon: const Icon(
            FontAwesomeIcons.user,
            size: 18,
            color: grey,
          ),
        ),
        const HeightSpace(12),
        AppTextFormField(
          controller: widget.lastNameController,
          keyboardType: TextInputType.name,
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
          controller: widget.emailController,
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
          controller: widget.phoneController,
          keyboardType: TextInputType.phone,
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
