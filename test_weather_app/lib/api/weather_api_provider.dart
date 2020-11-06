import 'dart:convert';
import 'dart:developer';
import 'package:geolocator/geolocator.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:test_weather_app/models/forecast_daily.dart';
import 'package:test_weather_app/models/forecast_hourly.dart';
import 'package:test_weather_app/util/constants.dart';

class WeatherProvider{

  Future<ForecastHourly> getForecastHourly() async{

    Map<String, String> queryParameters;

    try{
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      queryParameters = {
        'APPID' : GlobalVariables.WEATHER_APP_ID,
        'units' : 'metric',
        'lat' : position.latitude.toString(),
        'lon' : position.longitude.toString(),
        'lang' : GlobalVariables.lang
      };
    }catch(e){
      print(e);
      queryParameters = {
        'APPID' : GlobalVariables.WEATHER_APP_ID,
        'units' : 'metric',
        'q' : 'Киев',
        'lang' : GlobalVariables.lang
      };
    }

    var uri = Uri.https(GlobalVariables.WEATHER_BASE_URL_DOMAIN, GlobalVariables.WEATHER_FORECAST_PATH,queryParameters);

    log('request: ${uri.toString()}');
    var response = await http.get(uri);

    print('response: ${response.body}');
    print('status code: ${response.statusCode}');
    if(response.statusCode==200){
      final dir = await getApplicationDocumentsDirectory();
      Hive.init(dir.path);
      var box = await Hive.openBox('hourlyBox');
      box.put('data', response.body);
      return ForecastHourly.fromJson(json.decode(response.body));
    }else{
      throw Exception('Error response');
    }
  }

  Future<ForecastDaily> getForecastDaily() async{

    Map<String, String> queryParameters;

    try{
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      queryParameters = {
        'APPID' : GlobalVariables.WEATHER_APP_ID,
        'units' : 'metric',
        'lat' : position.latitude.toString(),
        'lon' : position.longitude.toString(),
        'lang' : 'ru'
      };
    }catch(e){
      print(e);
      queryParameters = {
        'APPID' : GlobalVariables.WEATHER_APP_ID,
        'units' : 'metric',
        'q' : 'Киев',
        'lang' : 'ru'
      };
    }

    var uri = Uri.https(GlobalVariables.WEATHER_BASE_URL_DOMAIN, GlobalVariables.WEATHER_FORECAST_PATH + '/daily',queryParameters);

    log('request: ${uri.toString()}');

    var response = await http.get(uri);

    print('response: ${response.body}');
    print('status code: ${response.statusCode}');
    if(response.statusCode==200){
      final dir = await getApplicationDocumentsDirectory();
      Hive.init(dir.path);
      var box = await Hive.openBox('dailyBox');
      box.put('data', response.body);
      return ForecastDaily.fromJson(json.decode(response.body));
    }else{
      throw Exception('Error response');
    }
  }

  Future<ForecastHourly> getForecastHourlyOffline() async{

    final dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    var box = await Hive.openBox('hourlyBox');
    return ForecastHourly.fromJson(json.decode(box.get('data')));

  }

  Future<ForecastDaily> getForecastDailyOffline() async{

    final dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    var box = await Hive.openBox('dailyBox');
    return ForecastDaily.fromJson(json.decode(box.get('data')));

  }
}