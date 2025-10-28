import 'package:dartz/dartz.dart';
import 'package:lms/core/errors/failure.dart';
import 'package:lms/features/home/data/models/all_subs_courses_model/all_subs_courses_model.dart';
import 'package:lms/features/home/data/models/course_details_model/course_details_model.dart';

abstract class CoursesRepo {
  Future<Either<Failures, AllSubsCoursesModel>> fetchCourses();

  Future<Either<Failures, CourseDetailsModel>> fetchCourseDetails(int courseId);
}
