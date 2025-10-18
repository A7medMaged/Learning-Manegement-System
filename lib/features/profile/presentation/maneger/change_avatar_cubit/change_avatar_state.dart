part of 'change_avatar_cubit.dart';


sealed class ChangeAvatarState {}

final class ChangeAvatarInitial extends ChangeAvatarState {}

final class ChangeAvatarLoading extends ChangeAvatarState {}

final class ChangeAvatarSuccess extends ChangeAvatarState {
  final ChangeAvatarResponseModel changeAvatarResponseModel;

  ChangeAvatarSuccess({required this.changeAvatarResponseModel});
}

final class ChangeAvatarFailure extends ChangeAvatarState {
  final String errorMessage;

  ChangeAvatarFailure({required this.errorMessage});
}
