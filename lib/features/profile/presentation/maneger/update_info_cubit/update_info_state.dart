part of 'update_info_cubit.dart';

sealed class UpdateInfoState {}

final class UpdateInfoInitial extends UpdateInfoState {}

final class UpdateInfoLoading extends UpdateInfoState {}

final class UpdateInfoLoaded extends UpdateInfoState {
  final UpdateInfoResponseModel updateInfoResponseModel;

  UpdateInfoLoaded({required this.updateInfoResponseModel});
}

final class UpdateInfoError extends UpdateInfoState {
  final String errorMessage;

  UpdateInfoError({required this.errorMessage});
}
