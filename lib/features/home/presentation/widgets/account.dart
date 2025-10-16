import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lms/core/routes/app_routes.dart';
import 'package:lms/core/utils/di.dart';
import 'package:lms/core/utils/storage_helper.dart';
import 'package:lms/core/utils/styling/app_colors.dart';
import 'package:lms/core/utils/styling/text_style.dart';
import 'package:lms/core/widgets/app_text_button.dart';
import 'package:lms/features/home/presentation/widgets/list_tile_widget.dart';
import 'package:lms/features/profile/presentation/maneger/user_cubit/user_cubit.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTileWidget(
          title: 'Update Information',
          trailingIcon: Icons.person,
          onTap: () {
            context.push(AppRoutes.updateInfoRoute).then((value) {
              // ignore: use_build_context_synchronously
              context.read<UserCubit>().getUserData();
            });
          },
        ),
        ListTileWidget(
          title: 'Change Password',
          trailingIcon: Icons.lock_outline,
          onTap: () {},
        ),
        ListTileWidget(
          title: 'Langauge',
          trailingIcon: Icons.translate,
          onTap: () {},
        ),
        ListTileWidget(
          title: 'Logout',
          iconColor: red,
          backgroundColor: Colors.red.shade200,
          trailingIcon: Icons.logout,
          onTap: () {
            showAdaptiveDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("Log Out"),
                  content: const Text("Are you sure you want to log out?"),
                  actions: [
                    AppTextButton(
                      width: 100,
                      text: 'No',
                      color: white,
                      textStyle: Styles.style14.copyWith(
                        color: black,
                      ),
                      onTap: () => context.pop(),
                    ),
                    SizedBox(
                      width: 125,
                      child: AppTextButton(
                        text: 'Log Out',
                        color: red,
                        textStyle: Styles.style14.copyWith(
                          color: white,
                        ),
                        onTap: () async {
                          getIt<StorageHelper>().deleteUserToken();
                          context.pushReplacement(AppRoutes.loginRoute);
                        },
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ],
    );
  }
}
