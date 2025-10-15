import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms/features/home/data/models/user_model/user_model.dart';
import 'package:lms/features/profile/data/repos/profile_repo_impl.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.profileRepoImpl) : super(UserInitial());
  final ProfileRepoImpl profileRepoImpl;

  Future<void> getUserData() async {
    emit(UserLoading());
    final result = await profileRepoImpl.getUserData();
    result.fold(
      (failure) => emit(UserError(errorMessage: failure.error)),
      (success) => emit(UserLoaded(userModel: success)),
    );
  }
}
