import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/weather.dart';

const _apiKey = '5cfcf7959ca85243758d78b337360fda';
const baseUrl = 'http://api.weatherapi.com';
String city = 'Seoul';

class WeatherService{
  Future<Weather> getWeatherData() async {
    final uri = Uri.parse('$baseUrl/v1/forecast.json?key=$_apiKey&q=$city&days=1&aqi=no&alerts=no');
    final response = await http.get(uri);
    if(response.statusCode == 200){
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed');
    }
  }
}