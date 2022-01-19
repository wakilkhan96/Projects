import 'package:flutter/material.dart';
// import 'package:land_consultancy_service/screens/registration/consultant_registration_screen.dart';
import 'package:land_consultancy_service/screens/registration/consultant_registration_screen_with_tab.dart';
// import 'package:land_consultancy_service/screens/registration/consultant_registration_screen_with_tab_2.dart';

import "package:land_consultancy_service/TestMultiSelectListPage.dart";
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
      // initialRoute: '/initial',
      routes: {
        // '/initial': (context) => const ConsultantRegistrationScreen(),
        ConsultantRegistrationScreen.pageID: (context) => const ConsultantRegistrationScreen(),

        // '/initial' : (context) => TestMultiSelectListPage(),
      },
    );
  }
}

