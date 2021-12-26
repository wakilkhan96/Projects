import 'package:flutter/material.dart';

class UIScreen1 extends StatefulWidget {
  const UIScreen1({Key? key}) : super(key: key);

  @override
  _UIScreen1State createState() => _UIScreen1State();
}

class _UIScreen1State extends State<UIScreen1> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 40,
                        ),

                        Expanded(
                            child: Column(
                              children: const [
                                Text(
                                  "Search a doctor",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'RobotoMono',
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ],
                            ),
                        ),


                        Container(
                          width: 40,
                          // color: Colors.green,
                          child: const CircleAvatar(
                            backgroundColor: Colors.orange,
                            radius: 17,
                            child: Center(
                              child: Text(
                                "I",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'RobotoMono',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                ),
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                    const SizedBox(height: 30),

                    searchFieldWidget(),

                    const SizedBox(height: 20),
                    Container(
                      height: 500,
                      color: const Color.fromRGBO(238, 244, 255, 1.0),
                    ),


                  ],
                ),

              ),
           ),
          ),
        ),
      ],
    );
  }
}


Widget searchFieldWidget() {
  return Padding(
    padding: EdgeInsets.only(left: 10, right: 10),
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(
          //color: Colors.grey.withOpacity(0.5),
          color: Colors.white,
          width: 0.00,
        ),
        borderRadius: BorderRadius.circular(25.0),
        color: const Color.fromRGBO(230, 230, 230, 1.0),
        // color: Colors.black12,
      ),
      // margin: EdgeInsets.all(10),
      height: 60,
      child: Row(
        children: const <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Icon(
              Icons.search,
              color: Colors.grey,
              size: 25,
            ),
          ),
          Expanded(
            child: TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText:
                '  Search by doctor\'s name/code',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 15.0,
                ),
                contentPadding: EdgeInsets.symmetric(
                    vertical: 8, horizontal: 8),
                isDense: true,
              ),
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black87,
              ),
            ),
          ),

        ],
      ),
    ),
  );
}