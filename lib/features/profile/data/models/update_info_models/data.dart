class Data {
  String? firstName;
  String? lastName;
  String? fullName;
  String? email;
  String? phoneNumber;
  bool? isEmailVerified;
  bool? isVerified;

  Data({
    this.firstName,
    this.lastName,
    this.fullName,
    this.email,
    this.phoneNumber,
    this.isEmailVerified,
    this.isVerified,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    firstName: json['firstName'] as String?,
    lastName: json['lastName'] as String?,
    fullName: json['fullName'] as String?,
    email: json['email'] as String?,
    phoneNumber: json['phoneNumber'] as String?,
    isEmailVerified: json['isEmailVerified'] as bool?,
    isVerified: json['isVerified'] as bool?,
  );

  Map<String, dynamic> toJson() => {
    'firstName': firstName,
    'lastName': lastName,
    'fullName': fullName,
    'email': email,
    'phoneNumber': phoneNumber,
    'isEmailVerified': isEmailVerified,
    'isVerified': isVerified,
  };
}
