import 'package:flutter/material.dart';
import 'package:weather_bloc/ui/screen/location_selection_screen.dart';
import 'package:weather_bloc/ui/screen/weather_display_screen.dart';

class Routes {
  static const String initialRoute = '/';
  static const String weatherRoute = '/weather';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initialRoute:
        return MaterialPageRoute(builder: (_) => LocationSelectionScreen());
      case weatherRoute:
        return MaterialPageRoute(builder: (_) => WeatherDisplayScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
