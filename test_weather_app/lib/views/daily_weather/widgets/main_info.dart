import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:test_weather_app/bloc/load_state.dart';
import 'package:test_weather_app/util/image_util.dart';

class MainInfo extends StatelessWidget {
  final WeatherLoaded state;

  MainInfo(this.state);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height* 0.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AutoSizeText(state.forecastDaily.name,style: TextStyle(fontSize: 30,color: Colors.white, fontWeight: FontWeight.bold),maxLines: 1,),
          AutoSizeText(state.forecastCurrent.desc,style: TextStyle(fontSize: 20,color: Colors.white),maxLines: 1,),
          Container(
            width: MediaQuery.of(context).size.width*0.5,
            height: MediaQuery.of(context).size.width*0.5,
            decoration: BoxDecoration(
                image: DecorationImage(image: ImageUtil.getImage(state.forecastCurrent.desc), fit: BoxFit.cover)
            ),
          ),
          AutoSizeText('${state.forecastCurrent.temp.toInt().toString()}°',style: TextStyle(fontSize: 60,color: Colors.white),maxLines: 1,),
        ],
      ),
    );
  }
}
