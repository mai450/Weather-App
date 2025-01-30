import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit/weather_cubit.dart';
import 'package:weather/cubits/get_weather_cubit/weather_cubit_state.dart';
import 'package:weather/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<WeatherCubit, WeatherCubitState>(
          builder: (context, state) {
            final condition = BlocProvider.of<WeatherCubit>(context)
                .weatherModel
                ?.weatherCondition;
            return MaterialApp(
              theme: ThemeData(
                  primarySwatch: getColorTheme(condition),
                  appBarTheme: AppBarTheme(
                      backgroundColor: getColorTheme(condition).shade300)),
              debugShowCheckedModeBanner: false,
              home: const HomeView(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getColorTheme(String? condition) {
  if (condition == null) {
    return Colors.lightBlue;
  }
  switch (condition) {
    case 'Sunny':
    case 'Clear':
      return Colors.orange;
    case 'Partly cloudy':
    case 'Cloudy':
    case 'Overcast':
      return Colors.blueGrey;
    case 'Mist':
    case 'Fog':
      return Colors.grey;
    case 'Patchy rain possible':
    case 'Light rain':
    case 'Moderate rain at times':
    case 'Moderate rain':
    case 'Heavy rain at times':
    case 'Heavy rain':
      return Colors.blue;
    case 'Patchy snow possible':
    case 'Light snow':
    case 'Moderate snow':
    case 'Heavy snow':
      return Colors.lightBlue;
    case 'Thundery outbreaks possible':
    case 'Patchy light rain with thunder':
    case 'Moderate or heavy rain with thunder':
      return Colors.deepPurple;
    case 'Patchy sleet possible':
    case 'Patchy freezing drizzle possible':
    case 'Light freezing rain':
    case 'Moderate or heavy freezing rain':
      return Colors.cyan;
    case 'Light sleet':
    case 'Moderate or heavy sleet':
      return Colors.teal;
    case 'Ice pellets':
    case 'Light showers of ice pellets':
    case 'Moderate or heavy showers of ice pellets':
      return Colors.indigo;
    default:
      return Colors.blue; // Default color for unhandled conditions.
  }
}
