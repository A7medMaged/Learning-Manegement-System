class Data {
  int? id;
  String? email;
  String? phoneNumber;
  String? firstName;
  String? lastName;
  String? fullName;
  String? avatar;
  String? role;
  dynamic cityId;
  bool? isVerified;
  bool? isEmailVerified;
  bool? isPhoneVerified;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic city;

  Data({
    this.id,
    this.email,
    this.phoneNumber,
    this.firstName,
    this.lastName,
    this.fullName,
    this.avatar,
    this.role,
    this.cityId,
    this.isVerified,
    this.isEmailVerified,
    this.isPhoneVerified,
    this.createdAt,
    this.updatedAt,
    this.city,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json['id'] as int?,
    email: json['email'] as String?,
    phoneNumber: json['phoneNumber'] as String?,
    firstName: json['firstName'] as String?,
    lastName: json['lastName'] as String?,
    fullName: json['fullName'] as String?,
    avatar: json['avatar'] as String?,
    role: json['role'] as String?,
    cityId: json['cityId'] as dynamic,
    isVerified: json['isVerified'] as bool?,
    isEmailVerified: json['isEmailVerified'] as bool?,
    isPhoneVerified: json['isPhoneVerified'] as bool?,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
    city: json['city'] as dynamic,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'email': email,
    'phoneNumber': phoneNumber,
    'firstName': firstName,
    'lastName': lastName,
    'fullName': fullName,
    'avatar': avatar,
    'role': role,
    'cityId': cityId,
    'isVerified': isVerified,
    'isEmailVerified': isEmailVerified,
    'isPhoneVerified': isPhoneVerified,
    'createdAt': createdAt?.toIso8601String(),
    'updatedAt': updatedAt?.toIso8601String(),
    'city': city,
  };
}
