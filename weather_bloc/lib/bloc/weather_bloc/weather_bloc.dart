import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:weather_bloc/api/weather_api_service.dart';
import 'dart:convert';
import '../../model/weather.dart'; // Import the Weather model

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherApiService _weatherApiService = WeatherApiService();
  WeatherBloc() : super(WeatherInitial()) {
    on<FetchWeatherData>(_onFetchWeatherData);
  }

  Future<void> _onFetchWeatherData(
    FetchWeatherData event,
    Emitter<WeatherState> emit,
  ) async {
    emit(WeatherLoading());

    try {
      final weather = await _weatherApiService.fetchWeather(event.city);
      emit(WeatherLoaded(weatherData: weather));
    } catch (e) {
      emit(WeatherError(errorMessage: 'An error occurred: $e'));
    }
  }
}
