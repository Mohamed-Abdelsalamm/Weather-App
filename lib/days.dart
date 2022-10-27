import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Days extends StatelessWidget {
  DateTime day;
  String icon;
  double temp;

  Days({
    required this.day,
    required this.icon,
    required this.temp,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            colors: [
              Colors.deepPurple,
              Colors.indigo,
            ],
          ),
        ),
        width: 74,
        // height: 40,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${(DateFormat('EEEE').format(day)).substring(0, 3)}',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            Image.network(
              'http://openweathermap.org/img/wn/$icon@2x.png',
            ),
            Text(
              '${temp.round()}',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
