import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms/features/auth/data/models/verify_email_models/verify_email_request_model.dart';
import 'package:lms/features/auth/data/models/verify_email_models/verify_email_response_model/verify_email_response_model.dart';
import 'package:lms/features/auth/data/repos/auth_repo_impl.dart';

part 'verify_email_state.dart';

class VerifyEmailCubit extends Cubit<VerifyEmailState> {
  VerifyEmailCubit(this.authRepoImpl) : super(VerifyEmailInitial());
  final AuthRepoImpl authRepoImpl;
  Future<void> verifyEmail(VerifyEmailRequestModel verifyEmailRequest) async {
    emit(VerifyEmailLoading());
    final response = await authRepoImpl.verifyEmail(
      verifyEmailRequest,
    );
    response.fold(
      (failure) {
        emit(VerifyEmailFailure(errorMessage: failure.error));
      },
      (sucess) {
        emit(VerifyEmailSuccess(verifyEmailResponse: sucess));
      },
    );
  }
}
