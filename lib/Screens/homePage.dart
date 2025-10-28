import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Provider/weather_provider.dart';
import 'package:weather_app/Screens/searchPage.dart';
import 'package:weather_app/main.dart';import '../models/weatherModel.dart';

class homePage extends StatefulWidget {
   homePage({super.key});
  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  weatherModel? weathermodel;
  void updateUi(){
    setState(() {
    });
  }
  @override
  Widget build(BuildContext context) {
  weathermodel=Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return searchPage(updateui: updateUi,);
                  },
                ),
              );
            },
            icon: Icon(Icons.search,color: Colors.white,),
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
      body:weathermodel==null ?
      Center(
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
      )
      :Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors:[
                weathermodel!.getThemColor(),
                weathermodel!.getThemColor()[300]!,
                weathermodel!.getThemColor()[100]!
              ],
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(flex: 1,),
            Text(Provider.of<WeatherProvider>(context).cityName!,style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),),
            Text('${weathermodel!.date.day}',style: TextStyle(fontSize: 24)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 70),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(weathermodel!.getImage()),
                  Text('${weathermodel!.temp.toInt()}°C',style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold)),
                  Column(
                    children: [
                      Text('max :${weathermodel!.maxtemp.toInt()}ْْ°C',style: TextStyle(fontSize: 18),),
                      Text('min :${weathermodel!.mintemp.toInt()}°C',style: TextStyle(fontSize: 18))
                    ],
                  )
                ],
              ),
            ),
            Text(weathermodel!.condition,style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold)),
            Spacer(flex: 3,)
          ],
        ),
      ),
    );
  }
}
