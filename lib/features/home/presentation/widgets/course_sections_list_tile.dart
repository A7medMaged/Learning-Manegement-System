import 'package:flutter/material.dart';

class CourseSectionsListTile extends StatelessWidget {
  const CourseSectionsListTile({
    super.key,
    this.onTap,
    required this.title,
    required this.subTitle,
  });
  final void Function()? onTap;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        title: Text(title),
        subtitle: Text(subTitle),
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
