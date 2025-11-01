import 'package:flutter/material.dart';
import 'package:lms/features/home/presentation/widgets/organiztion_list_tile.dart';
import 'package:skeletonizer/skeletonizer.dart';

class OgranizationLoading extends StatelessWidget {
  const OgranizationLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      effect: const ShimmerEffect(),
      child: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return OrganiztionListTile(
            title: 'organization.name!',
            type: 'organization.type!',
            email: 'organization.email!',
            onTap: () {},
          );
        },
      ),
    );
  }
}
