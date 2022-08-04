class Urls {
  static const String baseUrl = 'api.openweathermap.org/data';
  static const String apiKey = 'edc5948cd7e9cc886b416b7719b0f31a';
  static String currentWeather(double lat, double lon) => '$baseUrl/2.5/weather?lat=$lat&lon=$lon.8456&appid=edc5948cd7e9cc886b416b7719b0f31a';
}