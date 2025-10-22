import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lms/core/utils/styling/app_colors.dart';
import 'package:lms/core/utils/styling/text_style.dart';
import 'package:lms/core/widgets/spacing_widgets.dart';
import 'package:lms/features/profile/presentation/maneger/change_avatar_cubit/change_avatar_cubit.dart';
import 'package:lms/features/profile/presentation/maneger/user_cubit/user_cubit.dart';
import 'package:lms/core/utils/di.dart';
import 'package:lms/features/main/presentation/widgets/account.dart';
import 'package:lms/features/main/presentation/widgets/personal_info.dart';
import 'package:lms/generated/l10n.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:toastification/toastification.dart';

class Sections extends StatelessWidget {
  const Sections({super.key});

  @override
  Widget build(BuildContext context) {
    // Helper that ensures a ChangeAvatarCubit is available to the child.
    Widget withChangeAvatarProvider(Widget child) {
      try {
        // If a cubit exists above, reuse it.
        final existing = context.read<ChangeAvatarCubit>();
        return BlocProvider.value(value: existing, child: child);
      } catch (_) {
        // Otherwise create it from getIt.
        return BlocProvider(
          create: (_) => getIt<ChangeAvatarCubit>(),
          child: child,
        );
      }
    }

    return SingleChildScrollView(
      child: withChangeAvatarProvider(
        BlocConsumer<ChangeAvatarCubit, ChangeAvatarState>(
          listener: (context, state) {
            if (state is ChangeAvatarSuccess) {
              toastification.show(
                context: context,
                dismissDirection: DismissDirection.up,
                autoCloseDuration: const Duration(seconds: 4),
                title: Text(S.of(context).avatar_change_successful),
                description: Text(state.changeAvatarResponseModel.message!),
                type: ToastificationType.success,
                style: ToastificationStyle.minimal,
              );
              context.read<UserCubit>().getUserData();
            } else if (state is ChangeAvatarFailure) {
              toastification.show(
                context: context,
                dismissDirection: DismissDirection.up,
                autoCloseDuration: const Duration(seconds: 4),
                title: Text(S.of(context).error_changing_avatar),
                description: Text(state.errorMessage),
                type: ToastificationType.error,
                style: ToastificationStyle.minimal,
              );
            }
          },
          builder: (context, avatarState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: BlocBuilder<UserCubit, UserState>(
                    builder: (context, state) {
                      if (state is UserLoading) {
                        return const Skeletonizer(
                          effect: ShimmerEffect(),
                          child: Center(
                            child: CircleAvatar(
                              backgroundColor: grey,
                              radius: 70,
                            ),
                          ),
                        );
                      }
                      if (state is UserError) {
                        return Center(
                          child: Text(
                            state.errorMessage,
                            style: Styles.style18,
                          ),
                        );
                      }

                      final avatarUrl = state is UserLoaded
                          ? state.userModel.data?.avatar ??
                                'https://www.pngall.com/wp-content/uploads/5/Profile-PNG-File.png'
                          : 'https://www.pngall.com/wp-content/uploads/5/Profile-PNG-File.png';

                      return Column(
                        children: [
                          CircleAvatar(
                            radius: 70,
                            backgroundColor: Colors.transparent,
                            child: ClipOval(
                              child: CachedNetworkImage(
                                imageUrl: avatarUrl,
                                height: 100,
                                width: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: avatarState is ChangeAvatarLoading
                                ? null
                                : () async {
                                    final picker = ImagePicker();
                                    final picked = await picker.pickImage(
                                      source: ImageSource.gallery,
                                    );
                                    if (picked != null) {
                                      // ignore: use_build_context_synchronously
                                      context
                                          .read<ChangeAvatarCubit>()
                                          .changeAvatar(
                                            File(picked.path),
                                          );
                                    }
                                  },
                            child: avatarState is ChangeAvatarLoading
                                ? Text(
                                    S.of(context).avatar_changing,
                                    style: Styles.style16.copyWith(
                                      color: mainColor,
                                    ),
                                  )
                                : Text(
                                    S.of(context).change_avatar,
                                    style: Styles.style16.copyWith(
                                      color: mainColor,
                                    ),
                                  ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                const HeightSpace(12),
                Text(
                  S.of(context).personal_info,
                  style: Styles.style18Bold,
                ),
                const HeightSpace(16),
                const PersonalInfo(),
                const HeightSpace(24),
                Text(
                  S.of(context).account,
                  style: Styles.style18Bold,
                ),
                const HeightSpace(12),
                const Account(),
              ],
            );
          },
        ),
      ),
    );
  }
}
