class SendResetCodeResponseModel {
  String? message;
  int? status;
  dynamic data;
  dynamic errors;
  String? requestId;

  SendResetCodeResponseModel({
    this.message,
    this.status,
    this.data,
    this.errors,
    this.requestId,
  });

  factory SendResetCodeResponseModel.fromJson(Map<String, dynamic> json) {
    return SendResetCodeResponseModel(
      message: json['message'] as String?,
      status: json['status'] as int?,
      data: json['data'] as dynamic,
      errors: json['errors'] as dynamic,
      requestId: json['requestId'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'message': message,
    'status': status,
    'data': data,
    'errors': errors,
    'requestId': requestId,
  };
}
