import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lms/core/routes/app_routes.dart';
import 'package:lms/core/utils/styling/text_style.dart';
import 'package:lms/core/widgets/app_text_button.dart';
import 'package:lms/core/widgets/spacing_widgets.dart';
import 'package:lms/features/home/presentation/manager/cubit/courses_cubit.dart';
import 'package:lms/features/home/presentation/widgets/courses_card.dart';
import 'package:lms/generated/l10n.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<void> _onRefresh(BuildContext context) async {
    final cubit = context.read<CoursesCubit>();
    // Replace `fetchCourses` with your cubit's refresh method name if different.
    cubit.fetchCourses();
    // Wait until loading finishes (so RefreshIndicator hides when done).
    await cubit.stream.firstWhere((state) => state is! CoursesLoading);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                S.of(context).subscribe_to_new_courses,
                style: Styles.style18,
              ),
              AppTextButton(
                text: S.of(context).see_all,
                textStyle: Styles.style18,
                onTap: () {},
              ),
            ],
          ),
          const HeightSpace(8),
          Expanded(
            child: BlocBuilder<CoursesCubit, CoursesState>(
              builder: (context, state) {
                if (state is CoursesLoading) {
                  return ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return const Skeletonizer(
                        effect: ShimmerEffect(),
                        child: CoursesCard(
                          title: 'tamisium appono calcar',
                          imageUrl: 'https://placehold.co/800x800',
                          description:
                              'Consequuntur averto decet. Vos admoveo tamen tonsor verbera. Aliqua casus deputo acquiro custodia crinis bellicus neque commemoro.',
                        ),
                      );
                    },
                  );
                } else if (state is CoursesError) {
                  return RefreshIndicator(
                    onRefresh: () => _onRefresh(context),
                    child: Center(
                      child: Text(
                        state.errorMessage,
                        style: Styles.style16,
                      ),
                    ),
                  );
                } else if (state is CoursesLoaded) {
                  final courses = state.coursesModel.data!;
                  return RefreshIndicator(
                    onRefresh: () => _onRefresh(context),
                    child: ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: courses.length,
                      itemBuilder: (context, index) {
                        final course = courses[index];
                        return CoursesCard(
                          onTap: () =>
                              context.push(AppRoutes.courseDetailsRoute),
                          title: course.title!,
                          imageUrl: course.subject!.icon!,
                          description: course.description!,
                        );
                      },
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}
