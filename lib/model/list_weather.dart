import 'package:weather/model/main_temp.dart';
import 'package:weather/model/weather.dart';

class ListWeather {
  late MainWeather main;
  late List <Weather> weather;
  late String dt_txt;

  ListWeather({
   required this.main,
   required this.weather,
   required this.dt_txt,
  });

  ListWeather.fromMap(Map<String ,dynamic> map){
    this.main  = MainWeather.fromMap(map['main']);
    this.weather =[];
    (map['weather'] as List).forEach((element) {this.weather.add(Weather.fromMap(element)); });
    this.dt_txt = map['dt_txt'];
  }

  Map<String ,dynamic> toMap(){
    List<Map<String,dynamic>> weather =[];
    this.weather.forEach((element) {weather.add(element.toMap());});
    Map<String ,dynamic> map = {
      'main' :  this.main.toMap(),
      'weather' :  weather,
      'dt_txt' :  this.dt_txt ,
    };
    return map;
  }
}
