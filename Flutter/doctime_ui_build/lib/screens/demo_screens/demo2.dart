import 'package:flutter/material.dart';

class DemoScreen2 extends StatefulWidget {
  const DemoScreen2({Key? key}) : super(key: key);

  @override
  _DemoScreen2State createState() => _DemoScreen2State();
}

class _DemoScreen2State extends State<DemoScreen2> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(

          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  const [
                        Text(
                          "Doctime Logo and other childs inside a \nrow",
                          //textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'RobotoMono',
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.5),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(4.0),
                        color: Colors.green,
                      ),
                      margin: EdgeInsets.all(12),

                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Icon(
                              Icons.search,
                              color: Colors.grey,
                              size: 20,
                            ),
                          ),
                          new Expanded(
                            child: TextField(
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Search by Name",
                                hintStyle: TextStyle(color: Colors.grey),
                                contentPadding:
                                EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                                isDense: true,
                              ),
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.black,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 30,), //in between spacer
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Response Status:",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "HTTP "+"status",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'RobotoMono',
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30,), //in between spacer
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Description:",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Container(

                      child: const Expanded(
                        flex: 0,
                        child: TextField(
                          // controller: descriptionTextFieldController,
                          maxLines: null, //wrap text
                          autofocus: true,
                          autocorrect: true,
                          enabled: false,  // editing permission
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            height: 1.8, // line spacing height
                            fontSize: 18,
                            wordSpacing: 2.00,
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: '',
                            contentPadding: EdgeInsets.zero,
                          ),
                          //showCursor: false,
                          //cursorHeight: 18,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
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
