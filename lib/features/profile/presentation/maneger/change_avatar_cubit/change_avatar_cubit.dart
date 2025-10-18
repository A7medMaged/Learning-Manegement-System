import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms/features/profile/data/models/change_avatar/change_avatar_request_model.dart';
import 'package:lms/features/profile/data/models/change_avatar/change_avatar_response_model/change_avatar_response_model.dart';
import 'package:lms/features/profile/data/repos/profile_repo_impl.dart';

part 'change_avatar_state.dart';

class ChangeAvatarCubit extends Cubit<ChangeAvatarState> {
  ChangeAvatarCubit(this.profileRepoImpl) : super(ChangeAvatarInitial());
  final ProfileRepoImpl profileRepoImpl;

  Future<void> changeAvatar(
    File avatarFile,
  ) async {
    emit(ChangeAvatarLoading());
    final changeAvatarRequest = ChangeAvatarRequestModel(avatar: avatarFile);
    final result = await profileRepoImpl.changeAvatar(changeAvatarRequest);
    result.fold(
      (failure) => emit(ChangeAvatarFailure(errorMessage: failure.error)),
      (data) => emit(ChangeAvatarSuccess(changeAvatarResponseModel: data)),
    );
  }
}
