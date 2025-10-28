import 'count.dart';
import 'subject.dart';

class Datum {
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
  Count? count;

  Datum({
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
    this.count,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
    '_count': count?.toJson(),
  };
}
