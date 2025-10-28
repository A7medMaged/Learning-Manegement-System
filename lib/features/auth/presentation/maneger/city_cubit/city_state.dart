part of 'city_cubit.dart';

abstract class CityState {}

class CityInitial extends CityState {}

class CityLoading extends CityState {}

class CityLoaded extends CityState {
  final CityModel cityModel;
  CityLoaded(this.cityModel);
}

class CityError extends CityState {
  final String message;
  CityError(this.message);
}
