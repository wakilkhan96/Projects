import 'package:flutter/material.dart';

class UIScreen3 extends StatefulWidget {
  const UIScreen3({Key? key}) : super(key: key);

  @override
  _UIScreen3State createState() => _UIScreen3State();
}

class _UIScreen3State extends State<UIScreen3> {

  _UIScreen3State();

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
                      children: <Widget>[
                        Container(
                          child: Image.asset(
                            'assets/images/logo_doctime.png',
                            height: 60.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        // CircleAvatar(
                        //   radius: 50.0,
                        //   backgroundColor: Colors.white,
                        //   child: Center(
                        //       child: Image.network(
                        //         "",
                        //         // width: 500,
                        //         // height: 500,
                        //
                        //         fit: BoxFit.cover,
                        //       )),
                        //
                        // ),

                        Expanded(
                          child: SizedBox(height: 1,),
                        ),

                        // Container(
                        //   // alignment: Alignment.centerRight,
                        //   child: Padding(
                        //     padding: EdgeInsets.only( right: 15),
                        //     child: Icon(
                        //       Icons.add,
                        //       color: Colors.grey,
                        //       size: 25,
                        //     ),
                        //   ),
                        // ),

                        Padding(
                          padding: EdgeInsets.only( right: 15),
                          child: Container(
                            // alignment: Alignment.centerRight,
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.blue,
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 25,
                              ),
                            ),
                          ),
                        ),


                      ],
                    ),
                    const SizedBox(height: 10),

                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          //color: Colors.grey.withOpacity(0.5),
                          color: Colors.white,
                          width: 0.00,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                        color: Color.fromRGBO(238, 244, 255, 1.0),
                      ),
                      // margin: EdgeInsets.all(10),
                      height: 60,
                      child: Row(
                        children: const <Widget>[

                          Expanded(
                            child: TextField(
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Search by doctors name/code or speciality',
                                hintStyle: TextStyle(color: Colors.grey, fontSize: 15.0,),
                                contentPadding:EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                                isDense: true,
                              ),
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only( right: 15),
                            child: Icon(
                              Icons.search,
                              color: Colors.grey,
                              size: 25,
                            ),
                          ),
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
