import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lms/core/routes/app_routes.dart';
import 'package:lms/core/utils/styling/app_colors.dart';
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
          onTap: () {},
        ),
      ],
    );
  }
}
