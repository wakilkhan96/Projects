import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'api_data.dart';

class ResultsPage extends StatelessWidget {
  // const ResultsPage({Key? key}) : super(key: key);
  ResultsPage({Key? key, required this.result}) : super(key: key);
  String result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IP Address Locator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              result,
              // 'Text at center',
              style: const TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.w800,
                fontFamily: 'Roboto',
                letterSpacing: 0.5,
                fontSize: 18,
              ),
              // textScaleFactor: 1.5,
            ),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.blueGrey, // background
              onPrimary: Colors.black, // foreground
            ),
            onPressed: () {
              // bool flag = true;
              int flag = 10;
              return Navigator.pop(context, flag);
            },
            child: const Text('Go back to previous Page'),
          ),
        ],
      ),
    );
  }
}
