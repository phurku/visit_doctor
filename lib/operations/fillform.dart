import 'package:flutter/material.dart';
import 'package:personal_doctor/models/item_model.dart';
import 'package:personal_doctor/operations/mainpage.dart';
import 'package:personal_doctor/resources/db_provider.dart';
class FillProblems extends StatefulWidget {
  @override
  _FillProblemsState createState() => _FillProblemsState();
}

class _FillProblemsState extends State<FillProblems> {
  String title;
  String problems;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Fill your form'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: ()=>MainPage(),
          )
        ],
      ),
      
     body: ListView(
  padding: EdgeInsets.all(10.0),
  children: <Widget>[
    SizedBox(
      height: 30.0,
    ),
    _buildNameField(),
    SizedBox(
      height: 30.0,
    ),
    _buildProblemField(),
    SizedBox(
      height: 30.0,
    ),
    _buildSubmitField(context),
    
  ],
),

     );
    
  }
TextField _buildNameField(){
  return TextField(onChanged: (value){
    setState(() {
     title=value; 
    });
  },
  
  decoration: InputDecoration(hintText: 'Fullname',
  prefixIcon: Icon(Icons.title),
    border: OutlineInputBorder(),

  ),
  
  
  );
}
TextField _buildProblemField(){
  return TextField(onChanged: (value){
    setState(() {
     problems=value; 
    });
  },
  
  decoration: InputDecoration(hintText: 'Problems',
  prefixIcon: Icon(Icons.title),
    border: OutlineInputBorder(),

  ),
  
  
  );

}
SizedBox _buildSubmitField(BuildContext contex){
  return SizedBox(
    height: 50.0,
    width: 20.0,
    child: RaisedButton.icon(
      icon: Icon(Icons.save),
      label: Text('Submit'),
      color: Colors.green,
      onPressed: (){
        if(title==null||problems==null){
          return;
        }
        ItemModel item= ItemModel(fullname: title,problems:problems);
        DbProvider().addItem(item);
        Navigator.pop(context);

        
      },
      
    ),
  );
}
}