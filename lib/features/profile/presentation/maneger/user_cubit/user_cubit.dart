import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms/features/main/data/models/user_model/user_model.dart';
import 'package:lms/features/profile/data/repos/profile_repo_impl.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.profileRepoImpl) : super(UserInitial());
  final ProfileRepoImpl profileRepoImpl;

  Future<void> getUserData() async {
    if (isClosed) return;
    try {
      emit(UserLoading());
      final result = await profileRepoImpl.getUserData();
      if (isClosed) return;
      result.fold(
        (failure) {
          if (isClosed) return;
          emit(UserError(errorMessage: failure.error));
        },
        (success) {
          if (isClosed) return;
          emit(UserLoaded(userModel: success));
        },
      );
    } catch (e) {
      // If cubit is closed, exit silently
      if (isClosed) return;
      // Map known exceptions to user-friendly state if desired
      emit(UserError(errorMessage: e.toString()));
    }
  }
}
