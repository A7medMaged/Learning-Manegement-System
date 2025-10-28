// ignore_for_file: deprecated_member_use

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms/core/utils/di.dart';
import 'package:lms/core/utils/styling/app_colors.dart';
import 'package:lms/core/utils/styling/text_style.dart';
import 'package:lms/core/widgets/spacing_widgets.dart';
import 'package:lms/features/home/presentation/home_screen.dart';
import 'package:lms/features/home/presentation/manager/cubit/courses_cubit.dart';
import 'package:lms/features/main/presentation/settings_screen.dart';
import 'package:lms/features/profile/presentation/maneger/user_cubit/user_cubit.dart';
import 'package:lms/generated/l10n.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final double displayWidth = MediaQuery.of(context).size.width;
    final double displayHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: displayHeight * 0.15),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              child: listOfWidgets[currentIndex],
            ),
          ),
          Container(
            width: double.infinity,
            height: displayHeight * 0.15,
            padding: EdgeInsets.symmetric(
              vertical: displayWidth * .1,
              horizontal: displayWidth * .05,
            ),
            decoration: BoxDecoration(
              color: mainColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(displayWidth * .1),
                bottomRight: Radius.circular(displayWidth * .1),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const MainData(),
          ),
        ],
      ),

      bottomNavigationBar: Container(
        margin: EdgeInsets.all(displayWidth * .05),
        height: displayWidth * .155,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              blurRadius: 30,
              offset: const Offset(0, 10),
            ),
          ],
          borderRadius: BorderRadius.circular(50),
        ),
        child: ListView.builder(
          itemCount: listOfIcons.length,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: displayWidth * .02),
          itemBuilder: (context, index) {
            final bool isActive = index == currentIndex;

            return InkWell(
              onTap: () {
                setState(() {
                  currentIndex = index;
                  HapticFeedback.lightImpact();
                });
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastLinearToSlowEaseIn,
                    width: isActive ? displayWidth * .32 : displayWidth * .18,
                    alignment: Alignment.center,
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      curve: Curves.fastLinearToSlowEaseIn,
                      height: isActive ? displayWidth * .12 : 0,
                      width: isActive ? displayWidth * .32 : 0,
                      decoration: BoxDecoration(
                        color: isActive
                            ? mainColor.withOpacity(0.2)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastLinearToSlowEaseIn,
                    width: isActive ? displayWidth * .31 : displayWidth * .18,
                    alignment: Alignment.center,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Row(
                          children: [
                            AnimatedContainer(
                              duration: const Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn,
                              width: isActive ? displayWidth * .13 : 0,
                            ),
                            AnimatedOpacity(
                              opacity: isActive ? 1 : 0,
                              duration: const Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn,
                              child: Text(
                                isActive ? listOfStrings[index] : '',
                                style: Styles.style12.copyWith(
                                  color: mainColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            AnimatedContainer(
                              duration: const Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn,
                              width: isActive ? displayWidth * .03 : 20,
                            ),
                            Icon(
                              listOfIcons[index],
                              size: displayWidth * .076,
                              color: isActive
                                  ? mainColor
                                  : black.withOpacity(0.5),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  List<IconData> listOfIcons = [
    Icons.home_rounded,
    Icons.subscriptions_rounded,
    Icons.chat,
    Icons.person_rounded,
  ];

  List<String> get listOfStrings => [
    S.of(context).home,
    S.of(context).subscribtion,
    S.of(context).chat,
    S.of(context).profile,
  ];

  List<Widget> listOfWidgets = [
    BlocProvider(
      create: (context) => getIt<CoursesCubit>()..fetchCourses(),
      child: const HomeScreen(),
    ),
    const Center(child: Text('Subscriptions Screen')),
    const Center(child: Text('Chat Screen')),
    const SettingsScreen(),
  ];
}

class MainData extends StatelessWidget {
  const MainData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state is UserLoading) {
          return Skeletonizer(
            effect: const ShimmerEffect(),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.transparent,
                  child: ClipOval(
                    child: CircleAvatar(
                      radius: 25,
                    ),
                  ),
                ),
                const WidthSpace(8),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).welcome,
                      style: Styles.style16,
                    ),
                    Text(
                      'name',
                      style: Styles.style16,
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
          final avatarUrl = state is UserLoaded
              ? state.userModel.data!.avatar ??
                    'https://www.pngall.com/wp-content/uploads/5/Profile-PNG-File.png'
              : 'https://www.pngall.com/wp-content/uploads/5/Profile-PNG-File.png';
          final name = state is UserLoaded
              ? state.userModel.data!.fullName ?? ' '
              : ' ';
          return Row(
            children: [
              CircleAvatar(
                radius: 25,
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
              const WidthSpace(8),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).welcome,
                    style: Styles.style16,
                  ),
                  Text(
                    name,
                    style: Styles.style16,
                  ),
                ],
              ),
            ],
          );
        }
      },
    );
  }
}
