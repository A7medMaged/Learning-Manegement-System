import 'package:dartz/dartz.dart';
import 'package:lms/core/errors/failure.dart';
import 'package:lms/features/auth/data/models/cities_model/city_model/city_model.dart';
import 'package:lms/features/auth/data/models/login_models/login_request_model.dart';
import 'package:lms/features/auth/data/models/login_models/login_response_model/login_response_model.dart';
import 'package:lms/features/auth/data/models/register_models/register_request_model.dart';
import 'package:lms/features/auth/data/models/register_models/register_response_model/register_response_model.dart';
import 'package:lms/features/auth/data/models/reset_password_models/send_reset_code_request_model.dart';
import 'package:lms/features/auth/data/models/reset_password_models/send_reset_code_response_model.dart';
import 'package:lms/features/auth/data/models/reset_password_models/verify_and_change_request_model.dart';
import 'package:lms/features/auth/data/models/reset_password_models/verify_and_change_response_model.dart';
import 'package:lms/features/auth/data/models/verify_email_models/verify_email_request_model.dart';
import 'package:lms/features/auth/data/models/verify_email_models/verify_email_response_model/verify_email_response_model.dart';

abstract class AuthRepo {
  Future<Either<Failures, RegisterResponseModel>> registerUsers(
    RegisterRequestModel registerRequest,
  );

  Future<Either<Failures, CityModel>> fetchCity();

  Future<Either<Failures, VerifyEmailResponseModel>> verifyEmail(
    VerifyEmailRequestModel verifyEmailRequest,
  );

  Future<Either<Failures, LoginResponseModel>> login(
    LoginRequestModel loginRequest,
  );

  Future<Either<Failures, SendResetCodeResponseModel>> resetPassword(
    SendResetCodeRequestModel sendResetCodeRequest,
  );

  Future<Either<Failures, VerifyAndChangeResponseModel>>
  verifyAndChangePassword(
    VerifyAndChangeRequestModel verifyAndChangeRequest,
  );
}
