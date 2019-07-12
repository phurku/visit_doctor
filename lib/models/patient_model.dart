import '../resources/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ItemModel {
  final String fullname;
  final String id;
  final String age;
 final String problems;
  final String date;
  

ItemModel(
      {
        this.fullname,
      this.id,
      this.age,
     this.problems,
      this.date,
      
      });  

  ItemModel.fromMap(DocumentSnapshot parsedJson)
      : id = parsedJson.documentID,
        fullname = parsedJson[columnfullname],
       age=parsedJson[columnage],
       problems=parsedJson[columnproblems],
        date = parsedJson[columndate];
       

  Map <String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map[columnId] = id;
    map[columnfullname] = fullname;
    map[columnage]=age;
    map[columnproblems]=problems;
    map[columndate] = date;
   return map;
  }
}
