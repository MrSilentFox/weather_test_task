import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_weather_app/api/weather_repository.dart';
import 'package:test_weather_app/bloc/load_event.dart';
import 'package:test_weather_app/bloc/load_state.dart';
import 'package:test_weather_app/models/forecast_daily.dart';
import 'package:test_weather_app/models/forecast_hourly.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState>{
  WeatherRepository _weatherRepository;
  ForecastHourly _forecastHourly;
  ForecastDaily _forecastDaily;

  WeatherBloc(this._weatherRepository) : super(WeatherEmpty());


  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async*{
    if(event is WeatherFromNetwork){
        yield WeatherLoadingFromNetwork();
        try{
            _forecastHourly = await _weatherRepository.getHourlyWeather();
            _forecastDaily = await _weatherRepository.getDailyWeather();
            yield WeatherLoaded(_forecastHourly, _forecastDaily, 0);
        }catch(e){
            super.add(WeatherFromStorage());
            yield WeatherLoadingFromAssets();
            print(e);
        }
    }else if(event is WeatherFromStorage){
      try{
        _forecastHourly = await _weatherRepository.getHourlyWeatherOffline();
        _forecastDaily = await _weatherRepository.getDailyWeatherOffline();
        yield WeatherLoaded(_forecastHourly, _forecastDaily, 0);
      }catch (e){
        print(e);
        yield WeatherLoadingError();
      }
    }else if(event is UpdateWeather){
      yield WeatherLoaded(_forecastHourly, _forecastDaily, event.index);
    }
  }


}

