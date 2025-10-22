import 'package:dartz/dartz.dart';
import 'package:lms/core/errors/failure.dart';
import 'package:lms/features/main/data/models/user_model/user_model.dart';
import 'package:lms/features/profile/data/models/change_avatar/change_avatar_request_model.dart';
import 'package:lms/features/profile/data/models/change_avatar/change_avatar_response_model/change_avatar_response_model.dart';
import 'package:lms/features/profile/data/models/change_password_models/change_password_request_model.dart';
import 'package:lms/features/profile/data/models/change_password_models/change_password_response_model.dart';
import 'package:lms/features/profile/data/models/update_info_models/update_info_request_model.dart';
import 'package:lms/features/profile/data/models/update_info_models/update_info_response_model.dart';

abstract class ProfileRepo {
  Future<Either<Failures, UserModel>> getUserData();

  Future<Either<Failures, UpdateInfoResponseModel>> updateUserInfo(
    UpdateInfoRequestModel updateInfoRequestModel,
  );

  Future<Either<Failures, ChangePasswordResponseModel>> changePassword(
    ChangePasswordRequestModel changePasswordRequestModel,
  );

  Future<Either<Failures, ChangeAvatarResponseModel>> changeAvatar(
    ChangeAvatarRequestModel changeAvatarRequestModel,
  );
}
