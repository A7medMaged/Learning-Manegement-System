import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lms/core/api/api_keys.dart';
import 'package:lms/core/errors/failure.dart';
import 'package:lms/features/auth/data/models/register_models/register_request_model.dart';
import 'package:lms/features/auth/data/models/register_models/register_response_model/register_response_model.dart';
import 'package:lms/features/auth/data/repos/register_repo.dart';

class RegisterRepoImpl extends RegisterRepo {
  final Dio dio;

  RegisterRepoImpl({required this.dio});
  @override
  Future<Either<Failures, RegisterResponseModel>> registerUsers(
    RegistrerRequestModel registerRequest,
    XFile? avatarFile,
  ) async {
    try {
      final formData = await registerRequest.toFormData(avatarFile: avatarFile);
      Response response = await dio.post(
        ApiKeys.register,
        data: formData,
      );
      RegisterResponseModel registerResponse = RegisterResponseModel.fromJson(
        response.data,
      );
      return Right(registerResponse);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(error: e.toString()));
    }
  }
}
