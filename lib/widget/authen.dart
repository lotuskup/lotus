import 'package:flutter/material.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
// field

// method
  Widget showLogo() {
    return Center(
      child: Container(
        width: 150.0,
        child: Image.asset('images/logo.png'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: showLogo(),
    );
  }
}
