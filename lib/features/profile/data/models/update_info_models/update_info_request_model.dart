class UpdateInfoRequestModel {
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? email;

  UpdateInfoRequestModel({
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.email,
  });

  factory UpdateInfoRequestModel.fromJson(Map<String, dynamic> json) {
    return UpdateInfoRequestModel(
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      email: json['email'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'firstName': firstName,
    'lastName': lastName,
    'phoneNumber': phoneNumber,
    'email': email,
  };
}
