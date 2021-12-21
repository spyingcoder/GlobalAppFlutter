//ff330fe21900a18144f6bba7010b5439
//b022cd9982bc2ce921821b96126ddfe6
//http://api.openweathermap.org/data/2.5/weather
//?q=london&appid=b022cd9982bc2ce921821b96126ddfe6
import 'dart:convert';

import 'package:getting_started_with_flutter/data/weather.dart';
import 'package:http/http.dart' as http;

class HttpHelper {
  final String authority = 'api.openweathermap.org';
  final String path = 'data/2.5/weather';
  final String apiKey = 'b022cd9982bc2ce921821b96126ddfe6';

  Future<Weather> getWeather(String location) async {
    Map<String, dynamic> parameters = {'q': location, 'appid': apiKey};
    var url = Uri.https(authority, path, parameters);
    http.Response result = await http.get(url);
    Map<String, dynamic> data = json.decode(result.body);
    Weather weather = Weather.fromJson(data);
    return weather;
  }
}
