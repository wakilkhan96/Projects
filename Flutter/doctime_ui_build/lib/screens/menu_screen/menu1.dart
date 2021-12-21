import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:doctime_ui_build/screens/ui_screens/screen2.dart';
import 'package:doctime_ui_build/screens/ui_screens/screen3.dart';
import 'package:doctime_ui_build/screens/my_screens/my_screen1.dart';
import 'package:doctime_ui_build/screens/demo_screens/demo1.dart';



class MenuScreen1 extends StatelessWidget {
  const MenuScreen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

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

                  SizedBox(height: 30),
                  _TextButton2(
                    buttonText: 'Screen 1',
                    action: () {
                      // Navigator.push(context,
                      //   MaterialPageRoute(builder: (context)=> const UIScreen1(),
                      //   ),
                      // );
                    },
                  ),
                  SizedBox(height: 10),
                  _TextButton2(
                    buttonText: 'Screen 2',
                    action: () {
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context)=> const UIScreen2(),

                        ),
                      );
                    },
                  ),
                  //Spacer(flex: 1),
                  SizedBox(height: 10),
                  _TextButton2(
                    buttonText: 'Screen 3',
                    action: () {
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context)=> const UIScreen3(),

                        ),
                      );
                    },
                  ),
                  SizedBox(height: 10),
                  SizedBox(height: 10),
                  SizedBox(height: 10),
                  SizedBox(height: 10),
                  SizedBox(height: 10),
                  SizedBox(height: 10),
                  _TextButton2(
                    buttonText: 'Demo 1',
                    action: () {
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context)=> const DemoScreen1(),

                        ),
                      );
                    },
                  ),

                  SizedBox(height: 1000),

                  _TextButton2(
                    buttonText: 'My Screen',
                    action: () {
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context)=> const MyScreen1(),

                        ),
                      );
                    },
                  ),

                  SizedBox(height: 70),

                ],
              ),
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
