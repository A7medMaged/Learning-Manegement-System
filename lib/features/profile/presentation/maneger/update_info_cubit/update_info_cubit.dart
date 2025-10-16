import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms/features/profile/data/models/update_info_models/update_info_request_model.dart';
import 'package:lms/features/profile/data/models/update_info_models/update_info_response_model.dart';
import 'package:lms/features/profile/data/repos/profile_repo_impl.dart';

part 'update_info_state.dart';

class UpdateInfoCubit extends Cubit<UpdateInfoState> {
  UpdateInfoCubit(this.profileRepoImpl) : super(UpdateInfoInitial());
  final ProfileRepoImpl profileRepoImpl;
  Future<void> updateUserInfo(UpdateInfoRequestModel updateInfoRequest) async {
    emit(UpdateInfoLoading());
    final result = await profileRepoImpl.updateUserInfo(updateInfoRequest);
    result.fold(
      (failure) => emit(UpdateInfoError(errorMessage: failure.error)),
      (success) => emit(UpdateInfoLoaded(updateInfoResponseModel: success)),
    );
  }
}
