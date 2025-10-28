import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms/features/home/data/models/course_details_model/course_details_model.dart';
import 'package:lms/features/home/data/repos/courses_repo_impl.dart';

part 'course_details_state.dart';

class CourseDetailsCubit extends Cubit<CourseDetailsState> {
  CourseDetailsCubit(this.coursesRepoImpl) : super(CourseDetailsInitial());
  final CoursesRepoImpl coursesRepoImpl;

  Future<void> fetchCourseDetails(int courseId) async {
    emit(CourseDetailsLoading());
    final result = await coursesRepoImpl.fetchCourseDetails(courseId);
    result.fold(
      (failure) => emit(CourseDetailsError(errorMessage: failure.error)),
      (success) => emit(CourseDetailsLoaded(courseDetailsModel: success)),
    );
  }
}
