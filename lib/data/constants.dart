class Urls {
  static const String baseUrl = 'http://api.openweathermap.org/data';
  static const String apiKey = 'edc5948cd7e9cc886b416b7719b0f31a';
  static String currentWeather(double lon, double lat) =>
      '$baseUrl/2.5/weather?lat=$lat&lon=$lon&appid=edc5948cd7e9cc886b416b7719b0f31a';
  static String weatherIcon(String iconCode) =>
      'http://openweathermap.org/img/wn/$iconCode@2x.png';
}
