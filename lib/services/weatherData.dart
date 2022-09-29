import 'dart:convert';
import 'package:http/http.dart' as http;
import '../modals/weather.dart';

class WeatherData {
  Future<Weather> getData(var lati, var longi) async {
    var uriCall = Uri.parse(
        "http://api.weatherapi.com/v1/current.json?key=c4183a8a97604514b6c113342221709&q=$lati,$longi&aqi=no");

    var response = await http.get(uriCall);
    var body = jsonDecode(response.body);

    return Weather.fromJson(body);
  }
}
