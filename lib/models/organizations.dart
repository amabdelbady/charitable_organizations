import 'package:firebase_database/firebase_database.dart';

class Organizations{
   String name;
   int id;

  Organizations({this.name, this.id});

  Organizations.fromJson(Map<String, dynamic> json){
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;

    return data;
  }
}