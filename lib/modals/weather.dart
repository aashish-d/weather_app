// ignore_for_file: non_constant_identifier_name, prefer_typing_uninitialized_variables

class Weather {
  var temp;
  var cityName;
  var wind;
  var pressure;
  var humidity;
  var gust;
  var visibility;
  var timeZone;
  var icon;
  var main;
  var description;
  var code;
  var uv;

  Weather(
      {required this.cityName,
      required this.humidity,
      required this.pressure,
      required this.temp,
      required this.visibility,
      required this.gust,
      required this.timeZone,
      required this.wind,
      required this.icon,
      required this.uv,
      required this.code,
      required this.description});

  Weather.fromJson(
    Map<String, dynamic> json,
  ) {
    cityName = json["location"]["name"];
    humidity = json["current"]["humidity"];
    pressure = json["current"]["pressure_mb"];
    temp = json["current"]["temp_c"];
    uv = json["current"]["uv"];
    visibility = json["current"]["vis_km"];
    wind = json["current"]["wind_kph"];
    timeZone = json["timezon"];
    icon = json["current"]["condition"]["icon"];
    description = json["current"]["condition"]["text"];
    code = json["current"]["condition"]["code"];
    gust = json["current"]["gust_kph"];
  }
}

String getWeathherIcon(int code) {
  if (code == 1000) {
    return "sun/26.png";
  } else if (1000 < code || code < 1030) {
    return "sun/4.png";
  } else if (1062 < code || code < 1073) {
    return "sun/7.png";
  } else {
    return "sun/27.png";
  }
  return "";
}
