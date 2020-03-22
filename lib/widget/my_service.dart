import 'package:flutter/material.dart';

class Myservice extends StatefulWidget {
  final String name;
  Myservice({Key key, this.name}) : super(key: key);

  @override
  _MyserviceState createState() => _MyserviceState();
}

class _MyserviceState extends State<Myservice> {
  // field
  String nameLogin;

  // method

  @override
  void initState() {
    super.initState();
    nameLogin = widget.name;
  }

  Widget showNameLogin() {
    return Column(
      children: <Widget>[
        Text('Login By'),
        Text(nameLogin),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[showNameLogin()],
        backgroundColor: Colors.lightBlueAccent,
        title: Text('My service'),
      ),
    );
  }
}
