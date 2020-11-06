import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_weather_app/bloc/load_bloc.dart';
import 'package:test_weather_app/bloc/load_state.dart';
import 'package:test_weather_app/views/daily_weather/widgets/main_info.dart';
import 'package:test_weather_app/views/daily_weather/widgets/week_forecast.dart';
import 'package:test_weather_app/views/daily_weather/widgets/additional_info.dart';

class DailyWeather extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state){
          if(state is WeatherLoadingFromNetwork){
            return Center(child: CircularProgressIndicator(),);
          }
          if(state is WeatherLoaded){
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(child: Center(child: Column(
                    children: [
                      MainInfo(state),
                      WeekForecast(state),
                      AdditionalInfo(state),
                    ],
                  ),),),
                ],
              ),
            );
          }
          if(state is WeatherLoadingError){
            return Center(child: Text('Error', style: TextStyle(color: Colors.black, fontSize: 20),),);
          }
          return Center(child: CircularProgressIndicator(),);
        },
      ),
    );
  }
}
