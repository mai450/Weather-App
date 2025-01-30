import 'package:dio/dio.dart';
import 'package:weather/models/weather_model.dart';

class WeatherService {
  final Dio dio;

  WeatherService({required this.dio});

  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = '939913a9c72243faaa5144336241112';

  Future<WeatherModel> getWeatherService({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');

      WeatherModel weatherModel = WeatherModel.fromjson(response.data);

      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage =
          e.response?.data['error']['message'] ?? 'oops, please try again';
      throw Exception(errorMessage);
    } catch (e) {
      throw Exception('oops , there was an error');
    }
  }
}
