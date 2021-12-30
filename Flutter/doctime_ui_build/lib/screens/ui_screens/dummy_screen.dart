import 'package:flutter/material.dart';

class DummyScreen extends StatefulWidget {
  final String text;

  const DummyScreen({Key? key, required this.text}) : super(key: key);

  @override
  _DummyScreenState createState() => _DummyScreenState(text);
}

class _DummyScreenState extends State<DummyScreen> {
  final String _text;

  _DummyScreenState(this._text);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Text(
                      // "Hi",
                    _text,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
