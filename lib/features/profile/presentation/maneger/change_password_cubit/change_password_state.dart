part of 'change_password_cubit.dart';

sealed class ChangePasswordState {}

final class ChangePasswordInitial extends ChangePasswordState {}

final class ChangePasswordLoading extends ChangePasswordState {}

final class ChangePasswordSuccess extends ChangePasswordState {
  final ChangePasswordResponseModel changePasswordResponseModel;

  ChangePasswordSuccess(this.changePasswordResponseModel);
}

final class ChangePasswordFailure extends ChangePasswordState {
  final String errorMessage;

  ChangePasswordFailure(this.errorMessage);
}
