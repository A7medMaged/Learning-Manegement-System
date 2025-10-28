part of 'course_details_cubit.dart';


sealed class CourseDetailsState {}

final class CourseDetailsInitial extends CourseDetailsState {}

final class CourseDetailsLoading extends CourseDetailsState {}

final class CourseDetailsLoaded extends CourseDetailsState {
  final CourseDetailsModel courseDetailsModel;
  CourseDetailsLoaded({required this.courseDetailsModel});
}

final class CourseDetailsError extends CourseDetailsState {
  final String errorMessage;
  CourseDetailsError({required this.errorMessage});
}
