import 'package:flutter/material.dart';
class Myservice extends StatefulWidget {

final String name;
Myservice({Key key,this.name}):super(key:key);


  @override
  _MyserviceState createState() => _MyserviceState();
}

class _MyserviceState extends State<Myservice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My service'),),
    );
  }
}