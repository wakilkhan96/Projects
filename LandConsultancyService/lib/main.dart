import 'dart:async';

import 'package:flutter/material.dart';
import 'package:landconsultancy/LandingPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<MyHomePage> {
  late bool isLoggedIn;

  @override
  void initState() {
    super.initState();
    doSomeAsyncStuff();
  }

  Future<void> doSomeAsyncStuff() async {
    Timer(Duration(seconds: 3),
            ()=>
        {
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context) => LandingPage()),  (route) => false,)
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.yellow,
        child:FlutterLogo(size:MediaQuery.of(context).size.height)
    );
  }
}
