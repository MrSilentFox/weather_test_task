class ForecastDaily{
  String name;
  List<DailyWeather> list;

  ForecastDaily({this.name, this.list});

  ForecastDaily.fromJson(Map<String, dynamic> json){
    name = json['city']['name'];
    if (json['list'] != null) {
      list = new List<DailyWeather>();
      json['list'].forEach((v) {
        list.add(new DailyWeather.fromJson(v));
      });
    }
  }
}

class DailyWeather{
  String desc;
  num dt;
  num temp;
  num feelsLike;
  num pressure;
  num humidity;
  num speed;
  num deg;
  num clouds;
  num rain;

  DailyWeather(this.desc, this.dt, this.temp, this.feelsLike, this.pressure, this.humidity, this.speed, this.deg, this.clouds, this.rain);

  DailyWeather.fromJson(Map<String, dynamic > json){
    desc = json['weather'][0]['description'];
    dt = json['dt'];
    temp = json['temp']['day'];
    feelsLike = json['feels_like']['day'];
    pressure = json['pressure'];
    humidity = json['humidity'];
    speed = json['speed'];
    deg = json['deg'];
    clouds = json['clouds'];
    rain = json['rain'];
  }
}