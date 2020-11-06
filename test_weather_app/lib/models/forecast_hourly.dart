class ForecastHourly {
  List<HourlyForecast> list;

  ForecastHourly({this.list});

  ForecastHourly.fromJson(Map<String, dynamic> json){
    if (json['list'] != null) {
      list = new List<HourlyForecast>();
      json['list'].forEach((v) {
        list.add(new HourlyForecast.fromJson(v));
      });
    }
  }
}

class HourlyForecast{
  String dtTxt;
  String desc;
  num temp;
  num feelsLike;
  num humidity;
  num clouds;
  num pressure;

  HourlyForecast(this.dtTxt, this.desc, this.temp, this.feelsLike, this.humidity, this.clouds, this.pressure);

  HourlyForecast.fromJson(Map<String, dynamic> json){
      dtTxt = json['dt_txt'];
      desc = json['weather'][0]['description'];
      temp = json['main']['temp'];
      feelsLike = json['main']['feels_like'];
      humidity = json['main']['humidity'];
      clouds = json['clouds']['all'];
      pressure = json['main']['pressure'];
  }
}