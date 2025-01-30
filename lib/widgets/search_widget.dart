import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit/weather_cubit.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: TextField(
        controller: searchController,
        onSubmitted: (value) {
          BlocProvider.of<WeatherCubit>(context).getWeather(cityName: value);
          searchController.clear();
        },
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 15,
          ),
          //label: Text('Search'),
          hintText: 'Enter City Name',
          hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
          filled: true,
          fillColor: Color.fromARGB(255, 239, 239, 239),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            borderSide: BorderSide.none,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey,
            size: 18,
          ),
        ),
      ),
    );
  }
}
