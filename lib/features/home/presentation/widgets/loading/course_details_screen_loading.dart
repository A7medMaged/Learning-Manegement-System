import 'package:flutter/material.dart';
import 'package:lms/core/widgets/spacing_widgets.dart';
import 'package:lms/features/home/presentation/widgets/course_details.dart';
import 'package:lms/features/home/presentation/widgets/course_sections_list_tile.dart';
import 'package:lms/features/home/presentation/widgets/cousre_subject.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CourseDetailsScreenLoading extends StatelessWidget {
  const CourseDetailsScreenLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      effect: const ShimmerEffect(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const CourseDetails(
            title: 'corseDetails.title!',
            imageUrl: 'corseDetails.subject!.icon!',
            description: 'corseDetails.description!',
            content: 'corseDetails.content!',
          ),
          const HeightSpace(8),
          const CousreSubject(
            name: 'corseDetails.subject!.name!',
            description: 'corseDetails.subject!.description!',
            price: 'corseDetails.subject!.defaultPrice!.toString()',
          ),
          const HeightSpace(8),
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '{S.of(context).sections}:',
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return CourseSectionsListTile(
                      onTap: () {},
                      title: 'corseDetails.sections![index].title!',
                      subTitle:
                          'corseDetails.sections![index].count!.lectures!.toString()',
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
