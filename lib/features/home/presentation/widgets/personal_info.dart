import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms/core/utils/styling/text_style.dart';
import 'package:lms/features/profile/presentation/maneger/user_cubit/user_cubit.dart';
import 'package:lms/features/home/presentation/widgets/info_list_tile.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state is UserLoading) {
          return Skeletonizer(
            effect: const ShimmerEffect(),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Column(
                children: [
                  InfoListTile(
                    title: 'Name',
                    subtitle: 'Ahmed Maged',
                  ),
                  InfoListTile(
                    title: 'Email',
                    subtitle: 'ahmedmahmoud.work0@gmail.com',
                  ),
                  InfoListTile(
                    title: 'Phone Number',
                    subtitle: '01154660193',
                  ),
                  InfoListTile(
                    title: 'City Id',
                    subtitle: '17',
                  ),
                ],
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
        } else {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                InfoListTile(
                  title: 'Name',
                  subtitle:
                      '${state is UserLoaded ? state.userModel.data!.fullName : ''}',
                ),
                InfoListTile(
                  title: 'Email',
                  subtitle:
                      '${state is UserLoaded ? state.userModel.data!.email : ''}',
                ),
                InfoListTile(
                  title: 'Phone Number',
                  subtitle:
                      '${state is UserLoaded ? state.userModel.data!.phoneNumber : ''}',
                ),
                InfoListTile(
                  title: 'City Id',
                  subtitle:
                      '${state is UserLoaded ? state.userModel.data!.cityId : ''}',
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
