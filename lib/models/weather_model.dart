class WeatherModel {
  final String main;
  final String description;
  final int temp;
  final int feelsLike;
  final int tempMin;
  final int tempMax;
  final int pressure;
  final int humidity;
  final int windSpeed;
  final String icon;

  WeatherModel(
      {required this.main,
      required this.description,
      required this.temp,
      required this.feelsLike,
      required this.tempMin,
      required this.tempMax,
      required this.pressure,
      required this.humidity,
      required this.windSpeed,
      required this.icon});
}
