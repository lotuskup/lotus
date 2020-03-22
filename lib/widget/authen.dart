import 'dart:convert';
import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lotus/utility/narmal_dialog.dart';
import 'package:lotus/widget/my_service.dart';
import 'package:lotus/widget/register.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
// field
  String user, password;
// method

  Widget singInButton() {
    return RaisedButton(
      color: Colors.blue,
      onPressed: () {
        if (user == null ||
            user.isEmpty ||
            password == null ||
            password.isEmpty) {
          narmaldialog(context, 'มีช่องว่าง', 'กรุณากรอกทุกช่อง จร้า');
        } else {
          checkAuthen();
        }
      },
      child: Text(
        'Sign In',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Future<void> checkAuthen() async {
    try {
      String url =
          'https://www.androidthai.in.th/rice/getUserWhereUserLotus.php?isAdd=true&User=$user';

      var response = await Dio().get(url);
      print('response =====>$response');

      if (response.toString() == 'null') {
        narmaldialog(context, 'User False', 'No $user in my Database');
      } else {
        var result = json.decode(response.data);
        print('result---->$result');
        for (var map in result) {
          String truePassword = map['Password'];
          String nameLogin = map['Name'];
          if (password == truePassword) {
            MaterialPageRoute route = MaterialPageRoute(
              builder: (context) => Myservice(
                name: nameLogin,
              ),
            );
            Navigator.of(context).pushAndRemoveUntil(route, (value)=>false);
          } else {
            narmaldialog(context, 'รหัสผ่านผิดไง ', 'รหัสผ่านผิด ลองใหม่ดิ');
          }
        }
      }
    } catch (e) {}
  }

  Widget singUpButton() {
    return OutlineButton(
      onPressed: () {
        MaterialPageRoute route =
            MaterialPageRoute(builder: (value) => Register());
        Navigator.of(context).push(route);
      },
      child: Text(
        'Sign Up',
      ),
    );
  }

  Widget showButton() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        singInButton(),
        mySizeBox(),
        singUpButton(),
      ],
    );
  }

  Widget passwordForm() {
    return Container(
      width: 250,
      child: TextField(
        onChanged: (value) => password = value.trim(),
        obscureText: true,
        decoration: InputDecoration(
          labelText: 'PassWord : ',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget mySizeBox() {
    return SizedBox(
      height: 20.0,
      width: 10.0,
    );
  }

  Widget userForm() {
    return Container(
      width: 250,
      child: TextField(
        onChanged: (value) => user = value.trim(),
        decoration: InputDecoration(
          labelText: 'User : ',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget showAppName() {
    return Text(
      'Lotuskup',
      style: GoogleFonts.exo2(
          textStyle: TextStyle(
        color: Colors.blue.shade500,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.bold,
        fontSize: 40.0,
      )),
    );
  }

  Widget showLogo() {
    return Container(
      width: 150.0,
      child: Image.asset('images/logo.png'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
              colors: <Color>[Colors.white, Colors.lightBlueAccent],
              radius: 1.0,
              center: Alignment(0, -0.35)),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                showLogo(),
                showAppName(),
                mySizeBox(),
                userForm(),
                mySizeBox(),
                passwordForm(),
                mySizeBox(),
                showButton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
