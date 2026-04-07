import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weatherModel.dart';

class weatherService {
  Future<weatherModel> getWeather({required String cityName}) async {
    String baseUrl = 'https://api.weatherapi.com/v1';
    String apiKey = 'db3651ddd63d4bf8923125225251410';
    Uri url = Uri.parse(
      '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7',
    );
    //هون أرسلت طلب GET عبر مكتبة http إلى الرابط السابق.
    http.Response response = await http.get(url);

    Map<String, dynamic> data = jsonDecode(response.body);

    weatherModel weather = weatherModel.fromJson(data);

    return weather;
  }
}
