import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lms/core/api/api_keys.dart';
import 'package:lms/core/errors/failure.dart';
import 'package:lms/features/auth/data/models/login_models/login_request_model.dart';
import 'package:lms/features/auth/data/models/login_models/login_response_model/login_response_model.dart';
import 'package:lms/features/auth/data/models/register_models/register_request_model.dart';
import 'package:lms/features/auth/data/models/register_models/register_response_model/register_response_model.dart';
import 'package:lms/features/auth/data/models/reset_password_models/send_reset_code_request_model.dart';
import 'package:lms/features/auth/data/models/reset_password_models/send_reset_code_response_model.dart';
import 'package:lms/features/auth/data/models/verify_email_models/verify_email_request_model.dart';
import 'package:lms/features/auth/data/models/verify_email_models/verify_email_response_model/verify_email_response_model.dart';
import 'package:lms/features/auth/data/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final Dio dio;

  AuthRepoImpl({required this.dio});
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

  @override
  Future<Either<Failures, VerifyEmailResponseModel>> verifyEmail(
    VerifyEmailRequestModel verifyEmailRequest,
  ) async {
    try {
      Response response = await dio.post(
        ApiKeys.verifyEmail,
        data: verifyEmailRequest.toJson(),
      );
      VerifyEmailResponseModel verifyEmailResponse =
          VerifyEmailResponseModel.fromJson(
            response.data,
          );
      return Right(verifyEmailResponse);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(error: e.toString()));
    }
  }

  @override
  Future<Either<Failures, LoginResponseModel>> login(
    LoginRequestModel loginRequest,
  ) async {
    try {
      Response response = await dio.post(
        ApiKeys.login,
        data: loginRequest.toJson(),
      );
      LoginResponseModel loginResponse = LoginResponseModel.fromJson(
        response.data,
      );
      return Right(loginResponse);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(error: e.toString()));
    }
  }

  @override
  Future<Either<Failures, SendResetCodeResponseModel>> resetPassword(
    SendResetCodeRequestModel sendResetCodeRequest,
  ) async {
    try {
      Response response = await dio.post(
        ApiKeys.sendResetCode,
        data: sendResetCodeRequest.toJson(),
      );
      SendResetCodeResponseModel sendResetCodeResponse =
          SendResetCodeResponseModel.fromJson(
            response.data,
          );
      return Right(sendResetCodeResponse);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(error: e.toString()));
    }
  }
}
