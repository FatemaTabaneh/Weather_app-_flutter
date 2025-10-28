import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Screens/homePage.dart';
import 'package:weather_app/models/weatherModel.dart';
import 'package:weather_app/services/WeatherService.dart';

import '../Provider/weather_provider.dart';

class searchPage extends StatelessWidget {
  String? cityName;
  VoidCallback? updateui;
  searchPage({this.updateui});
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
                onTap: () async{
                  weatherService service = weatherService();
                  weatherModel weather = await service.getWeather(cityName: cityName!);
                  Provider.of<WeatherProvider>(context,listen: false).weatherData=weather; //access
                  Provider.of<WeatherProvider>(context,listen: false).cityName=cityName;
                  Navigator.pop(context);
                },

              ),
              contentPadding: EdgeInsets.symmetric(vertical: 32,horizontal: 10),
            ),
            onChanged: (data){
              cityName=data;
            },
            onSubmitted: (data) async{
              cityName=data;
              weatherService service = weatherService();
              weatherModel weather = await service.getWeather(cityName: cityName!);
              Provider.of<WeatherProvider>(context,listen: false).weatherData=weather; //access
              Provider.of<WeatherProvider>(context,listen: false).cityName=cityName;
              Navigator.pop(context);
            },
          )
        ),
      )
    );
  }
}
//global variable
