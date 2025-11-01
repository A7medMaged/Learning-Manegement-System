import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OrganiztionListTile extends StatelessWidget {
  const OrganiztionListTile({
    super.key,
    required this.title,
    required this.type,
    required this.email,
    required this.onTap,
  });
  final String title;
  final String type;
  final String email;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(FontAwesomeIcons.building),
        title: Text(title),
        subtitle: Text('$type • $email'),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }
}
