import 'dart:io';

import 'package:dio/dio.dart';

class ChangeAvatarRequestModel {
  final File avatar;

  ChangeAvatarRequestModel({required this.avatar});

  Future<FormData> toFormData() async {
    return FormData.fromMap({
      'avatar': await MultipartFile.fromFile(
        avatar.path,
        filename: avatar.path.split('/').last,
      ),
    });
  }
}
