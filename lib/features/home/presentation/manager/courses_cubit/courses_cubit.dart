import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms/features/home/data/models/all_subs_courses_model/all_subs_courses_model.dart';
import 'package:lms/features/home/data/repos/courses_repo_impl.dart';

part 'courses_state.dart';

class CoursesCubit extends Cubit<CoursesState> {
  CoursesCubit(this.coursesRepoImpl) : super(CoursesInitial());
  final CoursesRepoImpl coursesRepoImpl;

  Future<void> fetchCourses() async {
    emit(CoursesLoading());
    final result = await coursesRepoImpl.fetchCourses();
    result.fold(
      (failure) => emit(CoursesError(errorMessage: failure.error)),
      (success) => emit(CoursesLoaded(coursesModel: success)),
    );
  }
}
