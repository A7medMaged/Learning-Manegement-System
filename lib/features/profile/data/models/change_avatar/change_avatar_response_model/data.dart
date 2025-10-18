class Data {
  String? avatar;

  Data({this.avatar});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    avatar: json['avatar'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'avatar': avatar,
  };
}
