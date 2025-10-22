// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lms/core/api/dio_factory.dart';
import 'package:lms/core/routes/app_routes.dart';
import 'package:lms/core/utils/shared_pref_helper.dart';
import 'package:lms/core/utils/styling/app_assets.dart';
import 'package:lms/core/utils/styling/app_colors.dart';
import 'package:lms/core/utils/styling/text_style.dart';
import 'package:lms/core/widgets/app_text_button.dart';
import 'package:lms/features/home/presentation/widgets/list_tile_widget.dart';
import 'package:lms/features/profile/presentation/maneger/user_cubit/user_cubit.dart';
import 'package:lms/features/translation/cubit/local_cubit.dart';
import 'package:lms/generated/l10n.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTileWidget(
          title: S.of(context).update_information,
          trailingIcon: Icons.person,
          onTap: () {
            context.push(AppRoutes.updateInfoRoute).then((value) {
              // ignore: use_build_context_synchronously
              context.read<UserCubit>().getUserData();
            });
          },
        ),
        ListTileWidget(
          title: S.of(context).change_password,
          trailingIcon: Icons.lock_outline,
          onTap: () {
            context.push(AppRoutes.cahngePasswordRoute);
          },
        ),
        ListTileWidget(
          title: S.of(context).language,
          trailingIcon: Icons.translate,
          onTap: () {
            showModalBottomSheet(
              context: context,
              backgroundColor: white,
              builder: (context) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Builder(
                      builder: (context) {
                        final currentLocale = context
                            .watch<LocaleCubit>()
                            .state;
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(
                                vertical: 12,
                              ),
                              height: 4,
                              width: 40,
                              decoration: BoxDecoration(
                                color: grey.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            RadioListTile<Locale>(
                              title: Text(S.of(context).english),
                              secondary: Image.asset(
                                AppAssets.en,
                                height: 24,
                                width: 24,
                              ),
                              value: const Locale('en'),
                              groupValue: currentLocale,
                              onChanged: (Locale? value) {
                                if (value == null) return;
                                context.read<LocaleCubit>().setLocale(value);
                                Navigator.pop(context);
                              },
                            ),
                            RadioListTile<Locale>(
                              title: Text(S.of(context).arabic),
                              secondary: Image.asset(
                                AppAssets.ar,
                                height: 24,
                                width: 24,
                              ),
                              value: const Locale('ar'),
                              groupValue: currentLocale,
                              onChanged: (Locale? value) {
                                if (value == null) return;
                                context.read<LocaleCubit>().setLocale(value);
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                );
              },
            );
          },
        ),
        ListTileWidget(
          title: S.of(context).logout,
          iconColor: red,
          backgroundColor: Colors.red.shade200,
          trailingIcon: Icons.logout,
          onTap: () {
            showAdaptiveDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text(S.of(context).logout),
                  content: Text(S.of(context).are_you_sure_you_want_to_logout),
                  actions: [
                    AppTextButton(
                      width: 100,
                      text: S.of(context).no,
                      color: white,
                      textStyle: Styles.style14.copyWith(
                        color: black,
                      ),
                      onTap: () => context.pop(),
                    ),
                    SizedBox(
                      width: 125,
                      child: AppTextButton(
                        text: S.of(context).logout,
                        color: red,
                        textStyle: Styles.style14.copyWith(
                          color: white,
                        ),
                        onTap: () async {
                          SharedPrefHelper.clearAllSecuredData();
                          DioFactory.removeDioHeaders();
                          context.go(
                            AppRoutes.loginRoute,
                          );
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
