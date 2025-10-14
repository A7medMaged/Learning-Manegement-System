import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lms/core/utils/styling/app_assets.dart';
import 'package:flutter/foundation.dart'; // علشان نعرف هل Web ولا لأ

class PickAvatar extends StatefulWidget {
  const PickAvatar({super.key, required this.onFilePicked});
  final void Function(XFile? file) onFilePicked;

  @override
  State<PickAvatar> createState() => _PickAvatarState();
}

class _PickAvatarState extends State<PickAvatar> {
  XFile? avatarFile;

  Future<void> pickAvatar() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        avatarFile = pickedFile;
      });
      widget.onFilePicked(avatarFile);
    }
  }

  @override
  Widget build(BuildContext context) {
    ImageProvider imageProvider;

    if (avatarFile != null) {
      if (kIsWeb) {
        imageProvider = NetworkImage(avatarFile!.path);
      } else {
        imageProvider = FileImage(
          // ignore: unnecessary_import
          XFile(avatarFile!.path) as File,
        );
      }
    } else {
      imageProvider = const AssetImage(AppAssets.avatar);
    }

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
