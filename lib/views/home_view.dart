import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit/weather_cubit.dart';
import 'package:weather/cubits/get_weather_cubit/weather_cubit_state.dart';
import 'package:weather/widgets/no_weather_body.dart';
import 'package:weather/widgets/search_widget.dart';
import 'package:weather/widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(80),
              child: AppBar(
                elevation: 10,
                flexibleSpace: const Center(child: SearchWidget()),
              ),
            ),
            body: BlocBuilder<WeatherCubit, WeatherCubitState>(
              builder: (context, state) {
                if (state is InitialWeatherState) {
                  return const NoWeatherBody();
                } else if (state is WeatherSucessedState) {
                  return WeatherInfoBody();
                } else {
                  return const Center(
                      child: Text(
                    'oops, Please Try Again!',
                    style: TextStyle(fontSize: 18, color: Colors.red),
                  ));
                }
              },
            )),
      ),
    );
  }
}
