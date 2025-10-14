import 'data.dart';

class LoginResponseModel {
  String? message;
  int? status;
  Data? data;
  dynamic errors;
  String? requestId;

  LoginResponseModel({
    this.message,
    this.status,
    this.data,
    this.errors,
    this.requestId,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      message: json['message'] as String?,
      status: json['status'] as int?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      errors: json['errors'] as dynamic,
      requestId: json['requestId'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'message': message,
    'status': status,
    'data': data?.toJson(),
    'errors': errors,
    'requestId': requestId,
  };
}
