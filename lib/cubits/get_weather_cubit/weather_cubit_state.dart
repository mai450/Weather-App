import 'package:weather/models/weather_model.dart';

class WeatherCubitState {}

class InitialWeatherState extends WeatherCubitState {}

class WeatherSucessedState extends WeatherCubitState {
  final WeatherModel weatherModel;

  WeatherSucessedState({required this.weatherModel});
}

class WeatherfailureState extends WeatherCubitState {}
