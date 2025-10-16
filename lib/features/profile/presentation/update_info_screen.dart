import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms/core/utils/styling/text_style.dart';
import 'package:lms/core/widgets/app_text_button.dart';
import 'package:lms/core/widgets/spacing_widgets.dart';
import 'package:lms/features/profile/data/models/update_info_models/update_info_request_model.dart';
import 'package:lms/features/profile/presentation/maneger/update_info_cubit/update_info_cubit.dart';
import 'package:lms/features/profile/presentation/maneger/user_cubit/user_cubit.dart';
import 'package:lms/features/profile/presentation/widgets/update_info_fields.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:toastification/toastification.dart';

class UpdateInfoScreen extends StatefulWidget {
  const UpdateInfoScreen({super.key});

  @override
  State<UpdateInfoScreen> createState() => _UpdateInfoScreenState();
}

class _UpdateInfoScreenState extends State<UpdateInfoScreen> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController phoneController;
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    phoneController = TextEditingController();
    emailController = TextEditingController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final userCubit = context.read<UserCubit>();
      final userState = userCubit.state;

      if (userState is UserLoaded) {
        _fillFields(userState);
      } else {
        userCubit.getUserData();
      }
    });
  }

  void _fillFields(UserLoaded state) {
    setState(() {
      firstNameController.text = state.userModel.data?.firstName ?? '';
      lastNameController.text = state.userModel.data?.lastName ?? '';
      phoneController.text = state.userModel.data?.phoneNumber ?? '';
      emailController.text = state.userModel.data?.email ?? '';
    });
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Information', style: Styles.style18),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: BlocListener<UserCubit, UserState>(
          listener: (context, state) {
            if (state is UserLoaded) {
              _fillFields(state);
            }
          },
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Update your information', style: Styles.style18),
                const HeightSpace(8),
                BlocBuilder<UserCubit, UserState>(
                  builder: (context, state) {
                    if (state is UserLoading) {
                      return Skeletonizer(
                        effect: const ShimmerEffect(),
                        child: UpdateInfoFields(
                          emailController: TextEditingController(
                            text: 'am7449495@gmail.com',
                          ),
                          phoneController: TextEditingController(
                            text: '01091461410',
                          ),
                          firstNameController: TextEditingController(
                            text: 'Ahmed',
                          ),
                          lastNameController: TextEditingController(
                            text: 'Maged',
                          ),
                        ),
                      );
                    } else if (state is UserError) {
                      return Center(
                        child: Text(
                          state.errorMessage,
                          style: Styles.style16.copyWith(color: Colors.red),
                        ),
                      );
                    } else {
                      return UpdateInfoFields(
                        emailController: emailController,
                        phoneController: phoneController,
                        firstNameController: firstNameController,
                        lastNameController: lastNameController,
                      );
                    }
                  },
                ),
                const HeightSpace(24),
                BlocConsumer<UpdateInfoCubit, UpdateInfoState>(
                  listener: (context, state) {
                    if (state is UpdateInfoError) {
                      toastification.show(
                        context: context,
                        title: const Text('Update Failed'),
                        description: Text(state.errorMessage),
                        type: ToastificationType.error,
                        style: ToastificationStyle.minimal,
                      );
                    } else if (state is UpdateInfoLoaded) {
                      toastification.show(
                        context: context,
                        title: const Text('Success'),
                        description: const Text(
                          'Information updated successfully',
                        ),
                        type: ToastificationType.success,
                        style: ToastificationStyle.minimal,
                      );
                      context.read<UserCubit>().getUserData();
                    }
                  },
                  builder: (context, state) {
                    return AppTextButton(
                      width: double.infinity,
                      text: 'Update',
                      isLoading: state is UpdateInfoLoading,
                      textStyle: Styles.style18.copyWith(color: Colors.white),
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          final updateInfoRequest = UpdateInfoRequestModel(
                            firstName: firstNameController.text.trim(),
                            lastName: lastNameController.text.trim(),
                            phoneNumber: phoneController.text.trim(),
                            email: emailController.text.trim(),
                          );
                          context.read<UpdateInfoCubit>().updateUserInfo(
                            updateInfoRequest,
                          );
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
