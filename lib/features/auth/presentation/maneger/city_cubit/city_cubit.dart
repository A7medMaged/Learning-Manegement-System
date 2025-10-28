import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms/features/auth/data/models/cities_model/city_model/city_model.dart';
import 'package:lms/features/auth/data/repos/auth_repo.dart';

part 'city_state.dart';

class CityCubit extends Cubit<CityState> {
  CityCubit(this.authRepo) : super(CityInitial());
  final AuthRepo authRepo;

  Future<void> fetchCities() async {
    emit(CityLoading());
    final result = await authRepo.fetchCity();
    result.fold(
      (failure) => emit(CityError(failure.error)),
      (success) => emit(CityLoaded(success)),
    );
  }
}
