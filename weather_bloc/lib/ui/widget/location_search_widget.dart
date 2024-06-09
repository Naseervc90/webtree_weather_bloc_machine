import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc/routes.dart';
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
        style:
            const TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
        controller: _searchController,
        decoration: InputDecoration(
          hintText: 'Enter city name',
          hintStyle: const TextStyle(
              color: Colors.white70, fontStyle: FontStyle.italic),
          border: const OutlineInputBorder(),
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(
                color: Colors.white,
              )),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(
                color: Colors.white,
              )),
          suffixIcon: IconButton(
            color: Colors.white70,
            icon: const Icon(Icons.search),
            onPressed: () {
              final city = _searchController.text.trim();
              BlocProvider.of<WeatherBloc>(context)
                  .add(FetchWeatherData(city: city));
              Navigator.pushNamed(context, Routes.weatherRoute);
            },
          ),
        ),
      ),
    );
  }
}
