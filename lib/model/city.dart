class City{
  late String name;

  City({required this.name});

  City.fromMap(Map<String , dynamic> map){
    this.name = map['name'];
  }

  Map toMap(){
    Map<String,dynamic> map={
      'name' : this.name,
    };
    return map;
  }
}