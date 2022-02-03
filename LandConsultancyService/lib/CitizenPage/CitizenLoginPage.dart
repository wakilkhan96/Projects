import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:landconsultancy/CitizenPage/CitizenDashboardPage.dart';
import 'package:landconsultancy/CitizenPage/CitizenRegisterPage.dart';
import 'package:landconsultancy/CommonWidget/FormButton.dart';
import 'package:landconsultancy/CommonWidget/InputField.dart';

class CitizenLoginPage extends StatefulWidget{
  final Function(String? mobile, String? password)? onSubmitted;
  const CitizenLoginPage({this.onSubmitted, Key? key}) : super(key: key);

  @override
  _CitizenLoginPageState createState() => _CitizenLoginPageState();
}

class _CitizenLoginPageState extends State<CitizenLoginPage>{

  late String mobile, password;

  String result = " result ";
  String? mobileError, passwordError;
  Function(String? mobile, String? password)? get onSubmitted =>
      widget.onSubmitted;
//  late Future<LoginRequestResponse> loginResult;
//  late LoginRequestResponse loginResultData;

  @override
  void initState() {
    super.initState();
    mobile = "";
    password = "";

    mobileError = null;
    passwordError = null;
  }

  void resetErrorText() {
    setState(() {
      mobileError = null;
      passwordError = null;
    });
  }

  bool validate() {
    resetErrorText();

    RegExp mobileExp = RegExp(
        r"(^(\+88|0088)?(01){1}[3456789]{1}(\d){8})$");

    bool isValid = true;
    if (mobile.isEmpty || !mobileExp.hasMatch(mobile)) {
      setState(() {
        mobileError = "Mobile number is invalid";
      });
      isValid = false;
    }

    if (password.isEmpty) {
      setState(() {
        passwordError = "Please enter a password";
      });
      isValid = false;
    }

    return isValid;
  }

  void submit() {
    if ((mobile=="" && password=="") || validate()) {
      print(mobile + "_" + password);
//      _login(email, password, context);
      Navigator.pushAndRemoveUntil( context, MaterialPageRoute( builder: (_) => const CitizenDashboardPage()), (route) => false,);
      setState(() {
        result = mobile + "_" + password;
        print(result);

      });
      if (onSubmitted != null) {
        onSubmitted!(mobile, password);
      }
    }
  }

  @override
  Widget build(BuildContext context){
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            SizedBox(height: screenHeight * .12),
            const Text(
              "Welcome,",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: screenHeight * .01),
            Text(
              "Sign in to continue!",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black.withOpacity(.6),
              ),
            ),
            SizedBox(height: screenHeight * .10),
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
              onSubmitted: (val) => submit(),
              labelText: "Password",
              errorText: passwordError,
              obscureText: true,
              textInputAction: TextInputAction.done,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  "Forgot Password?",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * .025,
            ),
            FormButton(
              text: "Log In",
              onPressed: () => submit(),
              /*{
                    _login(email, password, context)

                  },*/
            ),
            SizedBox(
              height: screenHeight * .05,
            ),
            TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const CitizenRegisterPage(),
                ),
              ),
              child: RichText(
                text: const TextSpan(
                  text: "I'm a new user, ",
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: "Sign Up",
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