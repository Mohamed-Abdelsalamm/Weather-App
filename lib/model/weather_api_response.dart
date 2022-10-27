import 'package:weather/model/city.dart';
import 'package:weather/model/list_weather.dart';

class WeatherAPIResponse {
  late String cod;
  late int message;
  late int cnt;
  late List<ListWeather> list;
  late City city;


  WeatherAPIResponse({
    required this.cod,
    required this.message,
    required this.cnt,
    required this.list,
    required this.city,
  });

  WeatherAPIResponse.fromMap(Map<String ,dynamic> map) {
    this.cod = map['cod'];
    this.message = map['message'];
    this.cnt = map['cnt'];
    this.list =  [];
    (map['list'] as List).forEach((element) {this.list.add(ListWeather.fromMap(element));});
    this.city =City.fromMap(map['city']);
  }

  Map  toMap(){
    List <Map<String,dynamic>> weatherList =[];
    this.list.forEach((element) {weatherList.add(element.toMap());});
    Map<String ,dynamic> map={
      'cod'     : this.cod,
      'message' : this.message,
      'cnt'     : this.cnt,
      'list'    : weatherList,
      'city'    :this.city.toMap(),
    };
    return map;
  }
}
