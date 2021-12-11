import 'package:flutter/material.dart';
import 'package:ui_build/screens/welcome_screens/welcome_screen1.dart';
import 'screens/menu_screens/menu_screen1.dart';
import 'screens/temporary_login_screen.dart';
import 'screens/login_screens/login_screen1.dart';
import 'screens/welcome_screens/welcome_screen1.dart';
import 'screens/welcome_screens/welcome_screen2.dart';
import 'screens/welcome_screens/welcome_screen3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WelcomeScreen2(),
      //home: const LoginScreen1(),
      //home: const MenuScreen(),
    );
  }
}

