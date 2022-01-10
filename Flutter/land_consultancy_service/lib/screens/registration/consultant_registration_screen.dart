import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'dart:async';
import 'package:land_consultancy_service/src/custom_date_time_utility.dart';



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

  final TextEditingController controllerName = TextEditingController(text: 'Mr. X');
  final TextEditingController controllerNID = TextEditingController(text: '10910920202021');
  final TextEditingController controllerCell = TextEditingController(text: '01521211212');
  final TextEditingController controllerEmail = TextEditingController(text: 'x@gmail.com');
  final TextEditingController controllerPassword = TextEditingController(text: 'password');
  final TextEditingController controllerConfirmPassword = TextEditingController(text: 'password');
  final TextEditingController controllerExperience = TextEditingController(text: 'Experience');
  final TextEditingController controllerPresentAddress = TextEditingController(text: 'Address 1');
  final TextEditingController controllerPermanentAddress = TextEditingController(text: 'Address 2');
  final TextEditingController controllerWorkplace = TextEditingController(text: 'Workplace');


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


  CustomRadioButtonsController radioButtonsController = CustomRadioButtonsController(null);

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

                      /* Name field*/
                      BuildTextFormField(
                        labelText: "Name",
                        controller: controllerName,
                        keyboardType: TextInputType.text,
                        filter: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[a-zA-Z.-]')),
                        ],
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

                      const SizedBox(
                        height: 20,
                      ),


                      /*   Gender Radio Buttons  Decorated */
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
                          // color: Colors.yellow,
                          height: 50,
                          child: CustomRadioButtons(
                            radioItems: ["Male", "Female", "Other"],
                            radioButtonsController: radioButtonsController,
                            // scrollDirection: Axis.vertical,
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
                      ),

                      /*   Gender Radio Buttons  Non Decorated */
                      // Container(
                      //   // color: Colors.yellow,
                      //   height: 50,
                      //   child: CustomRadioButtons(
                      //     radioItems: ["Male", "Female", "Other"],
                      //     radioButtonsController: radioButtonsController,
                      //     // scrollDirection: Axis.vertical,
                      //     scrollDirection: Axis.horizontal,
                      //   ),
                      // ),

                      const SizedBox(
                        height: 20,
                      ),

                      /* Experience field*/
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

                      /* Workplace field*/
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

                      /* Present Address field*/
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

                      /* Permanent Address field*/
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


                      TextButton(
                        onPressed: () {
                          // setState(() {});
                          print(controllerName.text);
                          print(dropDownControllerDay.selectedItem.toString() +
                              " " +
                              dropDownControllerMonth.selectedItem.toString() +
                              " " +
                              dropDownControllerYear.selectedItem.toString());
                          print(radioButtonsController.selectedItem);
                          print(controllerExperience.text);
                          print(controllerWorkplace.text);
                          print(controllerPresentAddress.text);
                          print(controllerPermanentAddress.text);
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

// class BuildTextFormField extends StatelessWidget {
//   final String labelText;
//   final TextEditingController controller;
//
//   const BuildTextFormField(
//       {Key? key, required this.labelText, required this.controller})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       // autofocus: true,
//       // onChanged: onChanged,
//       // onSubmitted: onSubmitted,
//       // keyboardType: keyboardType,
//       // textInputAction: textInputAction,
//       // obscureText: false,
//       controller: controller,
//       decoration: InputDecoration(
//         labelText: labelText,
//         // errorText: "errorText",
//         // floatingLabelBehavior: FloatingLabelBehavior.always,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: const BorderSide(
//             color: Colors.blue,
//           ),
//         ),
//       ),
//     );
//   }
// }


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


class DropDownController {
  dynamic selectedItem;
  DropDownController(this.selectedItem);
}

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


