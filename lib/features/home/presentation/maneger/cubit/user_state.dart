part of 'user_cubit.dart';

sealed class UserState {}

final class UserInitial extends UserState {}

final class UserLoading extends UserState {}

final class UserLoaded extends UserState {
  final UserModel userModel;
  UserLoaded({required this.userModel});
}

final class UserError extends UserState {
  final String error;
  UserError({required this.error});
}
