class SendResetCodeRequestModel {
  String? email;

  SendResetCodeRequestModel({this.email});

  factory SendResetCodeRequestModel.fromJson(Map<String, dynamic> json) {
    return SendResetCodeRequestModel(
      email: json['email'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'email': email,
  };
}
