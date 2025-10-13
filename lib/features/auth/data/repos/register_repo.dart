import 'package:dartz/dartz.dart';
import 'package:lms/core/errors/failure.dart';
import 'package:lms/features/auth/data/models/register_models/register_request_model.dart';
import 'package:lms/features/auth/data/models/register_models/register_response_model/register_response_model.dart';

abstract class RegisterRepo {
  Future<Either<Failures, RegisterResponseModel>> registerUsers(
    RegistrerRequestModel registerRequest,
  );
}
