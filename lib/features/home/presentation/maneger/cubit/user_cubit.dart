import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms/features/home/data/models/user_model/user_model.dart';
import 'package:lms/features/home/data/repos/user_repo_impl.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.userRepo) : super(UserInitial());
  final UserRepoImpl userRepo;

  Future<void> getUserData() async {
    emit(UserLoading());
    final result = await userRepo.getUserData();
    result.fold(
      (failure) => emit(UserError(error: failure.error)),
      (success) => emit(UserLoaded(userModel: success)),
    );
  }
}
