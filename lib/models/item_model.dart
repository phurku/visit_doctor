import '../resources/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ItemModel {
  final String fullname;
  final String id;
  final String problems;
  
ItemModel(
      {
        this.fullname,
      this.id,
      this.problems,
      
      });  

  ItemModel.fromMap(DocumentSnapshot parsedJson)
      : id = parsedJson.documentID,
        fullname = parsedJson[columnfullname],
        problems = parsedJson[columnproblems];



 Map<String, dynamic> toMap(){
var map=Map<String, dynamic>();
map[columnId]=id;
map[columnfullname]=fullname;
map[columnproblems]=problems;

return map;
        }
        


  }

