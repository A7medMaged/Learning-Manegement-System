import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:lms/core/api/api_keys.dart';
import 'package:lms/core/errors/failure.dart';
import 'package:lms/features/home/data/models/all_subs_courses_model/all_subs_courses_model.dart';
import 'package:lms/features/home/data/repos/courses_repo.dart';

class CoursesRepoImpl extends CoursesRepo {
  final Dio dio;
  CoursesRepoImpl({required this.dio});

  @override
  Future<Either<Failures, AllSubsCoursesModel>> fetchCourses() async {
    try {
      Response response = await dio.get(
        ApiKeys.allSubsCourses,
      );
      AllSubsCoursesModel coursesResponse = AllSubsCoursesModel.fromJson(
        response.data,
      );
      return Right(coursesResponse);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(error: e.toString()));
    }
  }
}
