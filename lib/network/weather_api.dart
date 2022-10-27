import 'dart:convert';

import '../model/weather_api_response.dart';
import 'package:http/http.dart' as http;

class WeatherAPI {
  Future<WeatherAPIResponse> getData() async {
    final response = await http.get(
      Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast?q=cairo&units=metric&appid=61557d5bb3f57c5cb82f06310c8fed92',
      )
    );
    if(response.statusCode >= 200 && response.statusCode <= 300 ) {
       final Map<String ,dynamic> body = jsonDecode(response.body);
       WeatherAPIResponse weatherAPIResponse = WeatherAPIResponse.fromMap(body);
       // print(response.body);
       return weatherAPIResponse;
    }
    else{
      throw('erorr' + response.body);
    }
  }
}
