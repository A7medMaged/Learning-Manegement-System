import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:lms/core/api/api_keys.dart';
import 'package:lms/core/errors/failure.dart';
import 'package:lms/features/home/data/models/user_model/user_model.dart';
import 'package:lms/features/profile/data/models/change_avatar/change_avatar_request_model.dart';
import 'package:lms/features/profile/data/models/change_avatar/change_avatar_response_model/change_avatar_response_model.dart';
import 'package:lms/features/profile/data/models/change_password_models/change_password_request_model.dart';
import 'package:lms/features/profile/data/models/change_password_models/change_password_response_model.dart';
import 'package:lms/features/profile/data/models/update_info_models/update_info_request_model.dart';
import 'package:lms/features/profile/data/models/update_info_models/update_info_response_model.dart';
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
  Future<Either<Failures, UpdateInfoResponseModel>> updateUserInfo(
    UpdateInfoRequestModel updateInfoRequestModel,
  ) async {
    try {
      Response response = await dio.put(
        ApiKeys.updateInfo,
        data: updateInfoRequestModel.toJson(),
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

  @override
  Future<Either<Failures, ChangePasswordResponseModel>> changePassword(
    ChangePasswordRequestModel changePasswordRequestModel,
  ) async {
    try {
      Response response = await dio.put(
        ApiKeys.changePassword,
        data: changePasswordRequestModel.toJson(),
      );
      ChangePasswordResponseModel changePasswordResponseModel =
          ChangePasswordResponseModel.fromJson(response.data);
      return Right(changePasswordResponseModel);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(error: e.toString()));
    }
  }

  @override
  Future<Either<Failures, ChangeAvatarResponseModel>> changeAvatar(
    ChangeAvatarRequestModel changeAvatarRequestModel,
  ) async {
    try {
      final formData = await changeAvatarRequestModel.toFormData();
      final response = await dio.put(
        ApiKeys.changeAvatar,
        data: formData,
      );

      final changeAvatarResponseModel = ChangeAvatarResponseModel.fromJson(
        response.data,
      );

      return Right(changeAvatarResponseModel);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(error: e.toString()));
    }
  }
}
