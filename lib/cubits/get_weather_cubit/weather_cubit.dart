// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';

// part 'weather_cubit_state.dart';

// class WeatherCubitCubit extends Cubit<WeatherCubitState> {
//   WeatherCubitCubit() : super(WeatherCubitInitial());
// }

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit/weather_cubit_state.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/services/weather_service.dart';

class WeatherCubit extends Cubit<WeatherCubitState> {
  WeatherCubit() : super(InitialWeatherState());

  WeatherModel? weatherModel;
  getWeather({required String cityName}) async {
    try {
      weatherModel = await WeatherService(dio: Dio())
          .getWeatherService(cityName: cityName);

      emit(WeatherSucessedState(weatherModel: weatherModel!));
    } catch (e) {
      emit(WeatherfailureState());
    }
  }
}
