import 'dart:convert';
import 'package:http/http.dart' as http;

class Weather {
  String? cityName = '';
  double? temp = 0;
  double? wind = 0;
  int? humidity = 0;
  double? feels_like = 0;
  int? pressure = 0;
  String? icon = '';

  Weather({
    this.cityName,
    this.temp,
    this.wind,
    this.humidity,
    this.feels_like,
    this.pressure,
    this.icon,
  });

  Weather.fromJson(Map<String, dynamic> json) {
    cityName = json["name"];
    temp = json["main"]["temp"];
    wind = json["wind"]["speed"];
    humidity = json["main"]["humidity"];
    feels_like = json["main"]["feels_like"];
    pressure = json["main"]["pressure"];
    icon = json["weather"][0]["icon"];
  }
}

class WeatherAPI {
  Future<Weather>? getCurrentWeather(String location) async {
    var endpoint = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=2b63ba11c895762e1f524747a71e9387&units=metric");
    var response = await http.get(endpoint);
    var body = jsonDecode(response.body);
    return Weather.fromJson(body);
  }
}
