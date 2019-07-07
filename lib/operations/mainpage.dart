import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:personal_doctor/operations/fillform.dart';
import 'package:personal_doctor/operations/specialistpage.dart';
import 'package:personal_doctor/pages/home.dart';
import 'package:carousel_pro/carousel_pro.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Services',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
          )
        ],
      ),
      drawer: Drawer(
        child: DrawerHeader(
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('images/drawer,jpg'))),
          padding: EdgeInsets.all(0),
          child: ListView(
            scrollDirection: Axis.vertical,
          ),
        ),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(0.0),
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            height: 250,
            child: Carousel(
                boxFit: BoxFit.contain,
                images: [
                  AssetImage('images/p1.jpg'),
                  AssetImage('images/p2.jpg'),
                  AssetImage('images/p3.jpg'),
                  AssetImage('images/p4.jpg'),
                  AssetImage('images/p5.jpg'),
                  AssetImage('images/p6.jpg'),
                ],
                animationCurve: Curves.fastLinearToSlowEaseIn,
                animationDuration: Duration(milliseconds: 1200)),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 120),
            child: Card(
              elevation: 5.0,
              color: Colors.red,
              child: FlatButton(
                  child: Text(
                'Doctor',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 50),
              ),
              onPressed: ()=>Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context)=>SpecialistPage()
              )),
              ),
            ),
          ),
          SizedBox(height: 20,),
           Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 120),
            child: Card(
              elevation: 5.0,
              color: Colors.red,
              child: FlatButton(
                  child: Text(
                'Patient',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 50),
              ),
              onPressed: ()=> typeofproblem()
                            ),
                          ),
                        ),
                        SizedBox(height: 5.0,),
                        Container(
                          padding: EdgeInsets.all(5.0),
                          height: 250,
                          child: Carousel(
                              boxFit: BoxFit.contain,
                              images: [
                                AssetImage('images/t1.jpg'),
                                AssetImage('images/t2.png'),
                                AssetImage('images/t3.png'),
                                AssetImage('images/t4.png'),
                                AssetImage('images/t5.jpg'),
                                AssetImage('images/t6.jpg'),
                               AssetImage('images/t7.jpg'),
              
                              ],
                              animationCurve: Curves.fastLinearToSlowEaseIn,
                              animationDuration: Duration(milliseconds: 1200)),
                        ),
                      ],
                    ),
                  );
                }
              
                typeofproblem() {

                  showDialog(
                    context: context,
                    builder: (BuildContext context){
                      return AlertDialog(
                        title: Text('Types of problem',style: TextStyle(color: Colors.red,fontSize: 25,fontWeight: FontWeight.bold),
                        
                        ) ,
                        actions: <Widget>[
                          FlatButton(
                            child: Text('Serious'),
                            onPressed: ()=>context,
                          ),
                          FlatButton(
                            child: Text('Non-Serious'),
                            onPressed: ()=>appointment(),
                                                      )
                                                    ],
                                                  );
                                                }
                                              );
                                            }
                            
                              appointment() {

showDialog(
                    context: context,
                    builder: (BuildContext context){
                      return AlertDialog(
                        title: Text('Do u want appointment',style: TextStyle(color: Colors.red,fontSize: 25,fontWeight: FontWeight.bold),
                        
                        ) ,
                        actions: <Widget>[
                          FlatButton(
                            child: Text('Yes'),
                            onPressed: ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>FillProblems())),
                          ),
                          FlatButton(
                            child: Text('No'),
                            onPressed: ()=>appointment(),
                                                      )
                                                    ],
                                                  );
                                                }
                                              );

                              }
}
