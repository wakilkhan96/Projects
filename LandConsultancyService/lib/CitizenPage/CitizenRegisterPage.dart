import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:landconsultancy/CitizenPage/CitizenLoginPage.dart';
import 'package:landconsultancy/CitizenPage/OTPVerificationPage.dart';
import 'package:landconsultancy/CommonWidget/FormButton.dart';
import 'package:landconsultancy/CommonWidget/InputField.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CitizenRegisterPage extends StatefulWidget {
  final Function(String? name, String? mobile, String? password)? onSubmitted;
  const CitizenRegisterPage({this.onSubmitted, Key? key}) : super(key: key);

  @override
  _CitizenRegisterPageState createState() => _CitizenRegisterPageState();
}

class _CitizenRegisterPageState extends State<CitizenRegisterPage> {
  late String name, email, mobile, password, confirmPassword;
  String? nameError, emailError, mobileError, passwordError;
  String randomOTPNumber = "";

  Function(String? name, String? mobile, String? password)? get onSubmitted =>
      widget.onSubmitted;

  void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  /****************initState method start**********/
  @override
  void initState() {
    super.initState();
    name = "";
    mobile = "";
    email = "";
    password = "";
    confirmPassword = "";

    nameError = null;
    emailError = null;
    mobileError = null;
    passwordError = null;
  }

  /********method end************/

  void resetErrorText() {
    setState(() {
      nameError = null;
      emailError = null;
      mobileError = null;
      passwordError = null;
    });
  }

  bool validate() {
    resetErrorText();

    RegExp emailExp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

    bool isValid = true;
    if (email.isNotEmpty && !emailExp.hasMatch(email)) {
      setState(() {
        emailError = "Email is invalid";
      });
      isValid = false;
    }

    RegExp mobileExp = RegExp(
        r"(^(\+88|0088)?(01){1}[3456789]{1}(\d){8})$");

    if (name.isEmpty) {
      setState(() {
        nameError = "Enter name";
      });
      isValid = false;
    }

    if (mobile.isEmpty || !mobileExp.hasMatch(mobile)) {
      setState(() {
        mobileError = "Mobile number is invalid";
      });
      isValid = false;
    }

    if (password.isEmpty || confirmPassword.isEmpty) {
      setState(() {
        passwordError = "Please enter a password";
      });
      isValid = false;
    }
    if (password != confirmPassword) {
      setState(() {
        passwordError = "Passwords do not match";
      });
      isValid = false;
    }

    return isValid;
  }

  String get6DigitNumber(){
    Random random = Random();
    String number = '';
    for(int i = 0; i < 6; i++){
      number = number + random.nextInt(9).toString();
    }
    return number;
  }

  void submit() async {
    if (validate()) {
      print(name + " " + mobile + " " + password + " " + confirmPassword);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("email", email);

      setState(() {
        randomOTPNumber = get6DigitNumber();
        print(randomOTPNumber);
      });
//      final random = Random();


//      Navigator.pushAndRemoveUntil(
      Navigator.push(
          context,
//          MaterialPageRoute(builder: (_) => OTPVerificationPage(randomOTPNumber)));
          MaterialPageRoute(builder: (_) => OTPVerificationPage("123456", "1")));
//          (route) => false);
      if (onSubmitted != null) {
        onSubmitted!(name, mobile, password);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
//    hideKeyboard(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            SizedBox(height: screenHeight * .03),
            /*Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 8,
                        ),
                      ],
                    )),
                Expanded(
                    flex: 3,
                    child: Card(
//                        color: Colors.white,
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40.0),
                              bottomLeft: Radius.circular(40.0)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Create Consultant Account",
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ),
                    ))
              ],
            ),
            SizedBox(height: screenHeight * .03),*/
            const Text(
              "Create Citizen Account,",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: screenHeight * .01),
            Text(
              "Sign up to get started!",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black.withOpacity(.6),
              ),
            ),
            SizedBox(height: screenHeight * .05),
            InputField(
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
              labelText: "Name",
              errorText: nameError,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              autoFocus: true,
            ),
            SizedBox(height: screenHeight * .025),
            InputField(
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
              labelText: "Email",
              errorText: emailError,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              autoFocus: true,
            ),
            SizedBox(height: screenHeight * .025),
            InputField(
              onChanged: (value) {
                setState(() {
                  mobile = value;
                });
              },
              labelText: "Mobile",
              errorText: mobileError,
              keyboardType: TextInputType.phone,
              textInputAction: TextInputAction.next,
              autoFocus: true,
            ),
            SizedBox(height: screenHeight * .025),
            InputField(
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
              labelText: "Password",
              errorText: passwordError,
              obscureText: true,
              textInputAction: TextInputAction.next,
            ),
            SizedBox(height: screenHeight * .025),
            InputField(
              onChanged: (value) {
                setState(() {
                  confirmPassword = value;
                });
              },
              onSubmitted: (value) => submit(),
              labelText: "Confirm Password",
              errorText: passwordError,
              obscureText: true,
              textInputAction: TextInputAction.done,
            ),
            SizedBox(
              height: screenHeight * .030,
            ),
            FormButton(
              text: "Sign Up",
              onPressed: submit,
            ),
            SizedBox(
              height: screenHeight * .015,
            ),
            TextButton(
//              onPressed: () => Navigator.pop(context),
              onPressed: () => {
              Navigator.push( context, MaterialPageRoute( builder: (_) => const CitizenLoginPage(),),)
              },
              child: RichText(
                text: const TextSpan(
                  text: "I'm already a member, ",
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: "Sign In",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
