import 'package:flutter/material.dart';
import 'package:personal_doctor/models/item_model.dart';
import 'package:personal_doctor/operations/fillform.dart';
import 'package:personal_doctor/resources/db_provider.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List items=[];
  void initState(){
    super.initState();
  }
  Future<List> getItems()async{
    return DbProvider().fetchItems();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Problems of Patients'),
        leading: Icon(Icons.home),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: (){},
          )
        ],
      ),
      body: FutureBuilder(
        future: getItems(),
        builder: (BuildContext context,AsyncSnapshot<List> snapShot){
          if(!snapShot.hasData)
          return Center(
            child: CircularProgressIndicator(),
          );
          if(snapShot.hasError)
          return Center(
            child: Text('There is an error ${snapShot.error}'),
          );
          List items=snapShot.data;
          return ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: items.length,
            itemBuilder: (BuildContext context,int index){
              ItemModel item=ItemModel.fromMap(items[index]);
              return Dismissible(
                key: Key(items[index]),
background: Container(
  color: Colors.red,
  child: Icon(Icons.delete),
),

                onDismissed: (direction){
                  setState(() {
                   items.removeAt(index); 
                  });
                },
              
             
                
                   child: Container(height: 40.0,
                   child: Row(
                     children: <Widget>[
                       Text(items[index])
                     ],
                   ),
                   
                   
                   ),
                     
                  );
            });}), 
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (_) => FillProblems())),
        tooltip: "Add Your problem",
        child: Icon(Icons.add),
      ),
      
                  );
                 
  }
//   void _delete(ItemModel item){
//    Dismissible(
// onDismissed: (direction){

//   setState(() {
//    items.removeAt( index); 
//   });
// },
//     );
  }
