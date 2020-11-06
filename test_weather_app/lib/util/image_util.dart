import 'package:flutter/material.dart';

class ImageUtil{
  static AssetImage getImage(String desc){
    if(desc.toLowerCase().contains('rain') || desc.toLowerCase().contains('дождь')){
      return AssetImage('assets/rain.png');
    }else if(desc.toLowerCase().contains('thunder') || desc.toLowerCase().contains('гроза')){
      return AssetImage('assets/rain.png');
    } else if(desc.toLowerCase().contains('cloud') || desc.toLowerCase().contains('обла') || desc.toLowerCase().contains('пасмурно')){
      return AssetImage('assets/cloud.png');
    }else if(desc.toLowerCase().contains('snow') || desc.toLowerCase().contains('снег')){
      return AssetImage('assets/snow.png');
    }else if(DateTime.now().hour<20 && DateTime.now().hour>4){
      return AssetImage('assets/sun.png');
    }else{
      return AssetImage('assets/lune.png');
    }
  }
}