import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lms/core/routes/app_routes.dart';
import 'package:lms/core/utils/styling/app_colors.dart';
import 'package:lms/core/utils/styling/text_style.dart';
import 'package:lms/core/widgets/app_text_button.dart';
import 'package:lms/core/widgets/language_switcher.dart';
import 'package:lms/core/widgets/spacing_widgets.dart';
import 'package:lms/features/auth/data/models/register_models/register_request_model.dart';
import 'package:lms/features/auth/presentation/maneger/register_cubit/register_cubit.dart';
import 'package:lms/features/auth/presentation/widgets/already_have_an_account.dart';
import 'package:lms/features/auth/presentation/widgets/register_fields.dart';
import 'package:lms/features/auth/presentation/widgets/pick_avatar.dart';
import 'package:lms/generated/l10n.dart';
import 'package:toastification/toastification.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController cityIdController = TextEditingController();

  File? _selectedAvatarFile;

  void _updateAvatar(File? file) {
    setState(() {
      _selectedAvatarFile = file;
    });
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    cityIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const LanguageSwitcher(
                    color: mainColor,
                  ),
                  Center(
                    child: Text(
                      S.of(context).register_a_new_account,
                      style: Styles.style25Bold,
                    ),
                  ),
                  const HeightSpace(20),
                  Text(
                    S.of(context).welcome_register,
                    style: Styles.style18.copyWith(
                      color: grey,
                    ),
                  ),
                  const HeightSpace(18),
                  Center(
                    child: PickAvatar(onFilePicked: _updateAvatar),
                  ),
                  const HeightSpace(18),
                  RegisterFields(
                    firstName: firstNameController,
                    lastName: lastNameController,
                    phoneNumber: phoneController,
                    emailController: emailController,
                    passwordController: passwordController,
                    confirmPasswordController: confirmPasswordController,
                    cityIdController: cityIdController,
                  ),
                  const HeightSpace(28),
                  BlocConsumer<RegisterCubit, RegisterState>(
                    listener: (context, state) {
                      if (state is RegisterSuccess) {
                        final email = emailController.text.trim();
                        toastification.show(
                          context: context,
                          dismissDirection: DismissDirection.up,
                          autoCloseDuration: const Duration(seconds: 4),
                          title: Text(S.of(context).registration_successful),
                          description: Text(
                            state.registerResponseModel.message!,
                          ),
                          type: ToastificationType.success,
                          style: ToastificationStyle.minimal,
                        );
                        context.push(
                          AppRoutes.otpVerificationRoute,
                          extra: {'email': email},
                        );
                      } else if (state is RegisterFailure) {
                        toastification.show(
                          context: context,
                          dismissDirection: DismissDirection.up,
                          autoCloseDuration: const Duration(seconds: 4),
                          title: Text(S.of(context).registration_failed),
                          description: Text(
                            state.errorMessage,
                          ),
                          style: ToastificationStyle.minimal,
                          type: ToastificationType.error,
                        );
                      }
                    },
                    builder: (context, state) {
                      return AppTextButton(
                        text: S.of(context).register,
                        isLoading: state is RegisterLoading,
                        width: double.infinity,
                        textStyle: Styles.style18Bold.copyWith(
                          color: white,
                        ),
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            final cityId = int.tryParse(
                              cityIdController.text.trim(),
                            );
                            if (cityId == null) {
                              toastification.show(
                                context: context,
                                dismissDirection: DismissDirection.up,
                                autoCloseDuration: const Duration(seconds: 4),
                                title: Text(S.of(context).registration_failed),
                                description: Text(
                                  S.of(context).please_enter_valid_city,
                                ),
                                type: ToastificationType.error,
                                style: ToastificationStyle.minimal,
                              );
                              return;
                            }

                            final registerRequest = RegisterRequestModel(
                              firstName: firstNameController.text.trim(),
                              lastName: lastNameController.text.trim(),
                              phoneNumber: phoneController.text.trim(),
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                              avatar: _selectedAvatarFile,
                              cityId: cityId,
                            );
                            context.read<RegisterCubit>().registerUsers(
                              registerRequest,
                            );
                          }
                        },
                      );
                    },
                  ),
                  const HeightSpace(8),
                  const Center(
                    child: AlreadyHaveAnAccount(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
