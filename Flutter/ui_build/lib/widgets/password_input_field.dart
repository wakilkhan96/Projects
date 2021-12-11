import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class PasswordInputField extends StatelessWidget {
  const PasswordInputField({Key? key, required this.icon, required this.hint, inputType, inputAction,}) : super(key: key);

  final IconData icon;
  final String hint;
  final TextInputType inputType = TextInputType.emailAddress;
  final TextInputAction inputAction = TextInputAction.next;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        height: size.height * 0.08,
        width: size.width * 0.8,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.8),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Icon(
                  icon,
                  size: size.height *.04,
                  color: Colors.white,
                ),
              ),
              hintText: hint,
              hintStyle: TextStyle(fontSize: size.height *.03, color: Colors.white, height: 1.5),
            ),
            style: TextStyle(fontSize: size.height *.03, color: Colors.white, height: 1.5),
            obscureText: true,
            keyboardType: inputType,
            textInputAction: inputAction,
          ),
        ),
      ),
    );
  }
}