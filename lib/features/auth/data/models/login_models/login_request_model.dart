class LoginRequestModel {
  String? email;
  String? password;

  LoginRequestModel({this.email, this.password});

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) {
    return LoginRequestModel(
      email: json['email'] as String?,
      password: json['password'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'email': email,
    'password': password,
  };
}
