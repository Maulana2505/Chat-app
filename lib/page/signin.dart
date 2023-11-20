// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_element, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chat_app/bloc/signin/signin_even.dart';
import 'package:chat_app/bloc/signin/signin_state.dart';
import 'package:chat_app/widget/Navigation/nav.dart';
import 'package:get/get.dart';

import '../bloc/friendRequest/friendreq_bloc.dart';
import '../bloc/friendRequest/friendreq_event.dart';
import '../bloc/pending/pending_bloc.dart';
import '../bloc/pending/pending_event.dart';
import '../bloc/signin/signin_bloc.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool _pashide = true;
  @override
  Widget build(BuildContext context) {
    bool light = Theme.of(context).brightness == Brightness.light;
    var heignt = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor:
            Get.isDarkMode ? Colors.transparent : Colors.transparent,
        foregroundColor: Get.isDarkMode ? Colors.white : Colors.black,
      ),
      body: BlocListener<SigninBloc, SigninState>(
        listener: (context, state) {
          if (state is SigninInitial) {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => Navbar()),
                (Route<dynamic> route) => false);
          }
          if (state is SigninFailureState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.msg)));
          }
        },
        child: BlocBuilder<SigninBloc, SigninState>(
          builder: (context, state) {
            if (state is SigninLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return SafeArea(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _signintitle(light),
                SizedBox(
                  height: heignt * 0.04,
                ),
                _emailfield(light, width),
                SizedBox(
                  height: heignt * 0.02,
                ),
                _passwordfield(light, width),
                SizedBox(
                  height: heignt * 0.02,
                ),
                _btnlogin(light, width)
              ],
            ));
          },
        ),
      ),
    );
  }

  _signintitle(bool light) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'SignIn',
          style: TextStyle(
              color: light ? Colors.black : Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  _emailfield(bool light, var width) {
    return Container(
      width: width * 0.9,
      child: TextField(
        controller: _username,
        cursorColor: light ? Colors.black : Colors.white,
        style: TextStyle(
          color: light ? Colors.black : Colors.white,
        ),
        decoration: InputDecoration(
          hintText: "username",
          // hintStyle: TextStyle(color: light ? Colors.black : Colors.white),
          enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: light ? Colors.black : Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: light ? Colors.black : Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          // filled: true,
          contentPadding: EdgeInsets.all(20),
          // fillColor: light ? Colors.black : Colors.white
        ),
      ),
    );
  }

  _passwordfield(bool light, var width) {
    return Container(
      width: width * 0.9,
      child: TextField(
        obscureText: true,
        controller: _password,
        cursorColor: light ? Colors.black : Colors.white,
        style: TextStyle(
          color: light ? Colors.black : Colors.white,
        ),
        decoration: InputDecoration(
          hintText: "Password",
          suffixIcon: IconButton(
            icon: _pashide
                ? Icon(
                    Icons.visibility_off,
                    color: Get.isDarkMode || Get.isPlatformDarkMode
                        ? Colors.white
                        : Colors.black,
                  )
                : Icon(
                    Icons.visibility,
                    color: Get.isDarkMode || Get.isPlatformDarkMode
                        ? Colors.white
                        : Colors.black,
                  ),
            onPressed: () {
              setState(() {
                _pashide = !_pashide;
              });
            },
          ),
          // hintStyle: TextStyle(color: light ? Colors.black : Colors.white),
          enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: light ? Colors.black : Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: light ? Colors.black : Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          // filled: true,
          contentPadding: EdgeInsets.all(20),
          // fillColor: light ? Colors.black : Colors.white
        ),
      ),
    );
  }

  _btnlogin(bool light, var width) {
    return ElevatedButton(
      onPressed: () {
        BlocProvider.of<SigninBloc>(context).add(SigninButtonPressed(
            username: _username.text, password: _password.text));
        // context.read<PendingBloc>().add(PendingLoadDataEvent());
        // context.read<FriendreqBloc>().add(FriendreqLoadDataEvent());
      },
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(10),
          backgroundColor: light ? Colors.black : Colors.white,
          minimumSize: Size(width * 0.9, width * 0.12),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 0),
      child: Text(
        'Signin',
        style: TextStyle(color: light ? Colors.white : Colors.black),
      ),
    );
  }

  @override
  void dispose() {
    _username.dispose();
    _password.dispose();
    super.dispose();
  }
}
