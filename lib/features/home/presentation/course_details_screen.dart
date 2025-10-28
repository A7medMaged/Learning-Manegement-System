import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lms/core/utils/styling/app_colors.dart';
import 'package:lms/core/utils/styling/text_style.dart';
import 'package:lms/core/widgets/spacing_widgets.dart';
import 'package:lms/features/home/presentation/manager/course_details_cubit/course_details_cubit.dart';
import 'package:lms/features/home/presentation/widgets/course_details.dart';
import 'package:lms/features/home/presentation/widgets/cousre_subject.dart';
import 'package:lms/generated/l10n.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CourseDetailsScreen extends StatelessWidget {
  const CourseDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(S.of(context).course_details),
      ),
      body: BlocBuilder<CourseDetailsCubit, CourseDetailsState>(
        builder: (context, state) {
          if (state is CourseDetailsLoading) {
            return const Skeletonizer(
              effect: ShimmerEffect(),
              child: CourseDetails(
                title: 'corseDetails.title!',
                imageUrl: 'corseDetails.subject!.icon!',
                description: 'corseDetails.description!',
                content: 'corseDetails.content!',
              ),
            );
          } else if (state is CourseDetailsError) {
            return Center(
              child: Row(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    // ignore: deprecated_member_use
                    FontAwesomeIcons.warning,
                    color: red,
                  ),
                  Text(
                    state.errorMessage,
                    style: Styles.style18Bold.copyWith(
                      color: red,
                    ),
                  ),
                ],
              ),
            );
          } else if (state is CourseDetailsLoaded) {
            final corseDetails = state.courseDetailsModel.data!;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CourseDetails(
                      title: corseDetails.title!,
                      imageUrl: corseDetails.subject!.icon!,
                      description: corseDetails.description!,
                      content: corseDetails.content!,
                    ),
                    const HeightSpace(16),
                    Text(
                      '${S.of(context).subject}:',
                      style: Styles.style18,
                    ),
                    CousreSubject(
                      name: corseDetails.subject!.name!,
                      description: corseDetails.subject!.description!,
                      price: corseDetails.subject!.defaultPrice!.toString(),
                    ),
                  ],
                ),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
