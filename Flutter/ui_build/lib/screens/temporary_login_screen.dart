import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TemporaryLoginScreen extends StatefulWidget {
  const TemporaryLoginScreen({Key? key}) : super(key: key);

  @override
  _TemporaryLoginScreenState createState() => _TemporaryLoginScreenState();
}

class _TemporaryLoginScreenState extends State<TemporaryLoginScreen> {
  static const scaffoldColor = Colors.lightGreen;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: AppBar(
        title: const Text("Sign in Screen"),
      ),
      body: Form(
      key: _formKey,
      child: Column(
        children: [
          Material(
            borderRadius: BorderRadius.circular(50),
            elevation: 5.0,
            color: Colors.lightBlueAccent,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12.0,
              ),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,

                controller: _emailController,
                // ignore: prefer_const_constructors
                decoration: InputDecoration(
                  hintText: 'Enter email',
                ),
              ),
            ),
          ),

          Material(
            borderRadius: BorderRadius.circular(50),
            elevation: 5.0,
            color: Colors.lightBlueAccent,
            child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 12.0,
                ),
                child: TextFormField(
                  keyboardType: TextInputType.text,

                  controller: _passwordController,
                  obscureText: true,
                  // ignore: prefer_const_constructors
                  decoration: InputDecoration(
                    hintText: 'Enter password',
                  ),
                ),
              ),
          ),
          ElevatedButton(
              child: const Text(
                "Sign In",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                ),
              ),
              onPressed: () async {
                // if (_formKey.currentState!.validate()) {
                //   await _auth.signInWithEmailAndPassword(
                //     email: _emailController.text,
                //     password: _passwordController.text,
                //   );
                //   Navigator.of(context).pushReplacement(
                //     MaterialPageRoute(
                //       builder: (context) => HomeScreen(),
                //     ),
                //   );
                // } else {
                //   showDialog(
                //     context: context,
                //     builder: (context) => Text("Incorrect Details"),
                //   );
                // }

                //sign up functionality
              }),
        ],
      ),
    ),

    );
  }
}
