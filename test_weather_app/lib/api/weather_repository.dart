import 'package:test_weather_app/api/weather_api_provider.dart';

class WeatherRepository{
WeatherProvider _weatherProvider = WeatherProvider();
Future getHourlyWeather() => _weatherProvider.getForecastHourly();
Future getDailyWeather() => _weatherProvider.getForecastDaily();
Future getHourlyWeatherOffline() => _weatherProvider.getForecastHourlyOffline();
Future getDailyWeatherOffline() => _weatherProvider.getForecastDailyOffline();
}