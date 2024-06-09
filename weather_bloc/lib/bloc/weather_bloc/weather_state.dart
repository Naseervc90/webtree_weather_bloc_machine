part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final Weather weatherData;

  const WeatherLoaded({required this.weatherData});

  @override
  List<Object> get props => [weatherData];
}

class WeatherError extends WeatherState {
  final String errorMessage;

  const WeatherError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
