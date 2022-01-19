import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import 'dart:io';
import 'dart:async';
import 'package:land_consultancy_service/src/custom_date_time_utility.dart';
import 'package:land_consultancy_service/src/custom_drop_down_int.dart';
import 'package:land_consultancy_service/src/custom_drop_down_string.dart';

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
  final formGlobalKey0 = GlobalKey<FormState>();
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

  String levelOfEducationInputDecoratorLabelText = "";
  List<String> levelOfEducation = ["Secondary", "Higher Secondary", "Diploma", "Bachelor/Honors", "Masters", "PhD"];
  String selectedLevelOfEducation = "";
  // List<String> examOrDegree = ["", "Higher Secondary", "Diploma", "Bachelor/Honors", "Masters", "PhD"];

  final TextEditingController controllerInstituteName = TextEditingController(text: '');

  String instituteLocationInputDecoratorLabelText = "";
  List<String> instituteLocation = ["Dhaka", "Rajshahi", "Chittagong", "khulna",];
  String selectedInstituteLocation = "";

  String passingYearInputDecoratorLabelText = "";
  List<int> passingYear = [2010, 2011, 2012];
  int selectedPassingYear = 0;

  String durationInputDecoratorLabelText = "";
  List<int> duration = [3, 4, 5];
  int selectedDuration = 0;

  int selectedDayValue = 1;
  String selectedMonthValue = "January";
  int selectedYearValue = 2000;

  int selectedExperience = 0;
  List<int> experienceYear = [
    0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16,
    17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30
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

                        // 0
                        Container(
                          // color: Colors.grey,
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
                              const SizedBox(
                                height: 10,
                              ),

                              Expanded(
                                child: SingleChildScrollView(
                                  child: Form(
                                    key: formGlobalKey0,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [

                                          SizedBox(
                                            height: 20,
                                          ),

                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              const Text("Add New", style: TextStyle(fontSize: 22, color: Colors.blue, fontWeight: FontWeight.w800),),
                                              Text("Educational Qualification", style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w400),),

                                              SizedBox(height:  30,),
                                              InputDecorator(
                                                decoration: InputDecoration(
                                                  // labelText: "Level of Education",
                                                  labelText: levelOfEducationInputDecoratorLabelText,
                                                  // errorText: "errorText",
                                                  // floatingLabelBehavior: FloatingLabelBehavior.always,
                                                  contentPadding: const EdgeInsets.symmetric(
                                                      vertical: 0, horizontal: 5,
                                                  ),
                                                  border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(12),
                                                    borderSide: const BorderSide(
                                                      color: Colors.blue,
                                                    ),
                                                  ),
                                                ),
                                                child: Container(
                                                  // width: 220,
                                                  height: 50,
                                                  padding: EdgeInsets.only(left: 15),
                                                  decoration: BoxDecoration(
                                                    // color: Colors.black12,
                                                    borderRadius: BorderRadius.circular(12),
                                                    // border: Border.all(color: Colors.blue,),
                                                  ),

                                                  //office version
                                                  child: CustomDropDownString(
                                                    value: selectedLevelOfEducation==""? null: selectedLevelOfEducation,
                                                    itemsList: levelOfEducation,
                                                    hintText: "Level of Education",
                                                    onChanged: (value) {
                                                      setState(() {
                                                        selectedLevelOfEducation = value;
                                                        levelOfEducationInputDecoratorLabelText = "Level of Education";

                                                      });
                                                    },
                                                  ),

                                                  // self version
                                                  // child: DropdownButtonHideUnderline(
                                                  //   child: Padding(
                                                  //
                                                  //     padding: EdgeInsets.only(left: 5, right: 5),
                                                  //     child: DropdownButton<String>(
                                                  //         // menuMaxHeight: 300,
                                                  //         // isExpanded: true,
                                                  //         icon: Icon(Icons.arrow_drop_down, size: 30, color: Colors.blue,),
                                                  //         // alignment: AlignmentDirectional.center,
                                                  //         hint: const Text("Level of Education"),
                                                  //         value: selectedLevelOfEducation==""? null: selectedLevelOfEducation,
                                                  //         items: levelOfEducation
                                                  //             .map((String value) {
                                                  //           return DropdownMenuItem<String>(
                                                  //             // alignment: AlignmentDirectional.center,
                                                  //             value: value,
                                                  //             child: Text(value.toString()),
                                                  //           );
                                                  //         }).toList(),
                                                  //         onChanged: (newVal) {
                                                  //           // selected_item = newVal!;
                                                  //           setState(() {
                                                  //             selectedLevelOfEducation = newVal!;
                                                  //             levelOfEducationInputDecoratorLabelText = "Level of Education";
                                                  //           });
                                                  //         }),
                                                  //   ),
                                                  // ),

                                                ),
                                              ),

                                              // SizedBox(height:  30,),
                                              // InputDecorator(
                                              //   decoration: InputDecoration(
                                              //     // labelText: "Institute Name",
                                              //     labelText: instituteNameInputDecoratorLabelText,
                                              //     // errorText: "errorText",
                                              //     // floatingLabelBehavior: FloatingLabelBehavior.always,
                                              //     contentPadding: const EdgeInsets.symmetric(
                                              //       vertical: 0, horizontal: 5,
                                              //     ),
                                              //     border: OutlineInputBorder(
                                              //       borderRadius: BorderRadius.circular(12),
                                              //       borderSide: const BorderSide(
                                              //         color: Colors.blue,
                                              //       ),
                                              //     ),
                                              //   ),
                                              //   child: Container(
                                              //     // width: 220,
                                              //     height: 50,
                                              //     padding: EdgeInsets.only(left: 15),
                                              //     decoration: BoxDecoration(
                                              //       // color: Colors.black12,
                                              //       borderRadius: BorderRadius.circular(12),
                                              //       // border: Border.all(color: Colors.blue,),
                                              //     ),
                                              //
                                              //
                                              //     child: CustomDropDown(
                                              //       value: selectedInstituteName==""? null: selectedInstituteName,
                                              //       itemsList: const [],
                                              //       hintText: "Institute Name",
                                              //       onChanged: (value) {
                                              //         setState(() {
                                              //           selectedInstituteName = value;
                                              //           instituteNameInputDecoratorLabelText = "Institute Name";
                                              //
                                              //         });
                                              //       },
                                              //     ),
                                              //
                                              //
                                              //   ),
                                              // ),

                                              SizedBox(height: 20,),
                                              BuildTextFormField(
                                                labelText: "Institute Name",
                                                controller: controllerInstituteName,
                                                keyboardType: TextInputType.text,
                                                filter: <TextInputFormatter>[
                                                  FilteringTextInputFormatter.allow(
                                                      RegExp(r'[a-zA-Z/.-]')),
                                                ],
                                              ),


                                              SizedBox(height:  30,),
                                              InputDecorator(
                                                decoration: InputDecoration(
                                                  // labelText: "Institute Location",
                                                  labelText: instituteLocationInputDecoratorLabelText,
                                                  // errorText: "errorText",
                                                  // floatingLabelBehavior: FloatingLabelBehavior.always,
                                                  contentPadding: const EdgeInsets.symmetric(
                                                    vertical: 0, horizontal: 5,
                                                  ),
                                                  border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(12),
                                                    borderSide: const BorderSide(
                                                      color: Colors.blue,
                                                    ),
                                                  ),
                                                ),
                                                child: Container(
                                                  // width: 220,
                                                  height: 50,
                                                  padding: EdgeInsets.only(left: 15),
                                                  decoration: BoxDecoration(
                                                    // color: Colors.black12,
                                                    borderRadius: BorderRadius.circular(12),
                                                    // border: Border.all(color: Colors.blue,),
                                                  ),


                                                  child: CustomDropDownString(
                                                    value: selectedInstituteLocation==""? null: selectedInstituteLocation,
                                                    itemsList: instituteLocation,
                                                    hintText: "Institute Location",
                                                    onChanged: (value) {
                                                      setState(() {
                                                        selectedInstituteLocation = value;
                                                        instituteLocationInputDecoratorLabelText = "Institute Location";

                                                      });
                                                    },
                                                  ),


                                                ),
                                              ),

                                              SizedBox(height:  30,),
                                              InputDecorator(
                                                decoration: InputDecoration(
                                                  // labelText: "Institute Name",
                                                  labelText: passingYearInputDecoratorLabelText,
                                                  // errorText: "errorText",
                                                  // floatingLabelBehavior: FloatingLabelBehavior.always,
                                                  contentPadding: const EdgeInsets.symmetric(
                                                    vertical: 0, horizontal: 5,
                                                  ),
                                                  border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(12),
                                                    borderSide: const BorderSide(
                                                      color: Colors.blue,
                                                    ),
                                                  ),
                                                ),
                                                child: Container(
                                                  // width: 220,
                                                  height: 50,
                                                  padding: EdgeInsets.only(left: 15),
                                                  decoration: BoxDecoration(
                                                    // color: Colors.black12,
                                                    borderRadius: BorderRadius.circular(12),
                                                    // border: Border.all(color: Colors.blue,),
                                                  ),


                                                  child: CustomDropDownInt(
                                                    value: selectedPassingYear==0? null: selectedPassingYear,
                                                    itemsList: passingYear,
                                                    hintText: "Passing Year",
                                                    onChanged: (value) {
                                                      setState(() {
                                                        selectedPassingYear = value;
                                                        passingYearInputDecoratorLabelText = "Passing Year";

                                                      });
                                                    },
                                                  ),


                                                ),
                                              ),

                                              SizedBox(height:  30,),
                                              InputDecorator(
                                                decoration: InputDecoration(
                                                  // labelText: "Institute Name",
                                                  labelText: durationInputDecoratorLabelText,
                                                  // errorText: "errorText",
                                                  // floatingLabelBehavior: FloatingLabelBehavior.always,
                                                  contentPadding: const EdgeInsets.symmetric(
                                                    vertical: 0, horizontal: 5,
                                                  ),
                                                  border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(12),
                                                    borderSide: const BorderSide(
                                                      color: Colors.blue,
                                                    ),
                                                  ),
                                                ),
                                                child: Container(
                                                  // width: 220,
                                                  height: 50,
                                                  padding: EdgeInsets.only(left: 15),
                                                  decoration: BoxDecoration(
                                                    // color: Colors.black12,
                                                    borderRadius: BorderRadius.circular(12),
                                                    // border: Border.all(color: Colors.blue,),
                                                  ),


                                                  child: CustomDropDownInt(
                                                    value: selectedDuration==0? null: selectedDuration,
                                                    itemsList: duration,
                                                    hintText: "Duration",
                                                    onChanged: (value) {
                                                      setState(() {
                                                        selectedDuration = value;
                                                        durationInputDecoratorLabelText = "Duration";

                                                      });
                                                    },
                                                  ),


                                                ),
                                              ),




                                            ],
                                          ),

                                          SizedBox(
                                            height: 20,
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
                                                  // addNewEducationAlertDialog();
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

                                          SizedBox(
                                            height: 20,
                                          ),
                                          OutlinedButton(
                                            onPressed: () {
                                              _isComplete[currentTab] = true;
                                              if (currentTab + 1 < tabController.length)
                                                _isDisabled[currentTab + 1] = false;

                                              print(selectedLevelOfEducation);
                                              print(controllerInstituteName.text);
                                              print(selectedInstituteLocation);
                                              print(selectedPassingYear);
                                              print(selectedDuration);

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
                                ),
                              ),
                              
                            ],
                          ),
                        ),


                        //1
                        Container(
                          // color: Colors.grey,
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
                                height: 10,
                              ),

                              Expanded(
                                child: SingleChildScrollView(
                                  child: Form(
                                    key: formGlobalKey1,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [


                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text("data here"),

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
                                              tabController.animateTo(2);
                                            },
                                            child: const Text("It's cloudy here"),
                                          ),

                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),

                        //2
                        Container(
                          // color: Colors.grey,
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
                                height: 10,
                              ),

                              Expanded(
                                child: SingleChildScrollView(
                                  child: Form(
                                    key: formGlobalKey2,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [


                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text("data here"),

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
                                              tabController.animateTo(3);
                                            },
                                            child: const Text("It's cloudy here"),
                                          ),

                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),

                        //3
                        Container(
                          // color: Colors.grey,
                          child: Column(
                            children: [

                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                "Availability",
                                style: TextStyle(
                                  fontFamily: 'OpenSans',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),

                              Expanded(
                                child: SingleChildScrollView(
                                  child: Form(
                                    key: formGlobalKey3,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [


                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text("data here"),

                                          SizedBox(
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
                                              tabController.animateTo(0);
                                            },
                                            child: const Text("It's cloudy here"),
                                          ),

                                        ],
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
                  ),

                ]
                ,
              ),
            ),
          ),
        ),
      ],
    );
  }


  Future addNewEducationAlertDialog() async {
    return await showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          content: Container(
            width: 350,
            height: 550,
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
