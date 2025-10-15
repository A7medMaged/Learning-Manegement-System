import 'package:flutter/material.dart';
import 'package:lms/core/utils/styling/text_style.dart';
import 'package:lms/core/widgets/app_text_button.dart';
import 'package:lms/core/widgets/spacing_widgets.dart';
import 'package:lms/features/profile/presentation/widgets/update_info_fields.dart';

class UpdateInfoScreen extends StatelessWidget {
  const UpdateInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Update Information',
          style: Styles.style18,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Update your information',
                style: Styles.style18,
              ),
              const HeightSpace(8),
              UpdateInfoFields(
                emailController: TextEditingController(
                  text: 'a7449495@gmail.com',
                ),
                phoneController: TextEditingController(
                  text: '01012345678',
                ),
                firstNameController: TextEditingController(
                  text: 'Ahmed',
                ),
                lastNameController: TextEditingController(
                  text: 'Maged',
                ),
              ),
              const HeightSpace(24),
              AppTextButton(
                width: double.infinity,
                text: 'Update',
                textStyle: Styles.style18.copyWith(color: Colors.white),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
