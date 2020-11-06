import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_weather_app/bloc/load_bloc.dart';
import 'package:test_weather_app/bloc/load_state.dart';
import 'package:test_weather_app/models/forecast_hourly.dart';
import 'package:test_weather_app/views/hourly_weather/widgets/forecst_card.dart';

class HourlyWeather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state){
          if(state is WeatherLoadingFromNetwork){
            return Center(child: CircularProgressIndicator(),);
          }
          if(state is WeatherLoaded){
            return ListView.builder(
              itemCount: 40,
                itemBuilder: (context, index){
                  return ForecastCard(state.forecastHourly.list[index]);
                }
            );
          }
          if(state is WeatherLoadingError){
            return Center(child: Text('Error', style: TextStyle(color: Colors.black, fontSize: 20),),);
          }
          return Center(child: CircularProgressIndicator(),);
        }),
    );
  }
}
