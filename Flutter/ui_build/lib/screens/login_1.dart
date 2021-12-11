import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginScreen1 extends StatefulWidget {
  const LoginScreen1({Key? key}) : super(key: key);

  @override
  _LoginScreen1State createState() => _LoginScreen1State();
}

class _LoginScreen1State extends State<LoginScreen1> {
  static const scaffoldColor2 = Colors.lightGreen;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: scaffoldColor2,
        appBar: AppBar(
          title: const Text("Signin Screen"),
        ),
        body: SafeArea(
          child: Column(

            children: [

            ],
          ),
        ),
    );
  }
}
