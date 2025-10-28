import 'package:flutter/cupertino.dart';
import 'package:weather_app/models/weatherModel.dart';

class WeatherProvider extends ChangeNotifier{
  weatherModel? _weatherData;
  String? cityName;
  set weatherData(weatherModel? weather){
    _weatherData=weather;
    notifyListeners();
  }
  weatherModel? get weatherData=>_weatherData;
}