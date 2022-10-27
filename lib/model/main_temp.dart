class MainWeather {
  late double temp;
  late double temp_min;
  late double temp_max;

  MainWeather({
    required this.temp,
    required this.temp_min,
    required this.temp_max,
  });

  MainWeather.fromMap(Map<String, dynamic> map) {
    this.temp = double.parse(map['temp'].toString())  ;
    this.temp_min = double.parse(map['temp_min'].toString()) ;
    this.temp_max = double.parse(map['temp_max'].toString()) ;
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'temp': this.temp,
      'temp_min': this.temp_min,
      'temp_max': this.temp_max,
    };
    return map;
  }
}
