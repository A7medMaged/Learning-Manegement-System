import 'package:flutter/material.dart';
import 'package:lms/features/home/presentation/widgets/info_list_tile.dart';

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Column(
        children: [
          InfoListTile(
            title: 'Name',
            subtitle: 'Ahmed Maged',
          ),
          InfoListTile(
            title: 'Email',
            subtitle: 'ahmedmahmoud.work0@gmail.com',
          ),
          InfoListTile(
            title: 'Phone Number',
            subtitle: '01154660193',
          ),
          InfoListTile(
            title: 'City Id',
            subtitle: '3',
          ),
        ],
      ),
    );
  }
}
