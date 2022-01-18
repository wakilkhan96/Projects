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
    extends State<ConsultantRegistrationScreen> with TickerProviderStateMixin {
  late TabController tabController;

  int currentTab = 0;
  List<bool> _isDisabled = [false, true, true, true];
  List<bool> _isComplete = [false, false, false, false];

  // final GlobalKey<_ConsultantRegistrationScreenState> parent = GlobalKey();
  final formGlobalKey1 = GlobalKey<FormState>();
  final formGlobalKey2 = GlobalKey<FormState>();
  final formGlobalKey3 = GlobalKey<FormState>();
  final formGlobalKey4 = GlobalKey<FormState>();

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
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30
  ];

  CustomDateTimeUtility dateTimeUtility = CustomDateTimeUtility();

  Gender selectedGender = Gender.Male;

  CustomController customController = CustomController();

  List<Widget> specialities = [];

  List<ItemStateInfo> itemStates = [];

  _ConsultantRegistrationScreenState() {
    super.initState();
    itemStates.add(
      ItemStateInfo(selectionItem: "item 1", isSelected: false),
    );
    itemStates.add(
      ItemStateInfo(selectionItem: "item 2", isSelected: false),
    );
    itemStates.add(
      ItemStateInfo(selectionItem: "item 3", isSelected: false),
    );

    tabController = TabController(initialIndex: 0, length: 4, vsync: this);
    tabController.addListener(() {
      if (tabController.index < currentTab) {
        currentTab = tabController.index;
        tabController.animateTo(currentTab);
      } else if (_isComplete[currentTab] && !_isDisabled[tabController.index]) {
        currentTab = tabController.index;
        tabController.animateTo(currentTab);
      } else {
        tabController.animateTo(currentTab);
      }
    });
  }

  // @override
  // void initState() {
  //   super.initState();
  //   tabController = TabController(initialIndex: 0, length: 3, vsync: this);
  //   tabController.addListener(() {
  //     if(tabController.index < currentTab) {
  //       currentTab = tabController.index;
  //       tabController.animateTo(currentTab);
  //     }
  //     else if(_isComplete[currentTab] && !_isDisabled[tabController.index]) {
  //       currentTab = tabController.index;
  //       tabController.animateTo(currentTab);
  //     }
  //     else {
  //       tabController.animateTo(currentTab);
  //     }
  //
  //   });
  //
  // }

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
              child: Column(
                children: <Widget>[
                  Container(
                    height: 50,
                    child: AppBar(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                        ),
                      ),
                      backgroundColor: Color.fromRGBO(0, 77, 136, 1),
                      bottom: TabBar(
                        controller: tabController,
                        indicatorColor: Colors.cyan,
                        indicatorWeight: 3,
                        tabs: const <Widget>[
                          Tab(
                            child: Text(
                              "Step 1",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "Step 2",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "Step 3",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "Step 4",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: tabController,
                      physics: const NeverScrollableScrollPhysics(),
                      children: <Widget>[
                        // 1
                        Container(
                          // color: Colors.grey,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Form(
                                  key: formGlobalKey1,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        const Text(
                                          "Academic Qualification",
                                          style: TextStyle(
                                            fontFamily: 'OpenSans',
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black,
                                          ),
                                        ),

                                        SizedBox(
                                          height: 50,
                                        ),

                                        Container(
                                          margin: EdgeInsets.all(0),
                                          height: 50.0,
                                          // width: 100.0,
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            boxShadow: const [
                                              BoxShadow(
                                                color: Colors.grey,
                                                // blurRadius: 4,
                                                // offset: Offset(0, 2),
                                              ),
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Material(
                                            color: Colors.blue,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: InkWell(
                                              onTap: () async {
                                                print("tap_detected_academic_qualification_add_new");

                                                await showDialog(
                                                  context: context,
                                                  builder: (ctx) {
                                                    return AlertDialog(
                                                      // title: Text('Select Items'),
                                                      // actions: <Widget>[
                                                      //   TextButton(
                                                      //     onPressed: () {
                                                      //       setState(() {
                                                      //         specialities
                                                      //             .clear();
                                                      //
                                                      //         for (int i = 0;
                                                      //             i <
                                                      //                 customController
                                                      //                     .selectedItems
                                                      //                     .length;
                                                      //             i++) {
                                                      //           specialities
                                                      //               .add(
                                                      //             cardItem(
                                                      //               customController
                                                      //                   .selectedItems[i],
                                                      //               customController
                                                      //                   .selectedItemsIndexID[i],
                                                      //               customController,
                                                      //             ),
                                                      //           );
                                                      //         }
                                                      //       });
                                                      //
                                                      //       Navigator.pop(
                                                      //           context);
                                                      //     },
                                                      //     child: Text('Ok'),
                                                      //   ),
                                                      // ],
                                                      content: Container(
                                                        width: 350,
                                                        height: 550,
                                                        // child: CustomMultiSelectionButton(
                                                        //   multiSelectionItems: ["Item 1", "Item 2", "Item 3"],
                                                        //   multiSelectionButtonController: customController,
                                                        // ),
                                                        child: SingleChildScrollView(
                                                          child: Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: <Widget>[
                                                              const Text("Add New", style: TextStyle(fontSize: 22, color: Colors.blue, fontWeight: FontWeight.w800),),
                                                              Text("Educational Qualification", style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w400),),

                                                              SizedBox(height: 50,),
                                                              Container(
                                                                margin: EdgeInsets.all(0),
                                                                height: 50.0,
                                                                // width: 100.0,
                                                                decoration: BoxDecoration(
                                                                  color: Colors.transparent,
                                                                  boxShadow: const [
                                                                    BoxShadow(
                                                                      color: Colors.grey,
                                                                      // blurRadius: 4,
                                                                      // offset: Offset(0, 2),
                                                                    ),
                                                                  ],
                                                                  borderRadius:
                                                                  BorderRadius.circular(10),
                                                                ),
                                                                child: Material(
                                                                  color: Colors.blue,
                                                                  borderRadius:
                                                                  BorderRadius.circular(10),
                                                                  child: InkWell(
                                                                    onTap: () {
                                                                      print("tap_detected_save_new_educational_qualification");
                                                                      Navigator.pop(context);
                                                                    },
                                                                    child: const Center(
                                                                      child: Text(
                                                                        "Save",
                                                                        style: TextStyle(
                                                                          fontSize: 20,
                                                                          fontWeight: FontWeight.w600,
                                                                          color: Colors.black87,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),


                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                              child: const Center(
                                                child: Text(
                                                  "Add New",
                                                  style: TextStyle(
                                                    fontSize: 22,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.black87,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                OutlinedButton(
                                  onPressed: () {
                                    _isComplete[currentTab] = true;
                                    if (currentTab + 1 < tabController.length)
                                      _isDisabled[currentTab + 1] = false;
                                  },
                                  child: Text("Make Tab 1 complete"),
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    tabController.animateTo(1);
                                  },
                                  child: const Text("It's cloudy here"),
                                ),
                              ],
                            ),
                          ),
                        ),

                        //2
                        Container(
                          // color: Colors.blueGrey,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Form(
                                  key: formGlobalKey2,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        const Text(
                                          "Expertise",
                                          style: TextStyle(
                                            fontFamily: 'OpenSans',
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 40,
                                        ),
                                        InputDecorator(
                                          decoration: InputDecoration(
                                            labelText: "Specialities",
                                            // errorText: "errorText",
                                            // floatingLabelBehavior: FloatingLabelBehavior.always,
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 14,
                                                    horizontal: 10),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              borderSide: const BorderSide(
                                                color: Colors.blue,
                                              ),
                                            ),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Card(
                                                shape: RoundedRectangleBorder(
                                                  side: BorderSide(
                                                      color: Colors.blue,
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: InkWell(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 10,
                                                              vertical: 5),
                                                      child: Row(
                                                        children: const [
                                                          Text(
                                                            // (specialities.isEmpty? "Select Specialities": "Selected Specialities"),
                                                            "Select/Selected Specialities",
                                                            style: TextStyle(
                                                                fontSize: 18),
                                                          ),
                                                          Expanded(
                                                            child: SizedBox(
                                                              height: 1,
                                                            ),
                                                          ),
                                                          Icon(
                                                            Icons
                                                                .arrow_drop_down,
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
                                                            title: Text(
                                                                'Select Items'),
                                                            actions: <Widget>[
                                                              TextButton(
                                                                onPressed: () {
                                                                  setState(() {
                                                                    specialities
                                                                        .clear();

                                                                    for (int i =
                                                                            0;
                                                                        i < customController.selectedItems.length;
                                                                        i++) {
                                                                      specialities
                                                                          .add(
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

                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child:
                                                                    Text('Ok'),
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
                                                                children: <
                                                                    Widget>[
                                                                  itemBuilder(
                                                                      0),
                                                                  itemBuilder(
                                                                      1),
                                                                  itemBuilder(
                                                                      2),
                                                                ],
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    }),
                                              ),
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
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                OutlinedButton(
                                  onPressed: () {
                                    _isComplete[currentTab] = true;
                                    if (currentTab + 1 < tabController.length)
                                      _isDisabled[currentTab + 1] = false;
                                  },
                                  child: Text("Make Tab 2 complete"),
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    tabController.animateTo(2);
                                  },
                                  child: Text("It's cloudy here"),
                                ),
                              ],
                            ),
                          ),
                        ),

                        //3
                        Container(
                          // color: Colors.brown,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Form(
                                  key: formGlobalKey3,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        const Text(
                                          "Experience",
                                          style: TextStyle(
                                            fontFamily: 'OpenSans',
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 40,
                                        ),
                                        InputDecorator(
                                          decoration: InputDecoration(
                                            labelText: "Experience",
                                            // errorText: "errorText",
                                            // floatingLabelBehavior: FloatingLabelBehavior.always,
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 10,
                                                    horizontal: 10),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
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
                                                padding:
                                                    EdgeInsets.only(left: 15),
                                                decoration: BoxDecoration(
                                                  // color: Colors.black12,
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  border: Border.all(
                                                    color: Colors.blue,
                                                  ),
                                                ),
                                                child:
                                                    DropdownButtonHideUnderline(
                                                  child: DropdownButton<int>(
                                                      icon: Icon(
                                                        Icons.arrow_drop_down,
                                                        size: 30,
                                                        color: Colors.blue,
                                                      ),
                                                      // alignment: AlignmentDirectional.center,
                                                      hint: Text("Select"),
                                                      value: selectedExperience,
                                                      items: experienceYear
                                                          .map((int value) {
                                                        return DropdownMenuItem<
                                                            int>(
                                                          alignment:
                                                              AlignmentDirectional
                                                                  .center,
                                                          value: value,
                                                          child: Text(
                                                              value.toString()),
                                                        );
                                                      }).toList(),
                                                      onChanged: (newVal) {
                                                        // selected_item = newVal!;
                                                        setState(() {
                                                          selectedExperience =
                                                              newVal!;
                                                        });
                                                      }),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 60,
                                              ),
                                              Text(
                                                " Years ",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                OutlinedButton(
                                  onPressed: () {
                                    _isComplete[currentTab] = true;
                                    if (currentTab + 1 < tabController.length)
                                      _isDisabled[currentTab + 1] = false;
                                  },
                                  child: Text("Make Tab 3 complete"),
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    // print("done");
                                    tabController.animateTo(3);
                                  },
                                  child: Text("It's cloudy here"),
                                ),
                              ],
                            ),
                          ),
                        ),

                        //4
                        Container(
                          // color: Colors.brown,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Form(
                                  key: formGlobalKey4,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: const [
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "Availability",
                                          style: TextStyle(
                                            fontFamily: 'OpenSans',
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 40,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                OutlinedButton(
                                  onPressed: () {
                                    _isComplete[currentTab] = true;
                                    if (currentTab + 1 < tabController.length)
                                      _isDisabled[currentTab + 1] = false;
                                  },
                                  child: Text("Make Tab 4 complete"),
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    // print("done");
                                    tabController.animateTo(0);
                                  },
                                  child: Text("It's cloudy here"),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
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
