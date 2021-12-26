import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MyScreen2 extends StatefulWidget {
  const MyScreen2({Key? key}) : super(key: key);

  @override
  _MyScreen2State createState() => _MyScreen2State();
}

class _MyScreen2State extends State<MyScreen2> {

  int cou = 0;
  String url = "https://images.unsplash.com/photo-1612531386530-97286d97c2d2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80";

  String doctorName = "Dr. Mr. X";
  String doctorType = "General Physician";
  double doctorRating = 4.8;
  int totalPatient = 0;

  int patientDataViewContainerHeight = 0;
  List<Widget> patientData = [];

  _MyScreen2State() {
    patientData.clear();
  }



  void addNewPatient() {
    setState(() {
      // // use any one of the two ways and comment the unused one
      //way 1 - By using widget class
      patientData.add(patientWidget("Mrs. Patient X", "Female", 40));
      patientData.add((const SizedBox(height: 10,)));
      //way 2 - By using custom class and returning widget class from that
      patientData.add(
        const Patient(patientName: "Mr. Patient Y", patientGender: "Male", patientAge: 41),
      );
      patientData.add((const SizedBox(height: 10,)));

      //lets says each patient data container need 100 of height
      // lets find out how many containers are pushed or added to the list
      // and then multiply with the height: 100
      // we wont let the height go above 290
      int totalElements = patientData.length;
      totalElements = totalElements~/2;
      patientDataViewContainerHeight = min(totalElements*100, 100);

      totalPatient = totalElements;
      // print(patientDataViewContainerHeight);
    });
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

                    const SizedBox(height: 10,),
                    // PatientWidget("Mr Patient", "Male", 42),


                    /* patient data viewing row way 1 - without using Listview*/
                    Text("way 1 - without using Listview"),
                    Container(
                      // // static height
                      // height: 200,

                      // // dynamic height
                      height: patientDataViewContainerHeight.toDouble(),
                      decoration: const BoxDecoration(
                        // color: Colors.yellow,
                      ),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.zero,
                          child: Column(
                            // // static children
                            // children: [
                            //   patientWidget("Mr Patient", "Male", 42),
                            //   const SizedBox(height: 10,),
                            //   patientWidget("Mr Patient", "Male", 42),
                            //   const SizedBox(height: 10,),
                            //   patientWidget("Mr Patient", "Male", 42),
                            //   const SizedBox(height: 10,),
                            // ],

                            // // dynamic children
                            children: patientData,

                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 15,),

                    /* patient data viewing row way 2 - using Listview*/
                    Text("way 2 - using Listview"),
                    Container(
                      // // static height
                      // height: 200,

                      // // dynamic height
                      height: patientDataViewContainerHeight.toDouble(),
                      decoration: const BoxDecoration(
                        // color: Colors.yellow,
                      ),
                      child: ListView.separated(
                        // padding: EdgeInsets.all(5),
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) => patientData[index],
                          separatorBuilder: (context, _) => const SizedBox(height: 10,),
                          itemCount: patientData.length
                      ),
                    ),
                    const SizedBox(height: 15,),




                    // add new patient row
                    InkWell(
                      onTap: () {
                        addNewPatient();
                      },
                      child: addNewPatientWidget(),
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

Widget addNewPatientWidget() {
  return Container(
    height: 90,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      border: Border.all(
        color: Colors.black12,
        width: 1,
      ),
      // color: Colors.yellow,
      // color: const Color.fromRGBO(238, 244, 255, 1.0),
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
        const SizedBox(width: 10,),
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
  );
}




Widget patientWidget(String patientName, String patientGender, int patientAge) {
  String _patientAge = patientAge.toString();

  return Container(
    height: 90,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      border: Border.all(
        color: Colors.black12,
        width: 1,
      ),
      // color: Colors.yellow,
      // color: const Color.fromRGBO(238, 244, 255, 1.0),
    ),
    child: Row(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(width: 25,),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 50.0,
              height: 50.0,
              decoration: BoxDecoration(
                color: Colors.blue,
                // image: DecorationImage(
                //   image: NetworkImage('http://i.imgur.com/QSev0hg.jpg'),
                //   fit: BoxFit.cover,
                // ),
                borderRadius: BorderRadius.circular(5),
                // border: Border.all(
                //   color: Colors.lightBlue,
                //   width: 0,
                // ),
              ),
              child: const Center(
                child: Text(
                  "X",
                  style: TextStyle(
                    fontSize: 29,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'RobotoMono',
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(width: 20,),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              patientName,
              style: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoMono',
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8,),
            Text(
              "$patientGender   |   $_patientAge yrs",
              style: const TextStyle(
                fontSize: 16,
                fontFamily: 'RobotoMono',
                fontWeight: FontWeight.normal,
                color: Colors.black45,
              ),
            ),

          ],
        ),


      ],
    ),
  );
}

class Patient extends StatelessWidget {
  final int patientAge;
  final String patientGender;
  final String patientName;

  const Patient({Key? key, required this.patientName, required this.patientGender, required this.patientAge}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _patientAge = patientAge.toString();

    return Container(
      height: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.black12,
          width: 1,
        ),
        // color: Colors.yellow,
        // color: const Color.fromRGBO(238, 244, 255, 1.0),
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(width: 25,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  // image: DecorationImage(
                  //   image: NetworkImage('http://i.imgur.com/QSev0hg.jpg'),
                  //   fit: BoxFit.cover,
                  // ),
                  borderRadius: BorderRadius.circular(5),
                  // border: Border.all(
                  //   color: Colors.lightBlue,
                  //   width: 0,
                  // ),
                ),
                child: const Center(
                  child: Text(
                    "X",
                    style: TextStyle(
                      fontSize: 29,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'RobotoMono',
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 20,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                patientName,
                style: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoMono',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8,),
              Text(
                "$patientGender   |   $_patientAge yrs",
                style: const TextStyle(
                  fontSize: 16,
                  fontFamily: 'RobotoMono',
                  fontWeight: FontWeight.normal,
                  color: Colors.black45,
                ),
              ),

            ],
          ),


        ],
      ),
    );
  }
}

