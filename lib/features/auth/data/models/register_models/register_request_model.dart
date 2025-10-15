import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img_pkg;
import 'dart:typed_data';

class RegistrerRequestModel {
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final int cityId;
  final String? avatar;

  RegistrerRequestModel({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.cityId,
    this.avatar,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'cityId': cityId,
      if (avatar != null) 'avatar': avatar,
    };
  }

  /// Build a multipart [FormData] suitable for file upload (avatar) with Dio.
  ///
  /// If [avatarFile] is provided, it will be attached as a `avatar` MultipartFile.
  /// Otherwise the returned FormData contains only the scalar fields.
  Future<FormData> toFormData({XFile? avatarFile}) async {
    final map = <String, dynamic>{
      'email': email,
      'password': password,
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'cityId': cityId,
    };

    if (avatarFile != null) {
      Uint8List bytes = await avatarFile.readAsBytes();
      String filename = avatarFile.name.isNotEmpty
          ? avatarFile.name
          : 'avatar.jpg';

      // Detect webp by file extension or by magic bytes and convert to jpeg
      final lower = filename.toLowerCase();
      bool isWebp = lower.endsWith('.webp');

      if (!isWebp) {
        // Fallback: check magic bytes for WEBP (RIFF....WEBP)
        if (bytes.length >= 12) {
          final riff = String.fromCharCodes(bytes.sublist(0, 4));
          final webp = String.fromCharCodes(bytes.sublist(8, 12));
          if (riff == 'RIFF' && webp == 'WEBP') isWebp = true;
        }
      }

      Uint8List uploadBytes = bytes;
      String uploadFilename = filename;

      if (isWebp) {
        try {
          final decoded = img_pkg.decodeWebP(bytes);
          if (decoded != null) {
            final jpg = img_pkg.encodeJpg(decoded, quality: 90);
            uploadBytes = Uint8List.fromList(jpg);
            // ensure filename has jpg extension
            uploadFilename = uploadFilename.replaceAll(
              RegExp(r'\.webp\$'),
              '.jpg',
            );
            if (!uploadFilename.toLowerCase().endsWith('.jpg')) {
              uploadFilename += '.jpg';
            }
          } else {
            // if decode failed, throw to be handled by caller
            throw Exception('Failed to decode WEBP image');
          }
        } catch (e) {
          // rethrow to let higher level show message
          rethrow;
        }
      }

      final multipart = MultipartFile.fromBytes(
        uploadBytes,
        filename: uploadFilename,
      );
      map['avatar'] = multipart;
    }

    return FormData.fromMap(map);
  }

  factory RegistrerRequestModel.fromJson(Map<String, dynamic> json) {
    return RegistrerRequestModel(
      email: json['email'] as String,
      password: json['password'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      phoneNumber: json['phoneNumber'] as String,
      cityId: json['cityId'] as int,
      avatar: json['avatar'] as String?,
    );
  }
}
