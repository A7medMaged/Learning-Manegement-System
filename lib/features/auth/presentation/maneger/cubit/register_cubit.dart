import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms/features/auth/data/models/register_models/register_request_model.dart';
import 'package:lms/features/auth/data/models/register_models/register_response_model/register_response_model.dart';
import 'package:lms/features/auth/data/repos/register_repo_impl.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.registerRepoImpl) : super(RegisterInitial());
  final RegisterRepoImpl registerRepoImpl;

  Future<void> registerUsers(RegistrerRequestModel registerRequest) async {
    emit(RegisterLoading());
    final response = await registerRepoImpl.registerUsers(registerRequest);
    response.fold(
      (failure) => emit(RegisterFailure(errorMessage: failure.error)),
      (success) => emit(RegisterSuccess(registerResponseModel: success)),
    );
  }
}
