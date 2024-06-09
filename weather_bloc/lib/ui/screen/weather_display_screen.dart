import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/weather_bloc/weather_bloc.dart'; // Import the WeatherBloc
import '../widget/weather_display_widget.dart'; // Import the WeatherDisplayWidget

class WeatherDisplayScreen extends StatelessWidget {
  const WeatherDisplayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xff6c64fb)),
        title: const Center(
          child: Text(
            'Weather',
            style: TextStyle(color: Color(0xff6c64fb)),
          ),
        ),
      ),
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoaded) {
            return Center(
                child: WeatherDisplayWidget(weatherData: state.weatherData));
          } else if (state is WeatherError) {
            return Center(child: Text(state.errorMessage));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
