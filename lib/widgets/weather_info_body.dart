import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather/cubits/get_weather_cubit/weather_cubit.dart';
import 'package:weather/main.dart';
import 'package:weather/models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<WeatherCubit>(context).weatherModel!;
    return Container(
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          getColorTheme(weatherModel.weatherCondition).shade200,
          getColorTheme(weatherModel.weatherCondition).shade300,
          getColorTheme(weatherModel.weatherCondition).shade400,
          getColorTheme(weatherModel.weatherCondition).shade400,
          getColorTheme(weatherModel.weatherCondition),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(
            flex: 1,
          ),
          Text(
            weatherModel.cityName,
            style: GoogleFonts.inder(
              textStyle: const TextStyle(
                  fontSize: 34,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'Updated at ${weatherModel.dateTime.hour}:${weatherModel.dateTime.minute}',
            style: GoogleFonts.inder(
              textStyle: const TextStyle(fontSize: 14, color: Colors.black),
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          // const SizedBox(
          //   height: 50,
          // ),
          SizedBox(
            height: 200,
            width: 200,
            child: Image.network(
              'https:${weatherModel.image}',
              fit: BoxFit.cover,
            ),
          ),

          Text(
            '${weatherModel.temp.toString()}°C',
            style: GoogleFonts.inder(
              textStyle:
                  const TextStyle(fontSize: 34, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            weatherModel.weatherCondition,
            style: GoogleFonts.inder(
              textStyle: const TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          const Spacer(
            flex: 3,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    'MaxTemp',
                    style: GoogleFonts.inder(
                        textStyle: const TextStyle(fontSize: 16)),
                  ),
                  Text(
                    '${weatherModel.maxTemp.round()}',
                    style: GoogleFonts.inder(
                        textStyle: const TextStyle(fontSize: 16)),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
                width: 80,
                child: VerticalDivider(
                  color: Colors.black,
                ),
              ),
              Column(
                children: [
                  Text(
                    'MinTemp',
                    style: GoogleFonts.inder(
                        textStyle: const TextStyle(fontSize: 16)),
                  ),
                  Text(
                    '${weatherModel.minTemp.round()}',
                    style: GoogleFonts.inder(
                        textStyle: const TextStyle(fontSize: 16)),
                  ),
                ],
              ),
            ],
          ),

          // const SizedBox(
          //   height: 50,
          // ),

          Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}
