import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/days.dart';
import 'package:weather/model/weather_api_response.dart';
import 'package:weather/network/weather_api.dart';
import 'package:weather/model/list_weather.dart';
import 'package:weather/model/main_temp.dart';
import 'package:weather/model/weather.dart';

class Home extends StatelessWidget {

  late WeatherAPIResponse responseObject;

  Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          elevation: 0,
          title: Text('WeatherApp',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            colors: [
              Colors.red,
              Colors.orangeAccent,
            ],
          ),),
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                child: FutureBuilder<WeatherAPIResponse>(
                  future: WeatherAPI().getData(),
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.hasData) {
                      responseObject = snapshot.data;
                      print(snapshot.data!.toMap().toString());
                      return Column(
                        children: [
                          SizedBox(
                            height: 80,
                          ),
                          Text(
                            '${responseObject.city.name}',
                            style: TextStyle(color: Colors.white, fontSize: 30,fontWeight: FontWeight.bold),
                          ),
                          Image.network(
                            'http://openweathermap.org/img/wn/${responseObject.list[0].weather[0].icon}@2x.png',
                            scale: 0.5,
                          ),
                          Text(
                            '${(responseObject.list[0].main.temp).round()}',
                            style: TextStyle(color: Colors.white, fontSize: 50),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,

                            children: [
                              Text(
                                'H:${(responseObject.list[0].main.temp_max).round()}',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                              SizedBox(width: 15,),
                              Text(
                                'L:${(responseObject.list[0].main.temp_min).round()}',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 100,
                          ),
                          Expanded(
                            child: Center(
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  Days(day: (DateTime.parse(responseObject.list[08].dt_txt)), icon: '${responseObject.list[08].weather[0].icon}' , temp: (responseObject.list[08].main.temp),),
                                  Days(day: (DateTime.parse(responseObject.list[16].dt_txt)), icon: '${responseObject.list[16].weather[0].icon}' , temp: (responseObject.list[16].main.temp),),
                                  Days(day: (DateTime.parse(responseObject.list[24].dt_txt)), icon: '${responseObject.list[24].weather[0].icon}' , temp: (responseObject.list[24].main.temp),),
                                  Days(day: (DateTime.parse(responseObject.list[32].dt_txt)), icon: '${responseObject.list[32].weather[0].icon}' , temp: (responseObject.list[32].main.temp),),
                                  Days(day: (DateTime.parse(responseObject.list[39].dt_txt)), icon: '${responseObject.list[39].weather[0].icon}' , temp: (responseObject.list[39].main.temp),),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 80,
                          ),
                        ],
                      );
                    }
                    if (snapshot.hasError) {
                      print(snapshot.error.toString());
                      return Text('${snapshot.error.toString()}');
                    }
                    return Center(child: CircularProgressIndicator(color: Colors.red,));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
