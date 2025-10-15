import 'package:flutter/material.dart';
import 'package:lms/core/utils/styling/app_assets.dart';
import 'package:lms/core/utils/styling/text_style.dart';
import 'package:lms/core/widgets/spacing_widgets.dart';
import 'package:lms/features/home/presentation/widgets/acount.dart';
import 'package:lms/features/home/presentation/widgets/personal_info.dart';

class Sections extends StatelessWidget {
  const Sections({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: CircleAvatar(
              radius: 60,
              backgroundColor: Colors.transparent,
              child: Image.asset(
                AppAssets.profile,
              ),
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
