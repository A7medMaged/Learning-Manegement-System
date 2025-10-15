class VerifyEmailRequestModel {
  String? email;
  int? code;

  VerifyEmailRequestModel({this.email, this.code});

  factory VerifyEmailRequestModel.fromJson(Map<String, dynamic> json) {
    return VerifyEmailRequestModel(
      email: json['email'] as String?,
      code: json['code'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
    'email': email,
    'code': code,
  };
}
