class Count {
  int? sections;
  int? enrollments;

  Count({this.sections, this.enrollments});

  factory Count.fromJson(Map<String, dynamic> json) => Count(
    sections: json['sections'] as int?,
    enrollments: json['enrollments'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'sections': sections,
    'enrollments': enrollments,
  };
}
