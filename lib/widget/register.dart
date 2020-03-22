import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lotus/utility/narmal_dialog.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
// field
  File file;
  String name, user, password, urlPath;
// Method
  Widget nameForm() {
    Color color = Colors.greenAccent;
    String title = 'NAME : ';
    String help = 'Type Your Name In Blank';
    return TextField(
      onChanged: (value) => name = value.trim(),
      decoration: InputDecoration(
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: color)),
        helperText: help,
        helperStyle: TextStyle(color: color),
        labelStyle: TextStyle(color: color),
        labelText: title,
        icon: Icon(
          Icons.account_box,
          size: 45.0,
          color: color,
        ),
      ),
    );
  }

  Widget userForm() {
    Color color = Colors.orangeAccent;
    String title = 'USER : ';
    String help = 'Type Your User In Blank';
    return TextField(
      onChanged: (value) => user = value.trim(),
      decoration: InputDecoration(
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: color)),
        helperText: help,
        helperStyle: TextStyle(color: color),
        labelStyle: TextStyle(color: color),
        labelText: title,
        icon: Icon(
          Icons.mail,
          size: 45.0,
          color: color,
        ),
      ),
    );
  }

  Widget passwordForm() {
    Color color = Colors.red;
    String title = 'PASSWORD : ';
    String help = 'Type Your Password In Blank';
    return TextField(
      onChanged: (value) => password = value.trim(),
      decoration: InputDecoration(
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: color)),
        helperText: help,
        helperStyle: TextStyle(color: color),
        labelStyle: TextStyle(color: color),
        labelText: title,
        icon: Icon(
          Icons.lock,
          size: 45.0,
          color: color,
        ),
      ),
    );
  }

  Widget showAvartar() {
    return GestureDetector(
      onTap: () {
        print('Your Clink Image');
        cameraThread();
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.3,
        child:
            file == null ? Image.asset('images/avartar.png') : Image.file(file),
      ),
    );
  }

  Future<void> cameraThread() async {
    try {
      var object = await ImagePicker.pickImage(
        source: ImageSource.camera,
        maxWidth: 800.0,
        maxHeight: 800.0,
      );
      setState(() {
        file = object;
      });
    } catch (e) {}
  }

  Widget regitterButton() {
    return IconButton(
      icon: Icon(Icons.cloud),
      onPressed: () {
        if (file == null) {
          narmaldialog(context, 'Non Choose Avatar',
              'Please Click Image For Open Camara');
        }else if (name==null || name.isEmpty||user==null || user.isEmpty|| password==null || password.isEmpty) {
          narmaldialog(context, 'Have Space',
              'Please Fill Every Blank');
        } else {
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(40.0),
        children: <Widget>[
          showAvartar(),
          nameForm(),
          userForm(),
          passwordForm(),
        ],
      ),
      appBar: AppBar(
        actions: <Widget>[
          regitterButton(),
        ],
        title: Center(child: Text('Register')),
        backgroundColor: Colors.lightBlueAccent,
      ),
    );
  }
}
