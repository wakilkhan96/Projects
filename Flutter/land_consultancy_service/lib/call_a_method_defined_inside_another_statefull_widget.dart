import 'package:flutter/material.dart';
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData.light(),
//       // home: const LoadingScreen(),
//       // initialRoute: '/initial',
//       home: Page1(),
//     );
//   }
// }
class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child: Text("Call page 2 method"),
          onPressed:() {
            Page2().method();
          },
        ),
      ),
    );
  }
}

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  method() => createState().methodInPage2();

  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) => Container();

  methodInPage2() {
    print("i was in method 2");
    setState(() {
      print("??? method 2");
    });

  }


}