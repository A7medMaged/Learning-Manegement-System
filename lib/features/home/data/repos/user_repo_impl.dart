import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:lms/core/api/api_keys.dart';
import 'package:lms/core/errors/failure.dart';
import 'package:lms/features/home/data/models/user_model/user_model.dart';
import 'package:lms/features/home/data/repos/user_repo.dart';

class UserRepoImpl extends UserRepo {
  final Dio dio;

  UserRepoImpl({required this.dio});
  @override
  Future<Either<Failures, UserModel>> getUserData() async {
    try {
      Response response = await dio.get(
        ApiKeys.user,
      );
      UserModel userModel = UserModel.fromJson(response.data);
      return Right(userModel);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(error: e.toString()));
    }
  }
}
