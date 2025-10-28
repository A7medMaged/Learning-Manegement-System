import 'package:flutter/material.dart';
import 'package:lms/core/utils/styling/text_style.dart';
import 'package:lms/core/widgets/spacing_widgets.dart';
import 'package:lms/generated/l10n.dart';

class CousreSubject extends StatelessWidget {
  const CousreSubject({
    super.key,
    required this.name,
    required this.description,
    required this.price,
  });
  final String name;
  final String description;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name),
        const HeightSpace(8),
        Text(
          '${S.of(context).description}:',
          style: Styles.style18,
        ),
        Text(
          description,
          style: Styles.style14,
        ),
        const HeightSpace(8),
        Row(
          children: [
            Text(
              '${S.of(context).price}: ',
              style: Styles.style18,
            ),
            Text(
              '\$$price',
              style: Styles.style14,
            ),
          ],
        ),
      ],
    );
  }
}
