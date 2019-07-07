import 'package:flutter/material.dart';
import 'package:personal_doctor/pages/home.dart';

class DoctorSignupPage extends StatefulWidget {
  @override
  _DoctorSignupPageState createState() => _DoctorSignupPageState();
}

class _DoctorSignupPageState extends State<DoctorSignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

appBar: AppBar(
  title: Text('Doctor signup Page'),
  actions: <Widget>[

  IconButton(
    onPressed: ()=>HomePage(),
    icon: Icon(Icons.exit_to_app)),
  

],),      
    );
  }
}