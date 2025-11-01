class Datum {
  int? id;
  String? name;
  String? type;
  String? email;
  String? phoneNumber;
  String? address;
  int? countryId;
  int? cityId;
  dynamic ownerId;
  DateTime? createdAt;
  DateTime? updatedAt;

  Datum({
    this.id,
    this.name,
    this.type,
    this.email,
    this.phoneNumber,
    this.address,
    this.countryId,
    this.cityId,
    this.ownerId,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json['id'] as int?,
    name: json['name'] as String?,
    type: json['type'] as String?,
    email: json['email'] as String?,
    phoneNumber: json['phoneNumber'] as String?,
    address: json['address'] as String?,
    countryId: json['countryId'] as int?,
    cityId: json['cityId'] as int?,
    ownerId: json['ownerId'] as dynamic,
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
    'type': type,
    'email': email,
    'phoneNumber': phoneNumber,
    'address': address,
    'countryId': countryId,
    'cityId': cityId,
    'ownerId': ownerId,
    'createdAt': createdAt?.toIso8601String(),
    'updatedAt': updatedAt?.toIso8601String(),
  };
}
