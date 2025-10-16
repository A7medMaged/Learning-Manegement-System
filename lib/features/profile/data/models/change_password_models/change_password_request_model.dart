class ChangePasswordRequestModel {
  String? currentPassword;
  String? newPassword;

  ChangePasswordRequestModel({this.currentPassword, this.newPassword});

  factory ChangePasswordRequestModel.fromJson(Map<String, dynamic> json) {
    return ChangePasswordRequestModel(
      currentPassword: json['currentPassword'] as String?,
      newPassword: json['newPassword'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'currentPassword': currentPassword,
    'newPassword': newPassword,
  };
}
