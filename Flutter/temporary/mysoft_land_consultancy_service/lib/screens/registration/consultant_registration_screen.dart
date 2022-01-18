import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import 'dart:io';
import 'dart:async';
import 'package:land_consultancy_service/src/custom_date_time_utility.dart';

enum Gender { Male, Female, Other }

class CustomController {
  // List<dynamic> selectedItems = [];
  // List<int> selectedItemsIndices = [];
  List<dynamic> selectedItems = [];
  List<int> selectedItemsIndexID = [];
  // customController(this.selectedItems);

  List<dynamic> getSelectedItemsValues() {
    List<dynamic> selectedItemsValues = [];
    for (var eachItem in selectedItems) {
      selectedItemsValues.add(eachItem.itemValue);
    }
    return selectedItemsValues;
  }

  List<dynamic> getSelectedItemsIndices() {
    List<dynamic> selectedItemsIndices = [];
    for (var eachItem in selectedItems) {
      selectedItemsIndices.add(eachItem.itemIndex);
    }
    return selectedItemsIndices;
  }
}

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

  int selectedExperience = 0;
  List<int> experienceYear = [
    0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10,
    11, 12, 13, 14, 15, 16, 17, 18, 19, 20,
    21, 22, 23, 24, 25, 26, 27, 28, 29, 30 ];

  CustomDateTimeUtility dateTimeUtility = CustomDateTimeUtility();

  Gender selectedGender = Gender.Male;

  CustomController customController = CustomController();

  List<Widget> specialities = [];

  List<ItemStateInfo> itemStates = [];

  _ConsultantRegistrationScreenState() {
    itemStates.add(
      ItemStateInfo(selectionItem: "item 1", isSelected: false),
    );
    itemStates.add(
      ItemStateInfo(selectionItem: "item 2", isSelected: false),
    );
    itemStates.add(
      ItemStateInfo(selectionItem: "item 3", isSelected: false),
    );

    // for (int i = 0; i < itemStates.length; i++) {
    //   print(itemStates[i].selectionItem +
    //       " = " +
    //       itemStates[i].isSelected.toString());
    // }
  }

  Widget itemBuilder(int index) {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      return Row(
        children: <Widget>[
          Checkbox(
              value: itemStates[index].isSelected,
              onChanged: (value) {
                setState(() {
                  itemStates[index].isSelected = !itemStates[index].isSelected;

                  if (itemStates[index].isSelected) {
                    customController.selectedItems
                        .add(itemStates[index].selectionItem);
                    customController.selectedItemsIndexID.add(index);
                  } else {
                    customController.selectedItems
                        .remove(itemStates[index].selectionItem);
                    customController.selectedItemsIndexID.remove(index);
                  }

                  // print(customController.selectedItems);
                });
              }),
          const Padding(padding: EdgeInsets.only(left: 0.0)),
          Text(
            itemStates[index].selectionItem.toString(),
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      );
    });
  }

  Widget cardItem(dynamic selectedItem, int selectedItemIndex,
      CustomController controller) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.blue, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      color: Color.fromRGBO(228, 240, 250, 1),
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        child: Wrap(
          children: [
            InkWell(
              child: const Icon(
                Icons.clear,
                size: 20,
              ),
              onTap: () {
                print("tapped_on_clear_icon");
                // print(controller.selectedItems);
                controller.selectedItems.remove(selectedItem);
                controller.selectedItemsIndexID.remove(selectedItemIndex);
                itemStates[selectedItemIndex].isSelected = false;

                setState(() {
                  specialities.clear();
                  for (int i = 0;
                      i < customController.selectedItems.length;
                      i++) {
                    specialities.add(
                      cardItem(
                        customController.selectedItems[i],
                        customController.selectedItemsIndexID[i],
                        customController,
                      ),
                    );
                  }
                });
              },

              // splashColor: Color.fromRGBO(229, 240, 250, 1),
              borderRadius: BorderRadius.circular(12),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              selectedItem.toString(),
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
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

                      const SizedBox(
                        height: 20,
                      ),

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
                              height: 40,

                              padding: EdgeInsets.only(left: 15),
                              decoration: BoxDecoration(
                                // color: Colors.black12,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.blue,),
                              ),
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
                              height: 40,

                              padding: EdgeInsets.only(left: 15),
                              decoration: BoxDecoration(
                                // color: Colors.black12,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.blue,),
                              ),
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
                              height: 40,

                              padding: EdgeInsets.only(left: 15),
                              decoration: BoxDecoration(
                                // color: Colors.black12,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.blue,),
                              ),
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

                      // BuildTextFormField(
                      //   labelText: "Experience",
                      //   controller: controllerExperience,
                      //   keyboardType: TextInputType.text,
                      //   filter: <TextInputFormatter>[
                      //     FilteringTextInputFormatter.allow(
                      //         RegExp(r'[a-zA-Z1-9/.-]')),
                      //   ],
                      // ),

                      InputDecorator(
                        decoration: InputDecoration(
                          labelText: "Specialities",
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Card(
                                shape: RoundedRectangleBorder(
                                  side:
                                  BorderSide(color: Colors.blue, width: 1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: InkWell(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      child: Row(
                                        children: const [
                                          Text(
                                            // (specialities.isEmpty? "Select Specialities": "Selected Specialities"),
                                            "Select/Selected Specialities",
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          Expanded(
                                            child: SizedBox(
                                              height: 1,
                                            ),
                                          ),
                                          Icon(
                                            Icons.arrow_drop_down,
                                            size: 30,
                                            color: Colors.blue,
                                          ),
                                        ],
                                      ),
                                    ),
                                    onTap: () async {
                                      await showDialog(
                                        context: context,
                                        builder: (ctx) {
                                          return AlertDialog(
                                            title: Text('Select Items'),
                                            actions: <Widget>[
                                              TextButton(
                                                onPressed: () {
                                                  setState(() {
                                                    specialities.clear();

                                                    for (int i = 0;
                                                    i <
                                                        customController
                                                            .selectedItems
                                                            .length;
                                                    i++) {
                                                      specialities.add(
                                                        cardItem(
                                                          customController
                                                              .selectedItems[i],
                                                          customController
                                                              .selectedItemsIndexID[i],
                                                          customController,
                                                        ),
                                                      );
                                                    }
                                                  });

                                                  Navigator.pop(context);
                                                },
                                                child: Text('Ok'),
                                              ),
                                            ],
                                            content: Container(
                                              width: 250,
                                              height: 300,
                                              // child: CustomMultiSelectionButton(
                                              //   multiSelectionItems: ["Item 1", "Item 2", "Item 3"],
                                              //   multiSelectionButtonController: customController,
                                              // ),
                                              child: Column(
                                                children: <Widget>[
                                                  itemBuilder(0),
                                                  itemBuilder(1),
                                                  itemBuilder(2),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      );

                                    })),
                            Wrap(
                              direction: Axis.horizontal,
                              children: specialities,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      InputDecorator(
                        decoration: InputDecoration(
                          labelText: "Experience",
                          // errorText: "errorText",
                          // floatingLabelBehavior: FloatingLabelBehavior.always,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 220,
                              height: 40,
                              padding: EdgeInsets.only(left: 15),
                              decoration: BoxDecoration(
                                // color: Colors.black12,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.blue,),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<int>(
                                  icon: Icon(Icons.arrow_drop_down, size: 30, color: Colors.blue,),
                                  // alignment: AlignmentDirectional.center,
                                    hint: Text("Select"),
                                    value: selectedExperience,
                                    items: experienceYear
                                        .map((int value) {
                                      return DropdownMenuItem<int>(
                                        alignment: AlignmentDirectional.center,
                                        value: value,
                                        child: Text(value.toString()),
                                      );
                                    }).toList(),
                                    onChanged: (newVal) {
                                      // selected_item = newVal!;
                                      setState(() {
                                        selectedExperience = newVal!;
                                      });
                                    }),
                              ),
                            ),
                            SizedBox(width: 60,),
                            Text(
                              " Years ", style: TextStyle(fontSize: 20, ),
                            ),
                          ],
                        ),
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
                                SizedBox(
                                  width: 0,
                                ),
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
                                SizedBox(
                                  width: 0,
                                ),
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
                                SizedBox(
                                  width: 0,
                                ),
                                Text("Other"),
                              ],
                            )),
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



                      const SizedBox(
                        height: 20,
                      ),

                      TextButton(
                        onPressed: () {
                          print("\n");
                          print(selectedDayValue.toString() +
                              " " +
                              selectedMonthValue.toString() +
                              " " +
                              selectedYearValue.toString());
                          // print(radioButtonsController.selectedItem);
                          print(selectedExperience);
                          print(controllerWorkplace.text);
                          if (selectedGender == Gender.Male)
                            print("Male");
                          else if (selectedGender == Gender.Female)
                            print("Female");
                          else if (selectedGender == Gender.Other)
                            print("Other");
                          print(controllerNID.text);
                          print(controllerPresentAddress.text);
                          print(controllerPermanentAddress.text);
                          print(customController.selectedItems);
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

class ItemStateInfo {
  dynamic selectionItem;
  bool isSelected;
  ItemStateInfo({required this.selectionItem, required this.isSelected});
}



