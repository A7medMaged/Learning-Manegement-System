import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lms/core/utils/styling/text_style.dart';
import 'package:lms/core/widgets/spacing_widgets.dart';
import 'package:lms/generated/l10n.dart';

class CourseDetails extends StatelessWidget {
  const CourseDetails({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.content,
  });
  final String title;
  final String imageUrl;
  final String description;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$title:',
          style: Styles.style25,
        ),
        const HeightSpace(8),
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            width: double.infinity,
            imageUrl: imageUrl,
            errorWidget: (context, url, error) => const Icon(
              FontAwesomeIcons.flutter,
              size: 75,
            ),
          ),
        ),
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
        Text(
          '${S.of(context).content}:',
          style: Styles.style18,
        ),
        Text(
          content,
          style: Styles.style14,
        ),
      ],
    );
  }
}
