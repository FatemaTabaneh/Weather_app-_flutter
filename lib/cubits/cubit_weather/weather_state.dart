import 'package:weather_app/models/weatherModel.dart';

abstract class weatherState{}
class weatherInitial extends weatherState{}
class weatherLoading extends weatherState{}
class weatherSucces extends weatherState{
  weatherModel model;
  weatherSucces({required this.model});
}
class weatherFailure extends weatherState{}