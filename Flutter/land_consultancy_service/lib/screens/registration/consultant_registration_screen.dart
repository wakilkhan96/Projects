import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'package:land_consultancy_service/src/custom_date_time_utility.dart';

class DropDownController {
  dynamic selectedItem;
  DropDownController(this.selectedItem);
}

class ConsultantRegistrationScreen extends StatefulWidget {
  static String pageID = 'consultant_registration_screen';
  const ConsultantRegistrationScreen({Key? key}) : super(key: key);

  @override
  _ConsultantRegistrationScreenState createState() =>
      _ConsultantRegistrationScreenState();
}

class _ConsultantRegistrationScreenState extends State<ConsultantRegistrationScreen> {
  // final GlobalKey<_ConsultantRegistrationScreenState> parent = GlobalKey();

  final TextEditingController controllerX = TextEditingController(text: 'Mr. X');
  final formGlobalKey = GlobalKey<FormState>();

  DropDownController dropDownControllerDay = DropDownController(null);
  DropDownController dropDownControllerMonth = DropDownController(null);
  DropDownController dropDownControllerYear = DropDownController(null);

  CustomDateTimeUtility dateTimeUtility = CustomDateTimeUtility();
  void validateDateMonthYear() {
    dateTimeUtility.validateDayMonthYear(
      dropDownControllerDay.selectedItem,
      dropDownControllerMonth.selectedItem,
      dropDownControllerYear.selectedItem,
    );
    dropDownControllerDay.selectedItem = dateTimeUtility.correctedDay;
  }

  /* dynamic dropdown item button builder*/
  Widget dropDownItemsButton({required List<dynamic> dropDownItems, required DropDownController dropDowController}) {
    // List<dynamic> dropDownItems;
    // DropDownController dropDowController;
    return DropdownButtonHideUnderline(
      child: DropdownButton<dynamic>(
          hint: Text("Pick"),
          // value: selected_item,
          value: dropDowController.selectedItem,
          items: dropDownItems.map((dynamic value) {
            return DropdownMenuItem<dynamic>(
              value: value,
              child: Text(value.toString()),
            );
          }).toList(),
          onChanged: (newValue) {
            setState(() {
              dropDowController.selectedItem = newValue!;
              validateDateMonthYear(); // external call for selected date validation
            });
          }),
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
                      BuildTextFormField(
                        labelText: "Name",
                        controller: controllerX,
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      /* Day - Month - Year Row*/
                      Row(
                        children: [
                          // SizedBox(width: 10,),
                          Expanded(
                            flex: 2,
                            child: SizedBox(
                              // height:  70,
                              child: NamedInputFieldDecorator(
                                labelText: "Day",
                                child: dropDownItemsButton(
                                  dropDownItems: dateTimeUtility.allDays,
                                  dropDowController: dropDownControllerDay,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            flex: 3,
                            child: SizedBox(
                              // height:  70,
                              child: NamedInputFieldDecorator(
                                labelText: "Month",
                                child: dropDownItemsButton(
                                  dropDownItems: dateTimeUtility.allMonths,
                                  dropDowController: dropDownControllerMonth,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            flex: 2,
                            child: SizedBox(
                              // height:  70,
                              child: NamedInputFieldDecorator(
                                labelText: "Year",
                                child: dropDownItemsButton(
                                  dropDownItems: dateTimeUtility.allYears,
                                  dropDowController: dropDownControllerYear,
                                ),
                              ),
                            ),
                          ),


                        ],

                      ),
                      TextButton(
                        onPressed: () {
                          // setState(() {});
                          print(dropDownControllerDay.selectedItem.toString() +
                              " " +
                              dropDownControllerMonth.selectedItem.toString() +
                              " " +
                              dropDownControllerYear.selectedItem.toString());
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


class NamedInputFieldDecorator extends StatelessWidget {
  final String labelText;
  final dynamic child;
  const NamedInputFieldDecorator(
      {Key? key, required this.labelText, required this.child})
      : super(key: key);

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
        child: child);
  }
}


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


/* i could not update/set State of  stateful child from parent class so did not use it,
  but will definitely try this later

// class DropDownItemsButton extends StatefulWidget {
//   List<dynamic> dropDownItems;
//   DropDownController dropDowController;
//   DropDownItemsButton(
//       {Key? key, required this.dropDownItems, required this.dropDowController})
//       : super(key: key);
//
//   @override
//   _DropDownItemsButtonState createState() => _DropDownItemsButtonState(dropDownItems: dropDownItems, dropDowController: dropDowController);
//
// }
//
// class _DropDownItemsButtonState extends State<DropDownItemsButton> {
//   // final Function onChangedFunction;
//   dynamic selectedItem;
//   List<dynamic> dropDownItems;
//   DropDownController dropDowController;
//
//   _DropDownItemsButtonState(
//       {Key? key, required this.dropDownItems, required this.dropDowController});
//   // _DropDownItemsButtonState({Key? key, required this.dropDownItems, required this.onChangedFunction}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return DropdownButtonHideUnderline(
//       child: DropdownButton<dynamic>(
//           hint: Text("Pick"),
//           // value: selected_item,
//           value: selectedItem,
//           items: dropDownItems.map((dynamic value) {
//             return DropdownMenuItem<dynamic>(
//               value: value,
//               child: Text(value.toString()),
//             );
//           }).toList(),
//           onChanged: (newValue) {
//             selectedItem = newValue!;
//             setState(() {
//               // print("changed");
//               selectedItem = newValue!;
//               dropDowController.value = selectedItem;
//             });
//           }),
//     );
//   }
// }
*/


