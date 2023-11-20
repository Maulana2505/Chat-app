// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Welcomepage extends StatefulWidget {
  const Welcomepage({Key? key}) : super(key: key);

  @override
  _WelcomepageState createState() => _WelcomepageState();
}

class _WelcomepageState extends State<Welcomepage> {
  @override
  Widget build(BuildContext context) {
    var heignt = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    bool light = Theme.of(context).brightness == Brightness.light;
    return Scaffold(
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(
            height: heignt * 0.012,
          ),
          _countenerHeadline(),
          SizedBox(height: heignt*0.5,),
        _buttonSignup(light,context),
        SizedBox(height: heignt*0.02,),
        _buttonSignin(light,context)
        ]),
      ),
    );
  }

  _countenerHeadline() {
    var heignt = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Center(
      child: Container(
        alignment: Alignment.center,
        height: heignt * 0.2,
        width: width * 0.8,
        decoration: BoxDecoration(
            
            borderRadius: BorderRadius.circular(10)),
        child: Text(
          "Chat App",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  _buttonSignup(bool light,BuildContext context) {
    var heignt = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return OutlinedButton(
      onPressed: () {
        Navigator.pushNamed(context, '/signup');
      },
      autofocus: false,
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: light?Colors.black:Colors.white),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        minimumSize: Size(width * 0.7, heignt * 0.06),
        elevation: 0,
        
      ),
      child: Text("SignUp",style: TextStyle(color: light?Colors.black:Colors.white),),
    );
  }

  _buttonSignin(bool light,BuildContext context) {
    var heignt = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return OutlinedButton(
      onPressed: () {
        Navigator.pushNamed(context, '/signin');
      },
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: light?Colors.black:Colors.white),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        minimumSize: Size(width * 0.7, heignt * 0.06),
        elevation: 0,
      ),
      child: Text("SignIn",style: TextStyle(color: light?Colors.black:Colors.white),),
    );
  }
}
