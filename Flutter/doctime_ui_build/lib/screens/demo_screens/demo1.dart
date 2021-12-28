import 'package:flutter/material.dart';

class DemoScreen1 extends StatefulWidget {
  const DemoScreen1({Key? key}) : super(key: key);

  @override
  _DemoScreen1State createState() => _DemoScreen1State();
}

class _DemoScreen1State extends State<DemoScreen1> {

  _DemoScreen1State();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Column(
              children: [
                Text("Text/Element Overflow Handling\n", style: TextStyle(fontSize: 20),),
                Row(
                  children: [
                    Container(
                      width: 80,
                      height: 30,
                      color: Colors.green,
                    ),
                    Expanded(
                      child: Column(
                        children: const [
                          Text(
                            "-1-1-1-1-1-1-1-1-1-1-1-1-1-1-1-1-1-1-1-1-1-1-1-1-",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 200,
                      // height: 100,
                      color: Colors.green,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: const [
                                    Text(
                                      "0000000000000000000000000000000000",
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),


                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 2,  // so this column will take more width
                                child: Column(
                                  children: const [
                                    Text(
                                      "1111111111111111111111111111111111111111",
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: const [
                                    Text(
                                      "2222222222222222222222222222222222222222",
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),

                                  ],
                                ),
                              ),

                            ],
                          ),

                        ],
                      ),

                    ),

                  ],
                ),
                Container(
                  color: Colors.yellow,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: const [
                            Text(
                              "333333333333333333333333333333333333333333333333333",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),

                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: const [
                            Text(
                              "444444444444444444444444444444444444444444444444444",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),

                          ],
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Column(
                          children: const [
                            Text(
                              "555555555555555555555555555555555555555555555555555",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),

                          ],
                        ),
                      ),

                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}