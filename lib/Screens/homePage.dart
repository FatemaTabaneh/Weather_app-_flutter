import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Screens/searchPage.dart';
import 'package:weather_app/cubits/cubit_weather/weather_cubit.dart';
import 'package:weather_app/cubits/cubit_weather/weather_state.dart';
import '../models/weatherModel.dart';

class homePage extends StatelessWidget {
  weatherModel? weathermodel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return searchPage();
                  },
                ),
              );
            },
            icon: Icon(Icons.search, color: Colors.white),
          ),
        ],
        backgroundColor: weathermodel?.getThemColor() ?? Colors.blue,
        elevation: 5,
        shadowColor: Colors.grey,
        title: Text(
          'Weather App',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
      body: BlocBuilder<WeatherCubit, weatherState>(
        builder: (context, state) {
          if (state is weatherLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is weatherSucces) {
            return succes(weathermodel: state.model);
          } else if (state is weatherFailure) {
            return Center(child: Text('something is wrong , try again'));
          } else {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'there is no weather 😔 start',
                    style: TextStyle(fontSize: 30),
                  ),
                  Text('Searching Now 🔍', style: TextStyle(fontSize: 30)),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

class succes extends StatelessWidget {
  const succes({super.key, required this.weathermodel});

  final weatherModel? weathermodel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            weathermodel!.getThemColor(),
            weathermodel!.getThemColor()[300]!,
            weathermodel!.getThemColor()[100]!,
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(flex: 1),
          Text(
            BlocProvider.of<WeatherCubit>(context).cityName!,
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          Text('${weathermodel!.date.day}', style: TextStyle(fontSize: 24)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 70),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(weathermodel!.getImage()),
                Text(
                  '${weathermodel!.temp.toInt()}°C',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                Column(
                  children: [
                    Text(
                      'max :${weathermodel!.maxtemp.toInt()}ْْ°C',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      'min :${weathermodel!.mintemp.toInt()}°C',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Text(
            weathermodel!.condition,
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          Spacer(flex: 3),
        ],
      ),
    );
  }
}
