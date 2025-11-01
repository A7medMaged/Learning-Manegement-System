import 'package:flutter/material.dart';
import 'package:lms/features/home/presentation/widgets/organiztion_list_tile.dart';

class OrganizationScreen extends StatelessWidget {
  const OrganizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Organizations'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) {
                return OrganiztionListTile(
                  title: 'Armstrong - Murazik',
                  type: 'Teacher',
                  email: 'Rogelio56@hotmail.com',
                  onTap: () {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
