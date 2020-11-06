import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:test_weather_app/bloc/load_bloc.dart';
import 'package:test_weather_app/bloc/load_event.dart';
import 'package:test_weather_app/bloc/load_state.dart';
import 'package:test_weather_app/helper/localization_helper.dart';
import 'package:test_weather_app/util/icon_util.dart';

class WeekForecast extends StatelessWidget {
  final WeatherLoaded state;

  WeekForecast(this.state);

  @override
  Widget build(BuildContext context) {
    final WeatherBloc weatherBloc = BlocProvider.of<WeatherBloc>(context);

    return Container(
      height: MediaQuery.of(context).size.height*0.1,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WeekCard(0, state, weatherBloc),
          WeekCard(1, state, weatherBloc),
          WeekCard(2, state, weatherBloc),
          WeekCard(3, state, weatherBloc),
          WeekCard(4, state, weatherBloc),
        ],
      ),
    );
  }
}

class WeekCard extends StatelessWidget {
  final WeatherLoaded state;
  final WeatherBloc weatherBloc;
  final int index;
  String date;

  WeekCard(this.index ,this.state, this.weatherBloc){
    date =  DateFormat('EEEE').format(DateTime.fromMillisecondsSinceEpoch(state.forecastDaily.list[index].dt*1000));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        color: state.index == index ? Colors.white : Colors.transparent,
        width: MediaQuery.of(context).size.width / 5,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Column(
              children: [
                IconUtil.getIcon(state.forecastDaily.list[index].desc, state.index == index ? Colors.black : Colors.white),
                AutoSizeText(
                  '${state.forecastDaily.list[index].temp.toInt().toString()}°',
                  style: TextStyle(
                      color: state.index == index ? Colors.black : Colors.white),
                  maxLines: 1,
                ),
                AutoSizeText(localizations['day_name']['$date'],
                  style: TextStyle(color: state.index == index ? Colors.black : Colors.white, fontSize: 14),
                  maxLines: 1,
                )
              ],
            ),
          ),
        ),
      ),
      onTap: () {
        weatherBloc.add(UpdateWeather(index));
      },
    );
  }
}

