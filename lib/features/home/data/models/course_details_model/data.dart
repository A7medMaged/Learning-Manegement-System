import 'count.dart';
import 'section.dart';
import 'subject.dart';

class Data {
  int? id;
  String? thumbnail;
  String? title;
  String? description;
  String? content;
  int? defaultPrice;
  int? subjectId;
  DateTime? createdAt;
  DateTime? updatedAt;
  Subject? subject;
  List<Section>? sections;
  Count? count;

  Data({
    this.id,
    this.thumbnail,
    this.title,
    this.description,
    this.content,
    this.defaultPrice,
    this.subjectId,
    this.createdAt,
    this.updatedAt,
    this.subject,
    this.sections,
    this.count,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json['id'] as int?,
    thumbnail: json['thumbnail'] as String?,
    title: json['title'] as String?,
    description: json['description'] as String?,
    content: json['content'] as String?,
    defaultPrice: json['defaultPrice'] as int?,
    subjectId: json['subjectId'] as int?,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
    subject: json['subject'] == null
        ? null
        : Subject.fromJson(json['subject'] as Map<String, dynamic>),
    sections: (json['sections'] as List<dynamic>?)
        ?.map((e) => Section.fromJson(e as Map<String, dynamic>))
        .toList(),
    count: json['_count'] == null
        ? null
        : Count.fromJson(json['_count'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'thumbnail': thumbnail,
    'title': title,
    'description': description,
    'content': content,
    'defaultPrice': defaultPrice,
    'subjectId': subjectId,
    'createdAt': createdAt?.toIso8601String(),
    'updatedAt': updatedAt?.toIso8601String(),
    'subject': subject?.toJson(),
    'sections': sections?.map((e) => e.toJson()).toList(),
    '_count': count?.toJson(),
  };
}
