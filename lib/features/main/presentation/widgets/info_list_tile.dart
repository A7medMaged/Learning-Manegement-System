import 'package:flutter/material.dart';
import 'package:lms/core/utils/styling/text_style.dart';

class InfoListTile extends StatelessWidget {
  const InfoListTile({super.key, required this.title, required this.subtitle});
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 4,
      ),
      title: Text(
        title,
        style: Styles.style18,
      ),
      subtitle: Text(
        subtitle,
        style: Styles.style16.copyWith(
          color: Colors.grey,
        ),
      ),
    );
  }
}
