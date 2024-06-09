import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../model/weather.dart';
// Import the Weather model

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<FetchWeatherData>(_onFetchWeatherData);
  }

  Future<void> _onFetchWeatherData(
    FetchWeatherData event,
    Emitter<WeatherState> emit,
  ) async {
    emit(WeatherLoading());

    try {
      final apiKey =
          '76221058f78c859182087f1184f6e12a'; // Replace with your actual API key
      final url =
          'https://api.openweathermap.org/data/2.5/weather?q=${event.city}&appid=$apiKey&units=metric';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final weatherData = Weather.fromJson(jsonDecode(response.body));
        emit(WeatherLoaded(weatherData: weatherData));
      } else {
        emit(WeatherError(errorMessage: 'Failed to fetch weather data'));
      }
    } catch (e) {
      emit(WeatherError(errorMessage: 'An error occurred: $e'));
    }
  }
}
