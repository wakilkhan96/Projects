import 'package:flutter/material.dart';
import 'package:land_consultancy_service/screens/registration/consultant_registration_screen_with_tab_bar.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      // home: const LoadingScreen(),
      // initialRoute: '/initial',
      initialRoute: ConsultantRegistrationScreen.pageID,
      routes: {
        // '/initial': (context) => const ConsultantRegistrationScreen(),
        ConsultantRegistrationScreen.pageID: (context) => const ConsultantRegistrationScreen(),
      },
    );
  }
}