import 'package:flutter/material.dart';
import 'package:weather_app/Provider/weather_provider.dart';
import 'package:weather_app/Screens/homePage.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(ChangeNotifierProvider(
      create:(context){
        return WeatherProvider();
      },
      child: weather()));
}

class weather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
       MaterialApp(
        theme: ThemeData(
          primarySwatch: Provider.of<WeatherProvider>(context).weatherData ==null ?Colors.blue : Provider.of<WeatherProvider>(context).weatherData!.getThemColor(),
         // brightness: Brightness.light
        ),
        debugShowCheckedModeBanner: false,
        home: homePage(),
      );
  }
}
