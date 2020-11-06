import 'package:test_weather_app/models/forecast_daily.dart';
import 'package:test_weather_app/models/forecast_hourly.dart';

abstract class WeatherState{}

class WeatherEmpty extends WeatherState{}

class WeatherLoadingFromNetwork extends WeatherState{}

class WeatherLoadingFromAssets extends WeatherState{}

class WeatherLoaded extends WeatherState{
  ForecastHourly forecastHourly;
  ForecastDaily forecastDaily;
  int index;
  DailyWeather forecastCurrent;

  WeatherLoaded(this.forecastHourly, this.forecastDaily, this.index ){
    forecastCurrent = forecastDaily.list[index];
  }

}


class WeatherLoadingError extends WeatherState{}