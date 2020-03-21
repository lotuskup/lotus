import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
// field

// Method
  Widget nameForm() {
    Color color = Colors.greenAccent;
    String title = 'NAME : ';
    String help = 'Type Your Name In Blank';
    return TextField(
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
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.3,
      child: Image.asset('images/avartar.png'),
    );
  }

  Widget regitterButton() {
    return IconButton(
      icon: Icon(Icons.assignment_ind),
      onPressed: () {},
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
