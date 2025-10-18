import 'dart:io';

import 'package:dio/dio.dart';

class RegisterRequestModel {
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final int cityId;
  final File? avatar;

  RegisterRequestModel({
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
    };
  }

  Future<FormData> toFormData() async {
    final map = toJson();

    if (avatar != null) {
      map['avatar'] = await MultipartFile.fromFile(
        avatar!.path,
        filename: avatar!.path.split('/').last,
      );
    }

    return FormData.fromMap(map);
  }

  factory RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    return RegisterRequestModel(
      email: json['email'],
      password: json['password'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      phoneNumber: json['phoneNumber'],
      cityId: json['cityId'],
    );
  }
}
