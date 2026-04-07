import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/cubit_weather/weather_state.dart';
import 'package:weather_app/models/weatherModel.dart';

import '../../services/WeatherService.dart';

class WeatherCubit extends Cubit<weatherState>{
  WeatherCubit(this.weather_service):super(weatherInitial());
  weatherService weather_service;
  weatherModel? model;
  String? cityName;
  void getWeather({required String cityName})async{
    this.cityName=cityName;
    emit(weatherLoading());
   try {
      model= await weather_service.getWeather(cityName: cityName);
     emit(weatherSucces(model: model!));
   } on Exception catch (e) {
     print(e);
     emit(weatherFailure());
   }


  }

}