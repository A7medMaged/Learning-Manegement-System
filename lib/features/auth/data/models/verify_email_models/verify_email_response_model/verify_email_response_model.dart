import 'data.dart';

class VerifyEmailResponseModel {
  String? message;
  int? status;
  Data? data;
  dynamic errors;
  String? requestId;

  VerifyEmailResponseModel({
    this.message,
    this.status,
    this.data,
    this.errors,
    this.requestId,
  });

  factory VerifyEmailResponseModel.fromJson(Map<String, dynamic> json) {
    return VerifyEmailResponseModel(
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
