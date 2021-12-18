import 'package:flutter/material.dart';

class UIScreen2 extends StatefulWidget {
  const UIScreen2({Key? key}) : super(key: key);

  @override
  _UIScreen2State createState() => _UIScreen2State();
}

class _UIScreen2State extends State<UIScreen2> {

  _UIScreen2State();

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
                      // alignment: Alignment.center,
                      height: 100,
                      child: TextField(
                        // controller: urlTextFieldController,
                        //enabled: false,  // editing permission
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          //height: .8,
                          fontSize: 14,
                        ),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          // fillColor: Color(0x00fcf3f0),
                          fillColor: Color.fromRGBO(238, 244, 255, 1.0),
                          //fillColor: Color.fromRGBO(0, 243, 252, 1.0),
                          filled: true,
                          hintText: 'Search by doctors name/code or speciality',
                          hintStyle: TextStyle(color: Colors.grey),
                          contentPadding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                          isDense: true,
                          //contentPadding: EdgeInsets.all(5),
                        ),

                        //cursorHeight: .8,
                        //showCursor: false,
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
