class VerifyAndChangeRequestModel {
  String? email;
  int? code;
  String? newPassword;

  VerifyAndChangeRequestModel({
    this.email,
    this.code,
    this.newPassword,
  });

  factory VerifyAndChangeRequestModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return VerifyAndChangeRequestModel(
      email: json['email'] as String?,
      code: json['code'] as int?,
      newPassword: json['newPassword'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'email': email,
    'code': code,
    'newPassword': newPassword,
  };
}
