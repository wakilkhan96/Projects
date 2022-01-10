import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'dart:async';
import 'package:land_consultancy_service/src/custom_date_time_utility.dart';

enum Gender { Male, Female, Other }

class ConsultantRegistrationScreen extends StatefulWidget {
  static String pageID = 'consultant_registration_screen';
  const ConsultantRegistrationScreen({Key? key}) : super(key: key);

  @override
  _ConsultantRegistrationScreenState createState() =>
      _ConsultantRegistrationScreenState();
}

class _ConsultantRegistrationScreenState
    extends State<ConsultantRegistrationScreen> {
  // final GlobalKey<_ConsultantRegistrationScreenState> parent = GlobalKey();
  final formGlobalKey = GlobalKey<FormState>();
  final TextEditingController controllerX =
      TextEditingController(text: 'Mr. X');
  final TextEditingController controllerNID =
      TextEditingController(text: '10910920202021');
  final TextEditingController controllerCell =
      TextEditingController(text: '01521211212');
  final TextEditingController controllerEmail =
      TextEditingController(text: 'x@gmail.com');
  final TextEditingController controllerPassword =
      TextEditingController(text: 'password');
  final TextEditingController controllerConfirmPassword =
      TextEditingController(text: 'password');
  final TextEditingController controllerExperience =
      TextEditingController(text: 'Experience');
  final TextEditingController controllerPresentAddress =
      TextEditingController(text: 'Address');
  final TextEditingController controllerPermanentAddress =
      TextEditingController(text: 'Address');
  final TextEditingController controllerWorkplace =
      TextEditingController(text: 'Workplace');
  int selectedDayValue = 1;
  String selectedMonthValue = "January";
  int selectedYearValue = 2000;

  CustomDateTimeUtility dateTimeUtility = CustomDateTimeUtility();

  Gender selectedGender = Gender.Male;
  CustomRadioButtonsController radioButtonsController = CustomRadioButtonsController(null);

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
                      // BuildTextFormField(
                      //   labelText: "Name",
                      //   controller: controllerX,
                      //   keyboardType: TextInputType.text,
                      //   filter: <TextInputFormatter>[
                      //     FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z.-]')),
                      //   ],
                      // ),

                      const SizedBox(
                        height: 20,
                      ),
                      // Row(
                      //   children: [
                      //     const Text(
                      //       "  Date of Birth",
                      //       style: TextStyle(
                      //         fontFamily: 'OpenSans',
                      //         fontSize: 16,
                      //         color: Colors.black,
                      //       ),
                      //     ),
                      //   ],
                      //
                      // ),
                      const SizedBox(
                        height: 5,
                      ),
                      InputDecorator(
                        decoration: InputDecoration(
                          labelText: "Date of Birth",
                          // errorText: "errorText",
                          // floatingLabelBehavior: FloatingLabelBehavior.always,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 14, horizontal: 10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 110,
                              padding: EdgeInsets.only(left: 15),
                              decoration: BoxDecoration(
                                  color: Colors.black12,
                                  borderRadius: BorderRadius.circular(5)),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<int>(
                                    hint: Text("Select"),
                                    value: selectedDayValue,
                                    items: dateTimeUtility.allDays
                                        .map((int value) {
                                      return DropdownMenuItem<int>(
                                        value: value,
                                        child: Text(value.toString()),
                                      );
                                    }).toList(),
                                    onChanged: (newVal) {
                                      // selected_item = newVal!;
                                      setState(() {
                                        selectedDayValue = newVal!;
                                        dateTimeUtility.validateDayMonthYear(
                                            selectedDayValue,
                                            selectedMonthValue,
                                            selectedYearValue);
                                        selectedDayValue =
                                            dateTimeUtility.correctedDay;
                                      });
                                    }),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 130,
                              padding: EdgeInsets.only(left: 15),
                              decoration: BoxDecoration(
                                  color: Colors.black12,
                                  borderRadius: BorderRadius.circular(5)),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                    hint: Text("Select"),
                                    value: selectedMonthValue,
                                    items: dateTimeUtility.allMonths
                                        .map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value.toString()),
                                      );
                                    }).toList(),
                                    onChanged: (newVal) {
                                      // selected_item = newVal!;
                                      setState(() {
                                        selectedMonthValue = newVal!;
                                        dateTimeUtility.validateDayMonthYear(
                                            selectedDayValue,
                                            selectedMonthValue,
                                            selectedYearValue);
                                        selectedDayValue =
                                            dateTimeUtility.correctedDay;
                                      });
                                    }),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 110,
                              padding: EdgeInsets.only(left: 15),
                              decoration: BoxDecoration(
                                  color: Colors.black12,
                                  borderRadius: BorderRadius.circular(5)),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<int>(
                                    hint: Text("Select"),
                                    value: selectedYearValue,
                                    items: dateTimeUtility.allYears
                                        .map((int value) {
                                      return DropdownMenuItem<int>(
                                        value: value,
                                        child: Text(value.toString()),
                                      );
                                    }).toList(),
                                    onChanged: (newVal) {
                                      // selected_item = newVal!;
                                      setState(() {
                                        selectedYearValue = newVal!;
                                        dateTimeUtility.validateDayMonthYear(
                                            selectedDayValue,
                                            selectedMonthValue,
                                            selectedYearValue);
                                        selectedDayValue =
                                            dateTimeUtility.correctedDay;
                                      });
                                    }),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(
                        height: 20,
                      ),
                      BuildTextFormField(
                        labelText: "Experience",
                        controller: controllerExperience,
                        keyboardType: TextInputType.text,
                        filter: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[a-zA-Z1-9/.-]')),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      BuildTextFormField(
                        labelText: "Workplace",
                        controller: controllerWorkplace,
                        keyboardType: TextInputType.text,
                        filter: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[a-zA-Z1-9/.-]')),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      //Radio Button
                      InputDecorator(
                        decoration: InputDecoration(
                          labelText: "Gender",
                          // errorText: "errorText",
                          // floatingLabelBehavior: FloatingLabelBehavior.always,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 14, horizontal: 10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              // color: Colors.black12,
                            ),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Radio<Gender>(
                                  value: Gender.Male,
                                  groupValue: selectedGender,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedGender = value!;
                                    });
                                  },
                                ),
                                SizedBox(width: 0,),
                                Text("Male"),

                                Radio<Gender>(
                                  value: Gender.Female,
                                  groupValue: selectedGender,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedGender = value!;
                                    });
                                  },
                                ),
                                SizedBox(width: 0,),
                                Text("Female"),

                                Radio<Gender>(
                                  value: Gender.Other,
                                  groupValue: selectedGender,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedGender = value!;
                                    });
                                  },
                                ),
                                SizedBox(width: 0,),
                                Text("Other"),


                              ],
                            )
                        ),
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      BuildTextFormField(
                        labelText: "NID",
                        controller: controllerNID,
                        keyboardType: TextInputType.number,
                        filter: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      BuildTextFormField(
                        labelText: "Present Address",
                        controller: controllerPresentAddress,
                        keyboardType: TextInputType.text,
                        filter: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[a-zA-Z.-/]')),
                        ],
                        maxLines: 2,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      BuildTextFormField(
                        labelText: "Permanent Address",
                        controller: controllerPermanentAddress,
                        keyboardType: TextInputType.text,
                        filter: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[a-zA-Z.-/]')),
                        ],
                        maxLines: 2,
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      // BuildTextFormField(
                      //   labelText: "Email",
                      //   controller: controllerEmail,
                      // ),
                      // const SizedBox(height: 20,),
                      // BuildTextFormField(
                      //   labelText: "Password",
                      //   controller: controllerPassword,
                      // ),
                      // const SizedBox(height: 20,),
                      // BuildTextFormField(
                      //   labelText: "Confirm Password",
                      //   controller: controllerConfirmPassword,
                      // ),



                      TextButton(
                        onPressed: () {
                          print(selectedDayValue.toString() +
                              " " +
                              selectedMonthValue.toString() +
                              " " +
                              selectedYearValue.toString());
                          // print(radioButtonsController.selectedItem);
                          if(selectedGender==Gender.Male) print("Male");
                          else if(selectedGender==Gender.Female) print("Female");
                          else if(selectedGender==Gender.Other) print("Other");
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
  final TextInputType keyboardType;
  final double? maxLines;

  dynamic filter;

  BuildTextFormField(
      {Key? key,
      required this.labelText,
      required this.controller,
      required this.keyboardType,
      required this.filter,
      this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(color: Colors.green),
      height: (maxLines == null ? 55 : maxLines! * 55 * .82),
      child: TextField(
        maxLines: 5,
        // autofocus: true,
        // onChanged: onChanged,
        // onSubmitted: onSubmitted,
        keyboardType: keyboardType,
        inputFormatters: filter,
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
      ),
    );
  }
}


class CustomRadioButtonsController {
  dynamic selectedItem;
  CustomRadioButtonsController(this.selectedItem);
}

class CustomRadioButtons extends StatefulWidget {

  List<dynamic> radioItems;
  CustomRadioButtonsController radioButtonsController;
  dynamic scrollDirection;

  CustomRadioButtons({Key? key, required this.radioItems, required this.radioButtonsController, required this.scrollDirection}) : super(key: key);

  @override
  _CustomRadioButtonsState createState() => _CustomRadioButtonsState(radioItems: radioItems, radioButtonsController: radioButtonsController, scrollDirection: scrollDirection);
}

class _CustomRadioButtonsState extends State<CustomRadioButtons> {

  List<dynamic> radioItems;
  CustomRadioButtonsController radioButtonsController;
  dynamic scrollDirection;

  _CustomRadioButtonsState({required this.radioItems, required this.radioButtonsController, required this.scrollDirection});

  Widget radioItemBuilder(dynamic radioItem, CustomRadioButtonsController radioButtonsController) {
    return Column(
      children: <Widget>[
        Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Radio<dynamic>(
              value: radioItem,
              groupValue: radioButtonsController.selectedItem,
              onChanged: (value) {
                setState(() {
                  radioButtonsController.selectedItem = value!;
                });
                // print(value);
              },
            ),
            const Padding(padding: EdgeInsets.only(left: 0.0)),
            Text(
              radioItem.toString(),
              style: const TextStyle(
                fontSize: 16,
              ),
            ),



          ],
        ),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.separated(
        // scrollDirection: Axis.vertical,
        scrollDirection: scrollDirection,
        itemBuilder: (BuildContext context, int index)=>radioItemBuilder(radioItems[index], radioButtonsController),
        // separatorBuilder: (BuildContext context, int index) =>const SizedBox(height: 10,),
        separatorBuilder: (BuildContext context, int index) => (scrollDirection==Axis.horizontal? SizedBox(width: 10,): SizedBox(height: 0,)),
        itemCount: radioItems.length,
      ),
    );
  }
}
