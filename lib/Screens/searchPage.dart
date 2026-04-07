import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_app/cubits/cubit_weather/weather_cubit.dart';

class searchPage extends StatelessWidget {
  String? cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Search a City',style: TextStyle(color: Colors.white, fontSize: 20)),
        iconTheme: IconThemeData(
          color: Colors.white
        ),
      ),
      body:  Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child:TextField(
            decoration: InputDecoration(
              hintText: 'Enter a City',
              label:Text('search'),
              border: OutlineInputBorder(),
              suffixIcon: GestureDetector(child: Icon(Icons.search),
                onTap: () {}

              ),
              contentPadding: EdgeInsets.symmetric(vertical: 32,horizontal: 10),
            ),
            onChanged: (data){
              cityName=data;
            },
            onSubmitted: (data) async{
              cityName=data;
              BlocProvider.of<WeatherCubit>(context).getWeather(cityName: cityName!);
              Navigator.pop(context);
            },
          )
        ),
      )
    );
  }
}
//global variable
