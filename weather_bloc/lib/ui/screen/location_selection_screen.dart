import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc/routes.dart';
import 'package:weather_bloc/ui/widget/weather_display_widget.dart';

import '../../bloc/weather_bloc/weather_bloc.dart'; // Import the WeatherBloc
import '../../model/city.dart';
import '../widget/location_search_widget.dart'; // Import the LocationSearchWidget

class LocationSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff6c64fb),
        title: const Center(
            child: Text(
          'Select Location',
          style: TextStyle(color: Colors.white),
        )),
      ),
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is WeatherError) {
            return Center(child: Text(state.errorMessage));
          } else {
            return Container(
              color: const Color(0xff6c64fb),
              child: Column(
                children: [
                  LocationSearchWidget(), // Display the LocationSearchWidget
                  Expanded(
                      child: ListView.builder(
                          itemCount:
                              City.cities.length, // Load predefined locations
                          itemBuilder: (context, index) {
                            final city = City.cities[index];
                            return ListTile(
                              title: Text(
                                city,
                                style: const TextStyle(color: Colors.white),
                              ),
                              onTap: () {
                                BlocProvider.of<WeatherBloc>(context)
                                    .add(FetchWeatherData(city: city));
                                Navigator.pushNamed(
                                    context, Routes.weatherRoute);
                              },
                            );
                          })),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
