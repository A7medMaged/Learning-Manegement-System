import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms/core/utils/styling/text_style.dart';
import 'package:lms/core/widgets/app_text_button.dart';
import 'package:lms/core/widgets/spacing_widgets.dart';
import 'package:lms/features/profile/data/models/change_password_models/change_password_request_model.dart';
import 'package:lms/features/profile/presentation/maneger/change_password_cubit/change_password_cubit.dart';
import 'package:lms/features/profile/presentation/widgets/change_password_fileds.dart';
import 'package:toastification/toastification.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late TextEditingController currentPasswordController;
  late TextEditingController newPasswordController;
  late TextEditingController confirmNewPasswordController;

  @override
  void initState() {
    super.initState();
    currentPasswordController = TextEditingController();
    newPasswordController = TextEditingController();
    confirmNewPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmNewPasswordController.dispose();
    super.dispose();
  }

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
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              CahngePasswordFileds(
                currentPasswordController: currentPasswordController,
                newPasswordController: newPasswordController,
                confirmNewPasswordController: confirmNewPasswordController,
              ),
              const HeightSpace(24),
              BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
                listener: (context, state) {
                  if (state is ChangePasswordSuccess) {
                    toastification.show(
                      context: context,
                      dismissDirection: DismissDirection.up,
                      autoCloseDuration: const Duration(seconds: 4),
                      title: const Text('Success'),
                      description: const Text('Password changed successfully'),
                      type: ToastificationType.success,
                      style: ToastificationStyle.minimal,
                    );
                    Navigator.of(context).pop();
                  } else if (state is ChangePasswordFailure) {
                    toastification.show(
                      context: context,
                      dismissDirection: DismissDirection.up,
                      autoCloseDuration: const Duration(seconds: 4),
                      title: const Text('Change Password Failed'),
                      description: Text(state.errorMessage),
                      type: ToastificationType.error,
                      style: ToastificationStyle.minimal,
                    );
                  }
                },
                builder: (context, state) {
                  return AppTextButton(
                    text: 'Save Changes',
                    isLoading: state is ChangePasswordLoading ? true : false,
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        final ChangePasswordRequestModel changePasswordRequest =
                            ChangePasswordRequestModel(
                              currentPassword: currentPasswordController.text
                                  .trim(),
                              newPassword: newPasswordController.text.trim(),
                            );
                        context.read<ChangePasswordCubit>().changePassword(
                          changePasswordRequest,
                        );
                      }
                    },
                    width: double.infinity,
                    textStyle: Styles.style18.copyWith(color: Colors.white),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
