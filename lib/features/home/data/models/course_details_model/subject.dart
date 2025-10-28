class Subject {
  int? id;
  String? icon;
  String? name;
  String? description;
  int? organizationId;
  int? teacherId;
  int? defaultPrice;
  DateTime? createdAt;
  DateTime? updatedAt;

  Subject({
    this.id,
    this.icon,
    this.name,
    this.description,
    this.organizationId,
    this.teacherId,
    this.defaultPrice,
    this.createdAt,
    this.updatedAt,
  });

  factory Subject.fromJson(Map<String, dynamic> json) => Subject(
    id: json['id'] as int?,
    icon: json['icon'] as String?,
    name: json['name'] as String?,
    description: json['description'] as String?,
    organizationId: json['organizationId'] as int?,
    teacherId: json['teacherId'] as int?,
    defaultPrice: json['defaultPrice'] as int?,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'icon': icon,
    'name': name,
    'description': description,
    'organizationId': organizationId,
    'teacherId': teacherId,
    'defaultPrice': defaultPrice,
    'createdAt': createdAt?.toIso8601String(),
    'updatedAt': updatedAt?.toIso8601String(),
  };
}
