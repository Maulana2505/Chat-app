// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chat_app/bloc/signup/signup_bloc.dart';
import 'package:chat_app/bloc/signup/signup_event.dart';
import 'package:chat_app/bloc/signup/signup_state.dart';
import 'package:chat_app/page/signin.dart';
import 'package:get/get.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool _pashide = true;
  final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // final bloc = BlocProvider.of<SignupBloc>(context);
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
      body: BlocConsumer<SignupBloc, SignupState>(
        listener: (context, state) {
          if(state is SignupSuccesState){
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const Signin()));
          }
          if(state is SignupErrorState){
             ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.msg)));
          }
        },
        builder: (context, state) {
          if (state is SignupLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          return SafeArea(
              child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  _signuptitle(light),
                  SizedBox(
                    height: heignt * 0.04,
                  ),
                  _emailfield(light, width),
                  SizedBox(
                    height: heignt * 0.02,
                  ),
                  _usernamefield(light, width),
                  SizedBox(
                    height: heignt * 0.02,
                  ),
                  _passwordfield(light, width),
                  SizedBox(
                    height: heignt * 0.02,
                  ),
                  _confirmpasswordfield(light, width),
                  SizedBox(
                    height: heignt * 0.02,
                  ),
                  _btnlogin(light, width, context)
                ],
              ),
            ),
          ));
        },
      ),
    );
  }

  _signuptitle(bool light) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'SignUp',
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
        
        controller: _email,
        cursorColor: light ? Colors.black : Colors.white,
        style: TextStyle(
          color: light ? Colors.black : Colors.white,
        ),
        decoration: InputDecoration(
          hintText: "Email",
          // hintStyle: TextStyle(color: light ? Colors.black : Colors.white),
          enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: light ? Colors.black : Colors.white),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: light ? Colors.black : Colors.white),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          // filled: true,
          contentPadding: const EdgeInsets.all(20),
          // fillColor: light ? Colors.black : Colors.white
        ),
      ),
    );
  }

  _usernamefield(bool light, var width) {
    return Container(
      width: width * 0.9,
      child: TextField(
        controller: _username,
        keyboardType: TextInputType.text,
        cursorColor: light ? Colors.black : Colors.white,
        style: TextStyle(
          color: light ? Colors.black : Colors.white,
        ),
        decoration: InputDecoration(
          hintText: "Username",
          // hintStyle: TextStyle(color: light ? Colors.black : Colors.white),
          enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: light ? Colors.black : Colors.white),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: light ? Colors.black : Colors.white),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          // filled: true,
          contentPadding: const EdgeInsets.all(20),
          // fillColor: light ? Colors.black : Colors.white
        ),
      ),
    );
  }

  _passwordfield(bool light, var width) {
    return Container(
      width: width * 0.9,
      child: TextField(
        obscureText: _pashide,
        controller: _password,
        keyboardType: TextInputType.text,
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
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  )
                : Icon(
                    Icons.visibility,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
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
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: light ? Colors.black : Colors.white),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          // filled: true,
          contentPadding: const EdgeInsets.all(20),
          // fillColor: light ? Colors.black : Colors.white
        ),
      ),
    );
  }

  _confirmpasswordfield(bool light, var width) {
    return Container(
      width: width * 0.9,
      child: TextField(
        obscureText: _pashide,
        controller: _password,
        keyboardType: TextInputType.text,
        cursorColor: light ? Colors.black : Colors.white,
        style: TextStyle(
          color: light ? Colors.black : Colors.white,
        ),
        decoration: InputDecoration(
          hintText: "Confirm Password",
          suffixIcon: IconButton(
            icon: _pashide
                ? Icon(
                    Icons.visibility_off,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  )
                : Icon(
                    Icons.visibility,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
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
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: light ? Colors.black : Colors.white),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          // filled: true,
          contentPadding: const EdgeInsets.all(20),
          // fillColor: light ? Colors.black : Colors.white
        ),
      ),
    );
  }

  _btnlogin(bool light, var width, BuildContext context) {
    final bloc = BlocProvider.of<SignupBloc>(context);
    return ElevatedButton(
      onPressed: () {
        bloc.add(SignupDataEvent(email: _email.text, username:_username.text, password: _password.text));
        // context.read<SignupBloc>().
        // bloc.add(SignupDataEvent(
        //     email: _email.text,
        //     username: _username.text,
        //     password: _password.text));
      },
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(10), backgroundColor: light ? Colors.black : Colors.white,
          minimumSize: Size(width * 0.9, width * 0.12),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 0),
      child: Text(
        'SignUp',
        style: TextStyle(color: light ? Colors.white : Colors.black),
      ),
    );
  }
}
