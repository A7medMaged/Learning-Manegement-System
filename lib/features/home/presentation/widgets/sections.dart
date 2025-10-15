import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms/core/utils/styling/app_colors.dart';
import 'package:lms/core/utils/styling/text_style.dart';
import 'package:lms/core/widgets/spacing_widgets.dart';
import 'package:lms/features/profile/presentation/maneger/user_cubit/user_cubit.dart';
import 'package:lms/features/home/presentation/widgets/acount.dart';
import 'package:lms/features/home/presentation/widgets/personal_info.dart';
import 'package:skeletonizer/skeletonizer.dart';

class Sections extends StatelessWidget {
  const Sections({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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

                return CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.transparent,
                  child: ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: state is UserLoaded
                          ? state.userModel.data?.avatar ??
                                'https://www.pngall.com/wp-content/uploads/5/Profile-PNG-File.png'
                          : 'https://www.pngall.com/wp-content/uploads/5/Profile-PNG-File.png',
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
          const HeightSpace(12),
          Text(
            'Personal Information',
            style: Styles.style18Bold,
          ),
          const HeightSpace(16),
          const PersonalInfo(),
          const HeightSpace(24),
          Text(
            'Account',
            style: Styles.style18Bold,
          ),
          const HeightSpace(12),
          const Account(),
        ],
      ),
    );
  }
}
