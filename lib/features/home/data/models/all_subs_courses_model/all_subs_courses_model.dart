import 'datum.dart';

class AllSubsCoursesModel {
  String? message;
  int? status;
  List<Datum>? data;
  dynamic errors;
  String? requestId;

  AllSubsCoursesModel({
    this.message,
    this.status,
    this.data,
    this.errors,
    this.requestId,
  });

  factory AllSubsCoursesModel.fromJson(Map<String, dynamic> json) {
    return AllSubsCoursesModel(
      message: json['message'] as String?,
      status: json['status'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
      errors: json['errors'] as dynamic,
      requestId: json['requestId'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'message': message,
    'status': status,
    'data': data?.map((e) => e.toJson()).toList(),
    'errors': errors,
    'requestId': requestId,
  };
}
