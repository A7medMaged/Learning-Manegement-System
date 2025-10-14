import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lms/core/errors/failure.dart';
import 'package:lms/features/auth/data/models/login_models/login_request_model.dart';
import 'package:lms/features/auth/data/models/login_models/login_response_model/login_response_model.dart';
import 'package:lms/features/auth/data/models/register_models/register_request_model.dart';
import 'package:lms/features/auth/data/models/register_models/register_response_model/register_response_model.dart';

abstract class AuthRepo {
  Future<Either<Failures, RegisterResponseModel>> registerUsers(
    RegistrerRequestModel registerRequest,
    XFile? avatarFile,
  );

  Future<Either<Failures, LoginResponseModel>> login(
    LoginRequestModel loginRequest,
  );
}
