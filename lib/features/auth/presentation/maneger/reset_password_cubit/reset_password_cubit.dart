import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms/features/auth/data/models/reset_password_models/send_reset_code_request_model.dart';
import 'package:lms/features/auth/data/models/reset_password_models/send_reset_code_response_model.dart';
import 'package:lms/features/auth/data/models/reset_password_models/verify_and_change_request_model.dart';
import 'package:lms/features/auth/data/models/reset_password_models/verify_and_change_response_model.dart';
import 'package:lms/features/auth/data/repos/auth_repo_impl.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit(this.authRepoImpl) : super(ResetPasswordInitial());
  final AuthRepoImpl authRepoImpl;

  Future<void> sendResetCode(
    SendResetCodeRequestModel sendResetCodeRequest,
  ) async {
    emit(SendResetCodeLoading());
    final result = await authRepoImpl.resetPassword(
      sendResetCodeRequest,
    );
    result.fold(
      (failure) => emit(SendResetCodeFailure(errorMessage: failure.error)),
      (success) =>
          emit(SendResetCodeSuccess(sendResetCodeResponseModel: success)),
    );
  }

  Future<void> verifyAndChangePassword(
    VerifyAndChangeRequestModel verifyAndChangeRequest,
  ) async {
    emit(VerifyAndChangeLoading());
    final result = await authRepoImpl.verifyAndChangePassword(
      verifyAndChangeRequest,
    );
    result.fold(
      (failure) => emit(VerifyAndChangeFailure(errorMessage: failure.error)),
      (success) =>
          emit(VerifyAndChangeSuccess(verifyAndChangeResponseModel: success)),
    );
  }
}
