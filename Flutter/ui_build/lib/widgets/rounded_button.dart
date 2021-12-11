import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({Key? key, required this.buttonName,}) : super(key: key);

  final String buttonName;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.08,
      width: size.width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1630),
        color: Colors.blue,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.blue, // background
          onPrimary: Colors.black, // foreground
        ),
        onPressed: () {
        },
        child: Text(
          buttonName,
          style: TextStyle(fontSize: size.height *.03, color: Colors.black, height: 1.5),
        ),
      ),
    );
  }
}