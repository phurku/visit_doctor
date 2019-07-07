import 'package:flutter/material.dart';
import 'package:personal_doctor/pages/doc_login.dart';
import 'package:personal_doctor/pages/patient_login.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: ListView(
        children: <Widget>[
          Column(children: <Widget>[
            SizedBox(height: 40),
            Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/home.jpg'), fit: BoxFit.contain),
              ),
            ),
            SizedBox(
              height: 120,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Text(
                    'I am a ???',
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: RaisedButton(
                    elevation: 1.0,
                    onPressed: () =>Navigator.pushReplacement(context, MaterialPageRoute(
                      builder:(context)=>PatientLoginPage() ,
                    )),
                    color: Colors.lightGreen,
                    child: Text(
                      'PATIENT',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
           SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: RaisedButton(
                    elevation: 1.0,
                    onPressed: ()=>Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context)=>DoctorLoginPage()
                    )),
                    color: Colors.lightGreen,
                    child: Text(
                      'DOCTOR',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ]),
        ],
      ),
    );
  }
}

  Widget build(BuildContext context) {
    return Container(
      
    );
  }
