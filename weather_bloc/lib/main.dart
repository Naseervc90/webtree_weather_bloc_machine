import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_bloc/bloc/weather_bloc/weather_bloc.dart';
import 'package:weather_bloc/routes.dart';
import 'package:weather_bloc/ui/screen/location_selection_screen.dart';
import 'package:weather_bloc/ui/screen/weather_display_screen.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => WeatherBloc(),
      child: WeatherApp(),
    ),
  );
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: Routes.initialRoute,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
