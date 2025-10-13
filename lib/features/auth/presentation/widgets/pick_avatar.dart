import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lms/core/utils/styling/app_assets.dart';

class PickAvatar extends StatefulWidget {
  const PickAvatar({super.key});

  @override
  State<PickAvatar> createState() => _PickAvatarState();
}

class _PickAvatarState extends State<PickAvatar> {
  File? avatarFile;

  Future<void> pickAvatar() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        avatarFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: pickAvatar,
      child: CircleAvatar(
        radius: 55,
        backgroundColor: Colors.blue.shade100,
        backgroundImage: avatarFile != null
            ? FileImage(avatarFile!)
            : const AssetImage(
                    AppAssets.avatar,
                  )
                  as ImageProvider,
        child: avatarFile == null
            ? const Icon(
                Icons.camera_alt,
                size: 28,
                color: Colors.white70,
              )
            : null,
      ),
    );
  }
}
