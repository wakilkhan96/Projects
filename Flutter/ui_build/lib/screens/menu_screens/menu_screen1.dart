import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ui_build/screens/api_data_viewing_screens/api_data_viewing_screen1.dart';
import 'package:ui_build/screens/forms/form1.dart';
import 'package:ui_build/screens/login_screens/login_screen1.dart';



class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //Spacer(flex: 2),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Expanded(
                //       child: Padding(
                //           padding: const EdgeInsets.symmetric(
                //               horizontal: 50.0, vertical: 40.0),
                //           child: Image.asset("assets/images/brain.png")
                //       ),
                //     ),
                //   ],
                // ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 10.0),
                //   child: Image.asset("images/brain.png"),
                // ),
                //Spacer(flex: 1),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Select any item",
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                // //Spacer(flex: 1),
                // SizedBox(height: 20),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Text(
                //       "Get access to mighty brain cells\nto call up previous tasks.",
                //       textAlign: TextAlign.center,
                //       style: TextStyle(
                //         color: Theme.of(context)
                //             .textTheme
                //             .bodyText1!
                //             .color!
                //             .withOpacity(0.64),
                //       ),
                //     )
                //   ],
                // ),
                //Spacer(flex: 2),
                SizedBox(height: 30),
                _TextButton2(
                  buttonText: 'Form',
                  action: () {
                    Navigator.push(context,
                      //MaterialPageRoute(builder: (context)=> const LoginScreen1()
                      //MaterialPageRoute(builder: (context)=> const LoginScreen2()
                      MaterialPageRoute(builder: (context)=> const MyCustomForm(),
                      //MaterialPageRoute(builder: (context)=> const MenuScreen(),
                      ),
                    );
                  },
                ),
                SizedBox(height: 10),
                _TextButton2(
                  buttonText: 'Login Screen',
                  action: () {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context)=> const LoginScreen1(),
                      //MaterialPageRoute(builder: (context)=> const LoginScreen2()
                      //MaterialPageRoute(builder: (context)=> const MyCustomForm()
                      //MaterialPageRoute(builder: (context)=> const MenuScreen(),
                      ),
                    );
                  },
                ),
                //Spacer(flex: 1),
                SizedBox(height: 10),
                _TextButton2(
                  buttonText: 'API Data',
                  action: () {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context)=> const APIDataViewingScreen1(),
                        //MaterialPageRoute(builder: (context)=> const LoginScreen2()
                        //MaterialPageRoute(builder: (context)=> const MyCustomForm()
                        //MaterialPageRoute(builder: (context)=> const MenuScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}


class  _TextButton1 extends StatelessWidget {
  final String buttonText;

  const _TextButton1({Key? key, required this.buttonText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: TextButton(
        onPressed: () {
          print("clicked");
          // Navigator.push(context,
          // //MaterialPageRoute(builder: (context)=> const LoginScreen1()
          // //MaterialPageRoute(builder: (context)=> const LoginScreen2()
          // //MaterialPageRoute(builder: (context)=> const MyCustomForm()
          //   MaterialPageRoute(builder: (context)=> const MenuScreen(),
          //   ),
          // );
        },
        child: Row(
          children: [
            Text(
              buttonText,
              // style: Theme.of(context).textTheme.headline5!.copyWith(
              //   color: Theme.of(context)
              //       .textTheme
              //       .headline5!
              //       .color!
              //       .withOpacity(0.8),
              // ),
              style: const TextStyle(
                color: Colors.black,
                backgroundColor: Colors.white,
                fontFamily: 'RobotoMono',
                fontSize: 20,
                letterSpacing: .3,

              ),
            ),
            SizedBox(width: 12 / 4),
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Theme.of(context)
              .textTheme
              .bodyText1!
              .color!
              .withOpacity(0.8),
            )
          ],
        )
      ),
    );
  }
}

class  _TextButton2 extends StatelessWidget {
  final String buttonText;
  dynamic action;

  _TextButton2({Key? key, required this.buttonText, required this.action}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: ElevatedButton(
        onPressed: action,
        style: const ButtonStyle(

        ),
        child: Text(
          buttonText,
          // style: Theme.of(context).textTheme.headline5!.copyWith(
          //   color: Theme.of(context)
          //       .textTheme
          //       .headline5!
          //       .color!
          //       .withOpacity(0.8),
          // ),
          style: const TextStyle(
            color: Colors.black,
            backgroundColor: Colors.transparent,
            fontFamily: 'RobotoMono',
            fontSize: 20,
            letterSpacing: .3,

          ),
        ),

      ),
    );
  }
}
