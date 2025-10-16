part of 'reset_password_cubit.dart';

sealed class ResetPasswordState {}

final class ResetPasswordInitial extends ResetPasswordState {}

final class SendResetCodeLoading extends ResetPasswordState {}

final class SendResetCodeSuccess extends ResetPasswordState {
  final SendResetCodeResponseModel sendResetCodeResponseModel;

  SendResetCodeSuccess({required this.sendResetCodeResponseModel});
}

final class SendResetCodeFailure extends ResetPasswordState {
  final String errorMessage;

  SendResetCodeFailure({required this.errorMessage});
}

final class VerifyAndChangeLoading extends ResetPasswordState {}

final class VerifyAndChangeSuccess extends ResetPasswordState {
  final VerifyAndChangeResponseModel verifyAndChangeResponseModel;

  VerifyAndChangeSuccess({required this.verifyAndChangeResponseModel});
}

final class VerifyAndChangeFailure extends ResetPasswordState {
  final String errorMessage;

  VerifyAndChangeFailure({required this.errorMessage});
}
