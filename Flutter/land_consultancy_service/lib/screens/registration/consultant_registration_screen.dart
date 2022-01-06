import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';

class DropDownController {
  dynamic value;
  DropDownController(this.value);
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

  final TextEditingController controllerX =
      TextEditingController(text: 'Mr. X');
  final formGlobalKey = GlobalKey<FormState>();

  // List<int> myMenuItems = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  List<DropDownItemsButton> dropDownButtons = [];
  DropDownController dropDownControllerDay = DropDownController(null);
  DropDownController dropDownControllerMonth = DropDownController(null);
  DropDownController dropDownControllerYear = DropDownController(null);

  _ConsultantRegistrationScreenState() {}
  // int selected_item_int = 1;
  // String selected_item_string = "one";
  // dynamic selectedDayItem;
  // dynamic selectedMonthItem;
  // dynamic selectedYearItem;

  // Widget dropdownItems({required List<dynamic>menuItems}) {
  //   dynamic selectedItem;
  //
  //   return DropdownButtonHideUnderline(
  //     child: DropdownButton<dynamic>(
  //         hint: Text("Pick"),
  //         // value: selected_item,
  //         value: selectedItem,
  //         items: menuItems.map((dynamic value) {
  //           return DropdownMenuItem<dynamic>(
  //             value: value,
  //             child: Text(value.toString()),
  //           );
  //         }).toList(),
  //         onChanged: (newVal) {
  //           // selected_item = newVal!;
  //           setState(() {
  //             print("changed");
  //             selectedItem = newVal!;
  //           });
  //         }),
  //   );
  // }

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
                      SizedBox(
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
                      SizedBox(
                        height: 40,
                      ),
                      BuildTextFormField(
                        labelText: "Name",
                        controller: controllerX,
                      ),



                      SizedBox(height: 20,),
                      Row(
                        children: [
                          // SizedBox(width: 10,),
                          Expanded(
                            flex: 2,
                            child: SizedBox(
                              // height:  70,
                              child: NamedInputFieldDecorator(
                                labelText: "Day",
                                child: DropDownItemsButton(
                                  dropDownItems: const [1, 2, 3],
                                  dropDowController: dropDownControllerDay,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Expanded(
                            flex: 3,
                            child: SizedBox(
                              // height:  70,
                              child: NamedInputFieldDecorator(
                                labelText: "Month",
                                child: DropDownItemsButton(
                                  dropDownItems: const ["January", "February", "March"],
                                  dropDowController: dropDownControllerMonth,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Expanded(
                            flex: 2,
                            child: SizedBox(
                              // height:  70,
                              child: NamedInputFieldDecorator(
                                labelText: "Year",
                                child: DropDownItemsButton(
                                  dropDownItems: const [2000, 2001, 2002],
                                  dropDowController: dropDownControllerYear,
                                ),
                              ),
                            ),
                          ),
                          // SizedBox(width: 10,),

                        ],
                        // children: [
                        //   // Expanded(
                        //   //   flex: 2,
                        //   //   child: DropdownButtonHideUnderline(
                        //   //     child: DropdownButton<int>(
                        //   //         hint: Text("Pick"),
                        //   //         value: selected_item,
                        //   //         items: menuItems.map((int value) {
                        //   //           return DropdownMenuItem<int>(
                        //   //             value: value,
                        //   //             child: Text(value.toString()),
                        //   //           );
                        //   //         }).toList(),
                        //   //         onChanged: (newVal) {
                        //   //           // selected_item = newVal!;
                        //   //           setState(() {
                        //   //             selected_item = newVal!;
                        //   //           });
                        //   //         }),
                        //   //   ),
                        //   // ),
                        //   // Expanded(
                        //   //   flex: 3,
                        //   //   child: DropdownButtonHideUnderline(
                        //   //     child: DropdownButton<int>(
                        //   //         // isExpanded: true,
                        //   //         hint: Text("Pick"),
                        //   //         value: selected_item,
                        //   //         items: menuItems.map((int value) {
                        //   //           return DropdownMenuItem<int>(
                        //   //             value: value,
                        //   //             child: Text(value.toString()),
                        //   //           );
                        //   //         }).toList(),
                        //   //         onChanged: (newVal) {
                        //   //           // selected_item = newVal!;
                        //   //           setState(() {
                        //   //             selected_item = newVal!;
                        //   //           });
                        //   //         }),
                        //   //   ),
                        //   // ),
                        //   // Expanded(
                        //   //   flex: 2,
                        //   //   child: DropdownButtonHideUnderline(
                        //   //     child: DropdownButton<int>(
                        //   //         hint: Text("Pick"),
                        //   //         value: selected_item,
                        //   //         items: menuItems.map((int value) {
                        //   //           return DropdownMenuItem<int>(
                        //   //             value: value,
                        //   //             child: Text(value.toString()),
                        //   //           );
                        //   //         }).toList(),
                        //   //         onChanged: (newVal) {
                        //   //           // selected_item = newVal!;
                        //   //           setState(() {
                        //   //             selected_item = newVal!;
                        //   //           });
                        //   //         }),
                        //   //   ),
                        //   // ),
                        //
                        //   // dropdownItems(menuItems: [1, 2, 3]),
                        //   // dropdownItems(menuItems: [1, 2, 3]),
                        //   // DropdownItemsButton(dropDownItems: [1, 2, 3], parent: parent,),
                        //   DropDownItemsButton(
                        //     dropDownItems: [1, 2, 3],
                        //   ),
                        //   DropDownItemsButton(
                        //     dropDownItems: ["Jan","Feb", "Mar"],
                        //   ),
                        //   DropDownItemsButton(
                        //     dropDownItems: [2019, 2020, 2021],
                        //   ),
                        //
                        //
                        // ],
                      ),

                      TextButton(
                        onPressed: () {
                          print(
                            dropDownControllerDay.value.toString() + " " +
                            dropDownControllerMonth.value.toString() + " " +
                            dropDownControllerYear.value.toString()
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

class DropDownItemsButton extends StatefulWidget {
  List<dynamic> dropDownItems;
  DropDownController dropDowController;
  DropDownItemsButton(
      {Key? key, required this.dropDownItems, required this.dropDowController})
      : super(key: key);

  @override
  _DropDownItemsButtonState createState() => _DropDownItemsButtonState(
      dropDownItems: dropDownItems, dropDowController: dropDowController);
}

class _DropDownItemsButtonState extends State<DropDownItemsButton> {
  // final Function onChangedFunction;
  dynamic selectedItem;
  List<dynamic> dropDownItems;
  DropDownController dropDowController;

  _DropDownItemsButtonState(
      {Key? key, required this.dropDownItems, required this.dropDowController});
  // _DropDownItemsButtonState({Key? key, required this.dropDownItems, required this.onChangedFunction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<dynamic>(
          hint: Text("Pick"),
          // value: selected_item,
          value: selectedItem,
          items: dropDownItems.map((dynamic value) {
            return DropdownMenuItem<dynamic>(
              value: value,
              child: Text(value.toString()),
            );
          }).toList(),
          onChanged: (newValue) {
            selectedItem = newValue!;
            setState(() {
              // print("changed");
              selectedItem = newValue!;
              dropDowController.value = selectedItem;
            });
          }),
    );
  }
}

class NamedInputFieldDecorator extends StatelessWidget {
  final String labelText;
  final dynamic child;
  const NamedInputFieldDecorator({Key? key, required this.labelText, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
        labelText: labelText,
        contentPadding: EdgeInsets.only(left: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7.0),
        ),
      ),
      child: child
    );

  }
}

