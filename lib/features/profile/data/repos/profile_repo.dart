import 'package:dartz/dartz.dart';
import 'package:lms/core/errors/failure.dart';
import 'package:lms/features/home/data/models/user_model/user_model.dart';
import 'package:lms/features/profile/data/models/update_info_request_model.dart';
import 'package:lms/features/profile/data/models/update_info_response_model/update_info_response_model.dart';

abstract class ProfileRepo {
  Future<Either<Failures, UserModel>> getUserData();

  Future<Either<Failures, UpdateInfoResponseModel>> updateUserInfo(
    UpdateInfoRequestModel updateInfoRequestModel,
  );
}
