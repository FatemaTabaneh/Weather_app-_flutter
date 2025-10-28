import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
class weatherModel {
  DateTime date;
  double temp;
  double maxtemp;
  double mintemp;
  String condition;

  weatherModel({
    required this.date,
    required this.temp,
    required this.maxtemp,
    required this.mintemp,
    required this.condition,
  });

  factory weatherModel.fromJson(dynamic data) {
    var jsondata = data['forecast']['forecastday'][0]['day'];
    return weatherModel(
      date: DateTime.parse(data['location']['localtime']),
      temp: jsondata['avgtemp_c'],
      maxtemp: jsondata['maxtemp_c'],
      mintemp: jsondata['maxtemp_c'],
      condition: jsondata['condition']['text'],
    );
  }


  String getImage() {
    String c = condition.toLowerCase();

    if (c.contains('sunny') || c.contains('clear')) {
      return 'assets/images/clear.png';
    } else if (c.contains('sleet') ||
        c.contains('snow') ||
        c.contains('hail')) {
      return 'assets/images/snow.png';
    } else if (c.contains('partly') || c.contains('cloud')) {
      return 'assets/images/cloudy.png';
    } else if (c.contains('rain') ||
        c.contains('showers') ||
        c.contains('drizzle')) {
      return 'assets/images/rainy.png';
    } else if (c.contains('thunder')) {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  }

  MaterialColor getThemColor() {
    if (condition == 'Sunny' || condition == 'Light cloud') {
      return Colors.orange;
    } else if (condition == 'Sleet' ||
        condition == 'Snow' ||
        condition == 'Hail') {
      return Colors.blue;
    } else if (condition == 'Partly cloudy') {
      return Colors.blueGrey;
    } else if (condition == 'Light rain' ||
        condition == 'Heavy rain' ||
        condition == 'Showers') {
      return Colors.blue;
    } else if (condition == 'Thunderstorm') {
      return Colors.grey;
    } else {
      return Colors.blue;
    }
  }
}
