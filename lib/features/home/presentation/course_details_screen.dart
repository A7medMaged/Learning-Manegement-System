import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lms/core/utils/styling/app_colors.dart';
import 'package:lms/core/utils/styling/text_style.dart';
import 'package:lms/core/widgets/spacing_widgets.dart';
import 'package:lms/features/home/presentation/manager/course_details_cubit/course_details_cubit.dart';
import 'package:lms/generated/l10n.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CourseDetailsScreen extends StatelessWidget {
  const CourseDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).course_details),
      ),
      body: BlocBuilder<CourseDetailsCubit, CourseDetailsState>(
        builder: (context, state) {
          if (state is CourseDetailsLoading) {
            return Skeletonizer(
              child: Column(
                children: [
                  Card(
                    child: CachedNetworkImage(
                      imageUrl: 'https://placehold.co/600x400',
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                      fit: BoxFit.fill,
                    ),
                  ),
                  const HeightSpace(8),
                  const Text('Title'),
                  const HeightSpace(8),
                  const Text('description'),
                  const HeightSpace(8),
                  const Text('Content'),
                ],
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
                    Text(
                      '${corseDetails.title!}:',
                      style: Styles.style25,
                    ),
                    const HeightSpace(8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: CachedNetworkImage(
                        imageUrl: corseDetails.subject!.icon!,
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                    const HeightSpace(8),
                    Text(
                      '${S.of(context).description}:',
                      style: Styles.style18,
                    ),
                    Text(
                      corseDetails.description!,
                      style: Styles.style14,
                    ),
                    const HeightSpace(8),
                    Text(
                      '${S.of(context).content}:',
                      style: Styles.style18,
                    ),
                    Text(corseDetails.content!),
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
