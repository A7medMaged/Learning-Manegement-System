import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lms/core/widgets/spacing_widgets.dart';

class CouresCard extends StatelessWidget {
  const CouresCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.description,
  });
  final String imageUrl;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
              errorWidget: (context, url, error) => const Icon(
                FontAwesomeIcons.flutter,
                size: 75,
              ),
            ),
            const HeightSpace(8),
            Text(title),
            const HeightSpace(8),
            Text(
              description,
              overflow: TextOverflow.ellipsis,
            ),
            const HeightSpace(8),
          ],
        ),
      ),
    );
  }
}
