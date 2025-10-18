import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lms/core/utils/styling/app_assets.dart';

class PickAvatar extends StatefulWidget {
  const PickAvatar({super.key, required this.onFilePicked});
  final void Function(File? file) onFilePicked;

  @override
  State<PickAvatar> createState() => _PickAvatarState();
}

class _PickAvatarState extends State<PickAvatar> {
  File? avatarFile;

  Future<void> pickAvatar() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final file = File(pickedFile.path);
      setState(() {
        avatarFile = file;
      });
      widget.onFilePicked(file);
    }
  }

  @override
  Widget build(BuildContext context) {
    final imageProvider = avatarFile != null
        ? FileImage(avatarFile!)
        : const AssetImage(AppAssets.avatar) as ImageProvider;

    return GestureDetector(
      onTap: pickAvatar,
      child: CircleAvatar(
        radius: 55,
        backgroundColor: Colors.blue.shade100,
        backgroundImage: imageProvider,
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
