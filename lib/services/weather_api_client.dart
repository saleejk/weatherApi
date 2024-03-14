import 'dart:convert';

import 'package:flutter_application_1/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherApiClient {
  Future<Weather>? getCurrentWeather(String location) async {
    var endpoint = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=e01ce1cc2cd7f4349e839554f110ddfb&units=metrics");
    var responce = await http.get(endpoint);
    var body = jsonDecode(responce.body);
    print(Weather.fromJson(body).cityName);
    return Weather.fromJson(body);
  }
}
