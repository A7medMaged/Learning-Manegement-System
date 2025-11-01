import 'package:flutter/material.dart';
import 'package:lms/features/home/presentation/widgets/section_lecture_list_tile.dart';
import 'package:lms/generated/l10n.dart';

class SectionLectureScreen extends StatelessWidget {
  const SectionLectureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(S.of(context).lectutes),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return const SectionLectureListTile();
        },
      ),
    );
  }
}
