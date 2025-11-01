import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SectionLectureListTile extends StatelessWidget {
  const SectionLectureListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ExpansionTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: Colors.grey[200],
        collapsedBackgroundColor: Colors.grey[400],
        title: const Text('lecture1'),
        children: const [
          ListTile(
            title: Text('video'),
            subtitle: Text('12 min'),
            // ignore: deprecated_member_use
            trailing: Icon(FontAwesomeIcons.playCircle),
          ),
          ListTile(
            title: Text('PDF Document'),
            trailing: Icon(FontAwesomeIcons.filePdf),
          ),
        ],
      ),
    );
  }
}
