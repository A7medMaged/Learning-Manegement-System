import 'package:flutter/material.dart';
import 'package:lms/core/utils/styling/app_colors.dart';
import 'package:lms/features/home/presentation/widgets/list_tile_widget.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTileWidget(
          title: 'Update Information',
          trailingIcon: Icons.person,
          onTap: () {},
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
