import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/weather_bloc/weather_bloc.dart'; // Import the WeatherBloc

class LocationSearchWidget extends StatefulWidget {
  @override
  _LocationSearchWidgetState createState() => _LocationSearchWidgetState();
}

class _LocationSearchWidgetState extends State<LocationSearchWidget> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: 'Enter city name',
          border: OutlineInputBorder(),
          suffixIcon: IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              final city = _searchController.text.trim();
              BlocProvider.of<WeatherBloc>(context)
                  .add(FetchWeatherData(city: city));
              Navigator.pushNamed(context, '/weather');
            },
          ),
        ),
      ),
    );
  }
}
