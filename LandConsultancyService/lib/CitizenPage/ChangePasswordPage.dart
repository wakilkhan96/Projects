import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:landconsultancy/CommonWidget/FormButton.dart';
import 'package:landconsultancy/CommonWidget/InputField.dart';

class ChangePasswordPage extends StatefulWidget{

  final Function(String? oldPassword, String? password, String? confirmPassword)? onSubmitted;

  const ChangePasswordPage({this.onSubmitted, Key? key}) : super(key: key);

  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage>{

  late String oldPassword, password, confirmPassword, passwordMatch;

  String? oldPasswordError, passwordError, confirmPasswordError, passwordMatchError;
  Function(String? oldPassword, String? password, String? confirmPassword)? get onSubmitted =>
      widget.onSubmitted;

  @override
  void initState() {
    super.initState();
    oldPassword = "";
    password = "";
    confirmPassword = "";
    passwordMatchError = "";

    oldPasswordError = null;
    passwordError = null;
    confirmPasswordError = null;
    passwordMatchError = null;
  }

  void resetErrorText() {
    setState(() {
      oldPasswordError = null;
      passwordError = null;
      confirmPasswordError = null;
      passwordMatchError = null;
    });
  }

  bool validate() {
    resetErrorText();
    bool isValid = true;
    if (oldPassword.isEmpty) {
      setState(() {
        oldPasswordError = "Please enter old password";
      });
      isValid = false;
    }

    if (password.isEmpty) {
      setState(() {
        passwordError = "Please enter a new password";
      });
      isValid = false;
    }

    if (confirmPassword.isEmpty) {
      setState(() {
        confirmPasswordError = "Please enter a confirm password";
      });
      isValid = false;
    }

    if (password != confirmPassword) {
      setState(() {
        passwordMatchError = "Password does not match";
        confirmPasswordError = passwordMatchError;
      });
      isValid = false;
    }

    return isValid;
  }

  void submit() {
    if (validate()) {
      print(oldPassword + "_" + password + "_" + confirmPassword);
      setState(() {
//        result = email + "_" + password;

      });
//      result = email + " " + password;
      if (onSubmitted != null) {
        onSubmitted!(oldPassword, password, confirmPassword);
      }
    }
  }

  @override
  Widget build(BuildContext context){
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Change Password"),
      ),
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
              "Change your password!",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black.withOpacity(.6),
              ),
            ),
            SizedBox(height: screenHeight * .025),
            InputField(
              onChanged: (value) {
                setState(() {
                  oldPassword = value;
                });
              },
              onSubmitted: (val) => submit(),
              labelText: "Old Password",
              errorText: oldPasswordError,
              obscureText: true,
              textInputAction: TextInputAction.next,
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
              textInputAction: TextInputAction.next,
            ),
            SizedBox(height: screenHeight * .025),
            InputField(
              onChanged: (value) {
                setState(() {
                  confirmPassword = value;
                });
              },
              onSubmitted: (val) => submit(),
              labelText: "Confirm Password",
              errorText: confirmPasswordError,
              obscureText: true,
              textInputAction: TextInputAction.done,
            ),
            /*Align(
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
            ),*/
            SizedBox(
              height: screenHeight * .025,
            ),
            FormButton(
              text: "Submit",
              onPressed: () => submit(),
            ),
          ],
        ),
      ),
    );
  }
}