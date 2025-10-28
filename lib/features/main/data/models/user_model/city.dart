class City {
  int? id;
  String? name;
  String? code;
  int? countryId;
  DateTime? createdAt;
  DateTime? updatedAt;

  City({
    this.id,
    this.name,
    this.code,
    this.countryId,
    this.createdAt,
    this.updatedAt,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
    id: json['id'] as int?,
    name: json['name'] as String?,
    code: json['code'] as String?,
    countryId: json['countryId'] as int?,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'code': code,
    'countryId': countryId,
    'createdAt': createdAt?.toIso8601String(),
    'updatedAt': updatedAt?.toIso8601String(),
  };
}
