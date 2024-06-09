import 'dart:convert';
import 'dart:developer';

import 'package:weather_bloc/consts.dart';
import 'package:http/http.dart' as http;

import '../model/weather.dart';

class WeatherApiService {
  Future<Weather> fetchWeather(String city) async {
    String url =
        '${Constants.baseUrl + Constants.weatherApi}?q=$city&appid=${Constants.apiKey}&units=metric';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      log(response.body.toString());
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to fetch weather');
    }
  }
}
