import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:lms/core/routes/app_routes.dart';
import 'package:lms/core/utils/styling/app_assets.dart';
import 'package:lms/core/utils/styling/app_colors.dart';
import 'package:lms/core/utils/styling/text_style.dart';
import 'package:lms/core/widgets/spacing_widgets.dart';
import 'package:lms/features/profile/presentation/maneger/user_cubit/user_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Column(
            children: [
              BlocBuilder<UserCubit, UserState>(
                builder: (context, state) {
                  if (state is UserLoading) {
                    return const Skeletonizer(
                      effect: ShimmerEffect(),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: grey,
                            radius: 25,
                          ),
                          WidthSpace(12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Welcome',
                              ),
                              Text(
                                'Ahmed Maged',
                              ),
                            ],
                          ),
                        ],
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
                    return Row(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.transparent,
                          child: ClipOval(
                            child: CachedNetworkImage(
                              imageUrl: state is UserLoaded
                                  ? state.userModel.data?.avatar ??
                                        AppAssets.avatar
                                  : AppAssets.avatar,
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const WidthSpace(12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Welcome',
                              style: Styles.style18,
                            ),
                            Text(
                              '${state is UserLoaded ? state.userModel.data!.fullName : 'User'}!',
                              style: Styles.style18,
                            ),
                          ],
                        ),
                        const Spacer(),
                        IconButton(
                          icon: const Icon(
                            FontAwesomeIcons.gear,
                            size: 24,
                          ),
                          onPressed: () {
                            context.push(AppRoutes.settingsRoute);
                          },
                        ),
                      ],
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
