import 'package:flutter/material.dart';
import 'package:ui_build/widgets/shaded_background_image.dart';
import 'package:ui_build/widgets/text_input_field.dart';
import 'package:ui_build/widgets/password_input_field.dart';
import 'package:ui_build/widgets/rounded_button.dart';
import 'package:cupertino_icons/cupertino_icons.dart';


class LoginScreen1 extends StatelessWidget {
  const LoginScreen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        const ShadedBackgroundImage(
          image: 'assets/images/ground2.jpg',
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Column(
              children: <Widget> [
                const Flexible(
                  child: Center(
                    child: Text(
                      'Brain|Storm',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 55,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget> [
                      const TextInputField(
                        // icon: IconData(0xf422),
                        icon: IconData(0xf422),
                        hint: 'Email',
                        inputType: TextInputType.emailAddress,
                        inputAction: TextInputAction.next,
                      ),
                      const PasswordInputField(
                        // icon: IconData(0xf422),
                        icon: IconData(0xf422),
                        hint: 'Password',
                        inputType: TextInputType.emailAddress,
                        inputAction: TextInputAction.next,
                      ),
                      GestureDetector(
                        onTap: () {
                        },
                        child: Text(
                          'Forgot Password',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: size.height *.03, color: Colors.black, height: 1.5),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const RoundedButton(
                        buttonName: 'Login',
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      GestureDetector(
                        onTap: () {
                        },
                        child: Container(
                          child: Text(
                            'Create New Account',
                            style: TextStyle(fontSize: size.height *.03, color: Colors.black, height: 1.5),
                          ),
                          decoration: const BoxDecoration(
                              border:
                              Border(bottom: BorderSide(width: 1, color: Colors.black))),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
