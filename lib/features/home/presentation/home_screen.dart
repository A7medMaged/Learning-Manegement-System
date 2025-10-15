import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lms/core/routes/app_routes.dart';
import 'package:lms/core/utils/di.dart';
import 'package:lms/core/utils/storage_helper.dart';
import 'package:lms/core/utils/styling/app_assets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to LMS'),
        centerTitle: true,
        leading: CircleAvatar(
          radius: 10,
          backgroundColor: Colors.grey.shade300,
          child: Image.asset(
            AppAssets.avatar,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: const Center(
        child: Text('Home Screen'),
      ),
    );
  }
}
