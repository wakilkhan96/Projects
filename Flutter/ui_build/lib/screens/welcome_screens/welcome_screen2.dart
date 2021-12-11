import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ui_build/screens/menu_screens/menu_screen1.dart';
import 'package:ui_build/screens/login_screens/login_screen1.dart';
import 'package:ui_build/screens/login_screens/login_screen2.dart';
import 'package:ui_build/screens/forms/form1.dart';

class WelcomeScreen2 extends StatelessWidget {
  const WelcomeScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Spacer(flex: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50.0, vertical: 40.0),
                      child: Image.asset("assets/images/brain.png")
                  ),
                ),
              ],
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 10.0),
            //   child: Image.asset("images/brain.png"),
            // ),
            //Spacer(flex: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome to the great\nBrain Storm app (WK)",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            //Spacer(flex: 1),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Get access to mighty brain cells\nto call up previous tasks.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .color!
                        .withOpacity(0.64),
                  ),
                )
              ],
            ),
            //Spacer(flex: 2),
            SizedBox(height: 60),
            FittedBox(
              child: TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        //MaterialPageRoute(builder: (context)=> const LoginScreen1()
                        //MaterialPageRoute(builder: (context)=> const LoginScreen2()
                        //MaterialPageRoute(builder: (context)=> const MyCustomForm()
                        MaterialPageRoute(builder: (context)=> const MenuScreen(),
                        ),
                    );
                  },
                  child: Row(
                    children: [
                      Text(
                        "Skip",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .color!
                                  .withOpacity(0.8),
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
                  )),
            ),
            //Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
