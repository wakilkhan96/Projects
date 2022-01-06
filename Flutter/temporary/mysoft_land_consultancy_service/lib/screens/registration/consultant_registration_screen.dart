import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';

class ConsultantRegistrationScreen extends StatefulWidget {
  static String pageID = 'consultant_registration_screen';
  const ConsultantRegistrationScreen({Key? key}) : super(key: key);

  @override
  _ConsultantRegistrationScreenState createState() =>
      _ConsultantRegistrationScreenState();
}

class _ConsultantRegistrationScreenState extends State<ConsultantRegistrationScreen> {
  // final GlobalKey<_ConsultantRegistrationScreenState> parent = GlobalKey();
  final formGlobalKey = GlobalKey<FormState>();
  final TextEditingController controllerX = TextEditingController(text: 'Mr. X');
  int selectedDayValue = 1;
  String selectedMonthValue = "January";
  int selectedYearValue = 2000;


  List<int> allDays = [];
  List<String> allMonths = ["January", "February", "March", "April", "May", "June",
    "July", "August", "September", "October", "November", "December",
  ];
  List<int> allYears = [];
  var yearsInNumber = Map();

  _ConsultantRegistrationScreenState() {
    for(int i=1; i<32; i++) {
      allDays.add(i);
    }
    for(int i=0; i<12; i++) {
      yearsInNumber[allMonths[i]] = i+1;
      print(allMonths[i].toString() + " " + yearsInNumber[allMonths[i]].toString());
    }
    for(int i=1981; i<2022; i++) {
      allYears.add(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: SafeArea(
            // child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Form(
                key: formGlobalKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "Consultant Registration",
                        style: TextStyle(
                          fontFamily: 'OpenSans',
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      BuildTextFormField(
                        labelText: "Name",
                        controller: controllerX,
                      ),



                      const SizedBox(height: 20,),
                      Row(
                        children: [
                          const Text(
                            "  Date of Birth",
                            style: TextStyle(
                              fontFamily: 'OpenSans',
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ],

                      ),
                      SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment:  MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 110,
                            padding: EdgeInsets.only(left: 15),
                            decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(5)
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<int>(
                                  hint: Text("Select"),
                                  value: selectedDayValue,
                                  items: allDays.map((int value) {
                                    return DropdownMenuItem<int>(
                                      value: value,
                                      child: Text(value.toString()),
                                    );
                                  }).toList(),
                                  onChanged: (newVal) {
                                    // selected_item = newVal!;
                                    setState(() {
                                      selectedDayValue = newVal!;
                                    });
                                  }),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Container(
                            width: 130,
                            padding: EdgeInsets.only(left: 15),
                            decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(5)
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                  hint: Text("Select"),
                                  value: selectedMonthValue,
                                  items: allMonths.map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value.toString()),
                                    );
                                  }).toList(),
                                  onChanged: (newVal) {
                                    // selected_item = newVal!;
                                    setState(() {
                                      selectedMonthValue = newVal!;
                                    });
                                  }),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Container(
                            width: 110,
                            padding: EdgeInsets.only(left: 15),
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(5)
                            ),

                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<int>(
                                  hint: Text("Select"),
                                  value: selectedYearValue,
                                  items: allYears.map((int value) {
                                    return DropdownMenuItem<int>(
                                      value: value,
                                      child: Text(value.toString()),
                                    );
                                  }).toList(),
                                  onChanged: (newVal) {
                                    // selected_item = newVal!;
                                    setState(() {
                                      selectedYearValue = newVal!;
                                    });
                                  }),
                            ),
                          ),

                        ],
                      ),

                      TextButton(
                        onPressed: () {
                          print(
                            selectedDayValue.toString() + " " +
                            selectedMonthValue.toString() + " " +
                            selectedYearValue.toString()
                          );
                        },
                        child: const Text("Get"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class BuildTextFormField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;

  const BuildTextFormField(
      {Key? key, required this.labelText, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      // autofocus: true,
      // onChanged: onChanged,
      // onSubmitted: onSubmitted,
      // keyboardType: keyboardType,
      // textInputAction: textInputAction,
      // obscureText: false,
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        // errorText: "errorText",
        // floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}

