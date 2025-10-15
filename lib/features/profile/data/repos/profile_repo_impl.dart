import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:lms/core/api/api_keys.dart';
import 'package:lms/core/errors/failure.dart';
import 'package:lms/features/home/data/models/user_model/user_model.dart';
import 'package:lms/features/profile/data/models/update_info_response_model/update_info_response_model.dart';
import 'package:lms/features/profile/data/repos/profile_repo.dart';

class ProfileRepoImpl extends ProfileRepo {
  final Dio dio;

  ProfileRepoImpl({required this.dio});
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

  @override
  Future<Either<Failures, UpdateInfoResponseModel>> updateUserInfo() async {
    try {
      Response response = await dio.put(
        ApiKeys.updateInfo,
      );
      UpdateInfoResponseModel updateInfoResponseModel =
          UpdateInfoResponseModel.fromJson(response.data);
      return Right(updateInfoResponseModel);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(error: e.toString()));
    }
  }
}
