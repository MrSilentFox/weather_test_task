import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:geolocator/geolocator.dart';
import 'package:test_weather_app/bloc/load_bloc.dart';
import 'package:test_weather_app/views/landing/landing_scren.dart';
import 'package:test_weather_app/views/splash_screen/splash_screen.dart';

import 'api/weather_repository.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final WeatherRepository _weatherRepository = WeatherRepository();

  @override
  Widget build(BuildContext context) {

    Geolocator.requestPermission();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    SystemChrome.setEnabledSystemUIOverlays([]);

    return MaterialApp(

      routes: {
        '/home': (context) =>
            BlocProvider(create: (context) => WeatherBloc(_weatherRepository),child: LandingScreen(),)
      },

      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''),
        const Locale('ru', ''),
      ],
      title: 'Flutter Demo',
      home:SplashScreen(),
    );
  }
}

