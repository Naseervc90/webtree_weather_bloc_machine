class Weather {
  final String cityName;
  final double currentTemperature;
  final String weatherCondition;
  final String weatherIcon;
  final double minTemperature;
  final double maxTemperature;
  final double humidity;
  final double windSpeed;

  Weather({
    required this.cityName,
    required this.currentTemperature,
    required this.weatherCondition,
    required this.weatherIcon,
    required this.minTemperature,
    required this.maxTemperature,
    required this.humidity,
    required this.windSpeed,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    final cityName = json['name'];
    final weatherData = json['weather'][0];
    final mainData = json['main'];
    final windData = json['wind'];

    return Weather(
      cityName: cityName,
      currentTemperature: mainData['temp'].toDouble(),
      weatherCondition: weatherData['description'],
      weatherIcon: weatherData['icon'],
      minTemperature: mainData['temp_min'].toDouble(),
      maxTemperature: mainData['temp_max'].toDouble(),
      humidity: mainData['humidity'].toDouble(),
      windSpeed: windData['speed'].toDouble(),
    );
  }
}
