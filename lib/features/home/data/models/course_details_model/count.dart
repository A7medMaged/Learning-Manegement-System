class Count {
  int? lectures;

  Count({this.lectures});

  factory Count.fromJson(Map<String, dynamic> json) => Count(
    lectures: json['lectures'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'lectures': lectures,
  };
}
