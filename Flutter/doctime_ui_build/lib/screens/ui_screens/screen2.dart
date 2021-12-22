import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class UIScreen2 extends StatefulWidget {
  const UIScreen2({Key? key}) : super(key: key);

  @override
  _UIScreen2State createState() => _UIScreen2State();
}

class _UIScreen2State extends State<UIScreen2> {

  String url = "https://images.unsplash.com/photo-1612531386530-97286d97c2d2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80";

  String doctorName = "Dr. Mr. X";
  String doctorType = "General Physician";
  double doctorRating = 4.8;
  int totalPatient = 1;

  _UIScreen2State() {

  }

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
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Select Patient",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'RobotoMono',
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),

                    Row(
                      children: [
                        Column(
                          children: [

                            CircleAvatar(
                              radius: 35.0,
                              backgroundColor: Colors.white,
                              child: AspectRatio(
                                aspectRatio: 1 / 1,
                                child: ClipRRect(
                                  child: Image.network(
                                    url,
                                    // width: 300,
                                    // height: 300,
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(40.0),
                                ),
                              ),

                            )

                          ],

                        ),
                        
                        SizedBox(width: 15,),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                doctorName,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'RobotoMono',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10,),
                              Text(
                                doctorRating.toString(),
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'RobotoMono',
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              SizedBox(height: 5,),
                              Text(
                                doctorType,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'RobotoMono',
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),

                        Container(
                          width: 150,
                          decoration: const BoxDecoration(
                            // color: Colors.yellow,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "Patient in Queue",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              //const SizedBox(height: 20,),
                              Padding(
                                padding: EdgeInsets.only(top:10.0),
                                child: Container(
                                  width: 50,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Center(
                                    child: Text(
                                      totalPatient.toString(),
                                      style: const TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'RobotoMono',
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),


                      ],
                    ),

                    const SizedBox(height: 30),

                    /* divider way 1 best way (using container widget )*/
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 2,
                            color: Colors.black12,
                            // color: Colors.black12,
                          ),
                        ),
                      ],
                    ),

                    /* divider way 2 (using divider widget)*/
                    // Row(
                    //   children: const [
                    //     Expanded(
                    //       child: Divider(
                    //         // height: 10,
                    //         thickness: 1,
                    //         // color: Colors.black12,
                    //         color: Colors.black,
                    //       ),
                    //     )
                    //   ],
                    // ),

                    // Text("end"),

                    const SizedBox(height: 10,),
                    /* select a patient row */
                    Row(
                      children: [
                        Column(
                          children: const [
                            Text(
                              "Select a PATIENT",
                              style: TextStyle(
                                fontSize: 23,
                                fontFamily: 'RobotoMono',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Column(
                            children: const [
                              //kept empty intentionally
                            ],
                          ),
                        ),
                        Container(
                          height: 30,
                          width: 150,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(238, 244, 255, 1.0),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          
                          // color: const Color.fromRGBO(238, 244, 255, 1.0),
                          child: Row(
                            children: [
                              SizedBox(width: 15,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    "Manage patients",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'RobotoMono',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(Icons.arrow_right_alt_outlined),
                                ],
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),

                    const SizedBox(height: 20,),

                    Container(
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.black12,
                          width: 1,
                        ),
                        // color: Colors.yellow,
                        color: const Color.fromRGBO(238, 244, 255, 1.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 20.0,
                                height: 20.0,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  // image: DecorationImage(
                                  //   image: NetworkImage('http://i.imgur.com/QSev0hg.jpg'),
                                  //   fit: BoxFit.cover,
                                  // ),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 1.5,
                                  ),
                                ),
                                child: const Center(
                                  child: Icon(Icons.add, size:15, color: Colors.black, ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 10,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Add New Patient",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'RobotoMono',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),


                        ],
                      ),
                    ),

                    const SizedBox(
                      height: 15,
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




