abstract class WeatherEvent{}

class WeatherFromNetwork extends WeatherEvent{}

class WeatherFromStorage extends WeatherEvent{}

class UpdateWeather extends WeatherEvent{
  int index;
  UpdateWeather(this.index);
}

