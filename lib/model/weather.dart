class Weather {
  late int id;
  late String icon;

  Weather({
    required this.id,
    required this.icon,
  });

  Weather.fromMap(Map<String ,dynamic> map){
    this.id= map['id'];
    this.icon= map['icon'];
  }

  Map<String ,dynamic> toMap(){
    Map<String,dynamic>map={
      'id':this.id,
      'icon':this.icon,
    };
    return map;
  }
}
