import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_weather_app/bloc/load_bloc.dart';
import 'package:test_weather_app/bloc/load_event.dart';
import 'package:test_weather_app/helper/localization_helper.dart';
import 'package:test_weather_app/util/constants.dart';
import 'package:test_weather_app/views/daily_weather/daily_weather_screen.dart';
import 'package:test_weather_app/views/hourly_weather/hourly_weather_screen.dart';

class LandingScreen extends StatelessWidget {

  Future<bool> initLocalization(context) async {
    Locale myLocale = Localizations.localeOf(context);
    String filename = myLocale.toString();
    print(filename);
    try {
      if(filename.contains('ru')){
        String resourceString =
        await rootBundle.loadString('assets/localization/$filename.json');
        dynamic decodetinfo = jsonDecode(resourceString);
        localizations = decodetinfo;
        GlobalVariables.lang = 'ru';
        print(localizations);
      }else{
        String resourceString =
        await rootBundle.loadString('assets/localization/en.json');
        dynamic decodetinfo = jsonDecode(resourceString);
        localizations = decodetinfo;
        GlobalVariables.lang = 'en';
        print(localizations);
      }
    } catch (e) {
      print(e);
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final WeatherBloc weatherBloc = BlocProvider.of<WeatherBloc>(context);
    weatherBloc.add(WeatherFromNetwork());
    initLocalization(context);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          title: Text('SimpleWeather', style: TextStyle(color: Colors.white),),
          centerTitle: true,
          backgroundColor: Colors.black.withOpacity(0.1),
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text('Дневной', style: TextStyle(color: Colors.white),),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text('Часовой', style: TextStyle(color:  Colors.white),),
              ),
            ],
          ),
        ),
          body: TabBarView(
            children: [
              DailyWeather(),
              HourlyWeather(),
            ],
          )
      ),
    );
  }
}
