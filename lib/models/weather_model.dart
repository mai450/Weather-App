class WeatherModel {
  final String cityName;
  final DateTime dateTime;
  final String image;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String weatherCondition;

  WeatherModel(
      {required this.cityName,
      required this.dateTime,
      required this.image,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherCondition});

  factory WeatherModel.fromjson(json) {
    var jsonData = json['forecast']["forecastday"][0]['day'];
    return WeatherModel(
      cityName: json['location']['name'],
      dateTime: DateTime.parse(json['current']['last_updated']),
      image: jsonData['condition']['icon'],
      temp: jsonData['avgtemp_c'],
      maxTemp: jsonData['maxtemp_c'],
      minTemp: jsonData['mintemp_c'],
      weatherCondition: jsonData['condition']['text'],
    );
  }
}
