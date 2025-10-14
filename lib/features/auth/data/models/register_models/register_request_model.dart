import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

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
      final bytes = await avatarFile.readAsBytes();
      final filename = avatarFile.name.isNotEmpty
          ? avatarFile.name
          : 'avatar.jpg';
      final multipart = MultipartFile.fromBytes(
        bytes,
        filename: filename,
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
