import 'package:flutter/material.dart';
import 'package:personal_doctor/models/patient_model.dart';
import 'package:personal_doctor/operations/mainpage.dart';
import 'package:personal_doctor/resources/fireStore_provider.dart';

class FillProblems extends StatefulWidget {
  final ItemModel patient;

  const FillProblems({Key key, this.patient}) : super(key: key);

  @override
  _FillProblemsState createState() => _FillProblemsState();
}

class _FillProblemsState extends State<FillProblems> {
  GlobalKey<FormState> _formkey = GlobalKey();

  TextEditingController _fullname = TextEditingController();
  TextEditingController _age = TextEditingController();
  TextEditingController _date = TextEditingController();
  TextEditingController _problems = TextEditingController();

  String selectType;
  DateTime _dateInfo;
  String fullname;
  String age;
  String problems;
  @override
  void initState() {
    if (widget.patient != null) {
      _fullname.text = widget.patient.fullname;
      _age.text = widget.patient.age;
      _date.text = widget.patient.date;
      _problems.text = widget.patient.problems;
    }

    super.initState();
  }

  List<String> _list = <String>[
    'Fever',
    'Stomache',
    'Toothache',
    'Headache',
    'Dizzess',
    'Pimples',
    ' Nausea and Vomiting',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FIll the form'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => MainPage()));
            },
          )
        ],
      ),
      body: Form(
          key: _formkey,
          child: ListView(padding: EdgeInsets.all(10.0), children: <Widget>[
            SizedBox(
              height: 30.0,
            ),
            _buildNameField(),
            SizedBox(
              height: 20,
            ),
            _buildAgeField(),
            SizedBox(
              height: 20,
            ),
            _buildDateField(),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                DropdownButton(
                    items: _list
                        .map(
                          (value) => DropdownMenuItem(
                            child: Text(
                              value,
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                            value: value,
                          ),
                        )
                        .toList(),
                    onChanged: (selectAccountType) {
                      setState(() {
                        selectType = selectAccountType;
                      });
                    },
                    value: selectType,
                    hint: Text('Select your problems',
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 25,
                            fontWeight: FontWeight.bold))),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            _buildSubmitButton(context),
            SizedBox(
              height: 20,
            ),
          ])),
    );
  }

  TextFormField _buildNameField() {
    return TextFormField(
      controller: _fullname,
      validator: (value) {
        if (value.isEmpty) return "Enter your Fullname";
      },
      onFieldSubmitted: (value) {
        fullname = value;
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        icon: Icon(Icons.person),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        labelText: 'Enter your fullname',
        hintText: "Fullname",
      ),
    );
  }

  TextFormField _buildAgeField() {
    return TextFormField(
        controller: _age,
        validator: (value) {
          if (value.isEmpty) return "Enter your age";
        },
        onFieldSubmitted: (value) {
          age = value;
        },
        keyboardType: TextInputType.numberWithOptions(),
        decoration: InputDecoration(
          icon: Icon(Icons.person),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          labelText: 'Enter your age',
          hintText: "Age",
        ));
  }

  FlatButton _buildDateField() {
    return FlatButton(
      child: new Row(
        children: <Widget>[
          new Text('${_dateInfo}'),
          new Icon(Icons.calendar_today),
        ],
      ),
      onPressed: () async {
        final dtpick = await showDatePicker(
            context: context,
            initialDate: new DateTime.now(),
            firstDate: new DateTime(2019),
            lastDate: new DateTime(2050));
        if (dtpick != null && dtpick != _dateInfo) {
          setState(() {
            _dateInfo = dtpick;
          });
        }
      },
    );
  }

  SizedBox _buildSubmitButton(BuildContext context) {
    return SizedBox(
        height: 50.0,
        width: 5.0,
        child: RaisedButton.icon(
            icon: Icon(Icons.save),
            label: Text('Submit'),
            color: Colors.blue,
            onPressed: () async {
              if (_fullname == null ||
                  _age == null ||
                  _problems == null ||
                  _date == null) {
                return;
              }
              Map<String, dynamic> patient = {
                'fullname': _fullname.text,
                'age': _age.text,
                'date': _date.text,
                'problems': _problems.text,
              };
              if (widget.patient != null) {
                await FirestoreProvider()
                    .updateItem(widget.patient.id, patient);
              } else {
                await FirestoreProvider().addItems(patient);
              }
              //   Navigator.push(
              //       context, MaterialPageRoute(builder: (context) => alertDialog()));
              // }
            }));
  }
}
