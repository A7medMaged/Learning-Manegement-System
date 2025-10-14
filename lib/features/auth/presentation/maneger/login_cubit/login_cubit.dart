import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms/features/auth/data/models/login_models/login_request_model.dart';
import 'package:lms/features/auth/data/models/login_models/login_response_model/login_response_model.dart';
import 'package:lms/features/auth/data/repos/auth_repo_impl.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepoImpl) : super(LoginInitial());
  final AuthRepoImpl authRepoImpl;
  Future<void> loginUsers(LoginRequestModel loginRequest) async {
    emit(LoginLoading());
    final response = await authRepoImpl.login(
      loginRequest,
    );
    response.fold(
      (failure) => emit(LoginFailure(errorMessage: failure.error)),
      (success) => emit(LoginSuccess(loginResponseModel: success)),
    );
  }
}
