import 'package:flutter/material.dart';
import 'package:lms/core/utils/styling/text_style.dart';
import 'package:lms/core/widgets/app_text_button.dart';
import 'package:lms/core/widgets/spacing_widgets.dart';
import 'package:lms/features/profile/presentation/widgets/cahnge_password_fileds.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Password'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            const CahngePasswordFileds(),
            const HeightSpace(24),
            AppTextButton(
              text: 'Save Changes',
              onTap: () {},
              width: double.infinity,
              textStyle: Styles.style18.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
