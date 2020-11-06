import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:test_weather_app/bloc/load_state.dart';
import 'package:test_weather_app/helper/localization_helper.dart';
import 'package:test_weather_app/models/forecast_daily.dart';

class AdditionalInfo extends StatelessWidget {
  final WeatherLoaded state;

   String feelsLike;
   String humidity;
   String wind;
   String pressure;
   String cloudiness;
   String rainfall;

  AdditionalInfo(this.state){
    DailyWeather forecast = state.forecastCurrent;
    feelsLike = forecast.feelsLike.toInt().toString();
    humidity = forecast.humidity.toString();
    wind = forecast.speed.toString();
    pressure = forecast.pressure.toString();
    cloudiness = forecast.clouds.toString();
    rainfall = forecast.rain.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        //color: Colors.grey[800],
        width: MediaQuery.of(context).size.width,
        height: 100,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InfoCard(localizations['feels_like'], '$feelsLike°'),
                  InfoCard(localizations['humidity'], '$humidity%'),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InfoCard(localizations['wind'], '${wind}${localizations['wind_unit']}' ),
                  InfoCard(localizations['pressure'], '$pressure'),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InfoCard(localizations['cloudiness'], '$cloudiness%'),
                  InfoCard(localizations['rain_fall'], '${rainfall!='null'?rainfall:0}${localizations['rain_unit']}'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String description;
  final String value;

  InfoCard(this.description, this.value);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(description, style: TextStyle(color: Colors.white),maxLines: 1,),
        AutoSizeText(value, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),maxLines: 1,),
      ],
    );
  }
}

