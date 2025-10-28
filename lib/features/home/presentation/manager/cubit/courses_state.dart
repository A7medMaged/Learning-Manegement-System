part of 'courses_cubit.dart';

sealed class CoursesState {}

final class CoursesInitial extends CoursesState {}

final class CoursesLoading extends CoursesState {}

final class CoursesLoaded extends CoursesState {
  final AllSubsCoursesModel coursesModel;
  CoursesLoaded({required this.coursesModel});
}

final class CoursesError extends CoursesState {
  final String errorMessage;
  CoursesError({required this.errorMessage});
}
