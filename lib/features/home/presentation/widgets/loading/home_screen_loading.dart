import 'package:flutter/material.dart';
import 'package:lms/features/home/presentation/widgets/courses_card.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeScreenLoading extends StatelessWidget {
  const HomeScreenLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Skeletonizer(
      effect: ShimmerEffect(),
      child: CoursesCard(
        title: 'tamisium appono calcar',
        imageUrl: 'https://placehold.co/800x800',
        description:
            'Consequuntur averto decet. Vos admoveo tamen tonsor verbera. Aliqua casus deputo acquiro custodia crinis bellicus neque commemoro.',
      ),
    );
  }
}
