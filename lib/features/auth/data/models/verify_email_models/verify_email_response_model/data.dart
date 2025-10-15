class Data {
  bool? isEmailVerified;
  bool? isVerified;

  Data({this.isEmailVerified, this.isVerified});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    isEmailVerified: json['isEmailVerified'] as bool?,
    isVerified: json['isVerified'] as bool?,
  );

  Map<String, dynamic> toJson() => {
    'isEmailVerified': isEmailVerified,
    'isVerified': isVerified,
  };
}
