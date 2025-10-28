import 'package:lms/features/main/data/models/user_model/data.dart';

class UserModel {
  String? message;
  int? status;
  Data? data;
  dynamic errors;
  String? requestId;

  UserModel({
    this.message,
    this.status,
    this.data,
    this.errors,
    this.requestId,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    message: json['message'] as String?,
    status: json['status'] as int?,
    data: json['data'] == null
        ? null
        : Data.fromJson(json['data'] as Map<String, dynamic>),
    errors: json['errors'] as dynamic,
    requestId: json['requestId'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'message': message,
    'status': status,
    'data': data?.toJson(),
    'errors': errors,
    'requestId': requestId,
  };
}
