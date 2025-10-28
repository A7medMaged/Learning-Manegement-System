import 'package:flutter/widgets.dart';
import 'package:lms/core/utils/styling/text_style.dart';
import 'package:lms/core/widgets/app_text_button.dart';
import 'package:lms/core/widgets/spacing_widgets.dart';
import 'package:lms/features/home/presentation/widgets/coures_card.dart';
import 'package:lms/generated/l10n.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return const CouresCard(
                  title: 'tamisium appono calcar',
                  imageUrl: 'https://placehold.co/800x800',
                  description:
                      'Consequuntur averto decet. Vos admoveo tamen tonsor verbera. Aliqua casus deputo acquiro custodia crinis bellicus neque commemoro.',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
