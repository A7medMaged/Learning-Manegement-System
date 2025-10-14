import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms/features/auth/data/models/register_models/register_request_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lms/features/auth/data/models/register_models/register_response_model/register_response_model.dart';
import 'package:lms/features/auth/data/repos/auth_repo_impl.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.authRepoImpl) : super(RegisterInitial());
  final AuthRepoImpl authRepoImpl;

  Future<void> registerUsers(
    RegistrerRequestModel registerRequest, {
    XFile? avatarFile,
  }) async {
    emit(RegisterLoading());
    final response = await authRepoImpl.registerUsers(
      registerRequest,
      avatarFile,
    );
    response.fold(
      (failure) => emit(RegisterFailure(errorMessage: failure.error)),
      (success) => emit(RegisterSuccess(registerResponseModel: success)),
    );
  }
}
