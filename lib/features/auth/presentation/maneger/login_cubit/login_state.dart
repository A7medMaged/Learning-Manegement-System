part of 'login_cubit.dart';

sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final LoginResponseModel loginResponseModel;

  LoginSuccess({required this.loginResponseModel});
}

final class LoginFailure extends LoginState {
  final String errorMessage;
  LoginFailure({required this.errorMessage});
}
