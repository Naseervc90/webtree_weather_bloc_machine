import 'package:flutter/material.dart';
import 'package:weather_bloc/consts.dart';

import '../../model/weather.dart'; // Import the Weather model

class WeatherDisplayWidget extends StatelessWidget {
  final Weather weatherData;

  WeatherDisplayWidget({required this.weatherData});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          weatherData.cityName,
          style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xff6c64fb)),
        ),
        const SizedBox(height: 16),
        Text(
          '${weatherData.currentTemperature}°C',
          style: const TextStyle(fontSize: 48, color: Color(0xff6c64fb)),
        ),
        const SizedBox(width: 16),
        Image.network(
          '${Constants.weatherIconUrl + weatherData.weatherIcon}.png',
          color: const Color(0xff6c64fb), // Replace with the actual icon URL
          width: 64,
          height: 64,
        ),
        const SizedBox(height: 16),
        Text(
          weatherData.weatherCondition,
          style: const TextStyle(fontSize: 24, color: Color(0xff6c64fb)),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          'Min: ${weatherData.minTemperature}°C, Max: ${weatherData.maxTemperature}°C',
          style: const TextStyle(fontSize: 18, color: Color(0xff6c64fb)),
        ),
        const SizedBox(height: 8),
        Text(
          'Humidity: ${weatherData.humidity}%, Wind: ${weatherData.windSpeed} km/h',
          style: const TextStyle(fontSize: 18, color: Color(0xff6c64fb)),
        ),
      ],
    );
  }
}
