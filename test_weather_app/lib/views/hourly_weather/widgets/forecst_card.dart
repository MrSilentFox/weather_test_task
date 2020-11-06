import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:test_weather_app/helper/localization_helper.dart';
import 'package:test_weather_app/models/forecast_hourly.dart';
import 'package:test_weather_app/util/icon_util.dart';

class ForecastCard extends StatelessWidget {
  HourlyForecast element;
  TextStyle _styleLow = TextStyle(color: Colors.white);
  TextStyle _styleLowTransparent = TextStyle(color: Colors.white.withOpacity(0.7));
  TextStyle _styleHigh = TextStyle(color: Colors.white, fontSize: 21);

  ForecastCard(this.element);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        color: Colors.transparent,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(element.dtTxt.substring(12),style: _styleHigh,maxLines: 1,),
                      AutoSizeText(element.dtTxt.substring(0,11),style: _styleLow,maxLines: 1,),
                    ],
                  ),
                  SizedBox(width: 10,),
                  IconUtil.getIcon(element.desc, Colors.white),
                  SizedBox(width: 10,),
                  AutoSizeText('${element.temp.toInt().toString()}°',style: _styleHigh,maxLines: 1,)
                ],
              ),
            ),
            ExpansionTile(
              title: Text(localizations['more'], style: _styleLowTransparent,),
              trailing: Icon(Icons.arrow_drop_down,color: Colors.white,),
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(localizations['feels_like'],style: _styleLow,maxLines: 1,),
                          AutoSizeText(localizations['humidity'],style: _styleLow,maxLines: 1,),
                          AutoSizeText(localizations['cloudiness'],style: _styleLow,maxLines: 1,),
                          AutoSizeText(localizations['pressure'],style: _styleLow,maxLines: 1,),
                        ],
                      ),
                      SizedBox(width: 30,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText('${element.feelsLike.toInt().toString()}°',style: _styleLow,maxLines: 1,),
                          AutoSizeText('${element.humidity.toString()}%',style: _styleLow,maxLines: 1,),
                          AutoSizeText('${element.clouds.toString()}%',style: _styleLow,maxLines: 1,),
                          AutoSizeText('${element.pressure.toString()}',style: _styleLow,maxLines: 1,),
                        ],
                      ),
                    ],
                  ),
                )

              ],
            )
          ],
        ),
      ),
    );
  }
}
