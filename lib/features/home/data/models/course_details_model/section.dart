import 'count.dart';

class Section {
  int? id;
  String? title;
  String? content;
  int? courseId;
  DateTime? createdAt;
  DateTime? updatedAt;
  Count? count;

  Section({
    this.id,
    this.title,
    this.content,
    this.courseId,
    this.createdAt,
    this.updatedAt,
    this.count,
  });

  factory Section.fromJson(Map<String, dynamic> json) => Section(
    id: json['id'] as int?,
    title: json['title'] as String?,
    content: json['content'] as String?,
    courseId: json['courseId'] as int?,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
    count: json['_count'] == null
        ? null
        : Count.fromJson(json['_count'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'content': content,
    'courseId': courseId,
    'createdAt': createdAt?.toIso8601String(),
    'updatedAt': updatedAt?.toIso8601String(),
    '_count': count?.toJson(),
  };
}
