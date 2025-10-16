import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms/features/profile/data/models/change_password_models/change_password_request_model.dart';
import 'package:lms/features/profile/data/models/change_password_models/change_password_response_model.dart';
import 'package:lms/features/profile/data/repos/profile_repo_impl.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit(this.profileRepoImpl) : super(ChangePasswordInitial());
  final ProfileRepoImpl profileRepoImpl;

  Future<void> changePassword(
    ChangePasswordRequestModel changePasswordRequest,
  ) async {
    emit(ChangePasswordLoading());
    final result = await profileRepoImpl.changePassword(
      changePasswordRequest,
    );
    result.fold(
      (failure) => emit(ChangePasswordFailure(failure.error)),
      (data) => emit(ChangePasswordSuccess(data)),
    );
  }
}
