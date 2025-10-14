import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lms/core/routes/app_routes.dart';
import 'package:lms/core/utils/styling/text_style.dart';
import 'package:lms/core/widgets/app_text_button.dart';
import 'package:lms/core/widgets/spacing_widgets.dart';
import 'package:lms/features/auth/data/models/register_models/register_request_model.dart';
import 'package:lms/features/auth/presentation/maneger/cubit/register_cubit.dart';
import 'package:lms/features/auth/presentation/widgets/already_have_an_account.dart';
import 'package:lms/features/auth/presentation/widgets/register_fields.dart';
import 'package:lms/features/auth/presentation/widgets/pick_avatar.dart';

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

  XFile? _selectedAvatarFile;

  void _updateAvatar(XFile? file) {
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
                children: [
                  Text(
                    'Register Screen',
                    style: Styles.style25,
                  ),
                  const HeightSpace(20),
                  Text(
                    '👋 Welcome!\n Create your account to get started with our app.',
                    style: Styles.style18Bold,
                  ),
                  const HeightSpace(18),
                  PickAvatar(onFilePicked: _updateAvatar),
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
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Registration Successful'),
                          ),
                        );
                        context.pushReplacement(AppRoutes.loginRoute);
                      } else if (state is RegisterFailure) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Registration Failed: ${state.errorMessage}',
                            ),
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      return AppTextButton(
                        text: 'Register',
                        isLoading: state is RegisterLoading,
                        width: double.infinity,
                        textStyle: Styles.style18Bold,
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            final registerRequest = RegistrerRequestModel(
                              firstName: firstNameController.text.trim(),
                              lastName: lastNameController.text.trim(),
                              phoneNumber: phoneController.text.trim(),
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                              avatar: _selectedAvatarFile?.path,
                              cityId: int.tryParse(
                                cityIdController.text.trim(),
                              )!,
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
                  const AlreadyHaveAnAccount(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
