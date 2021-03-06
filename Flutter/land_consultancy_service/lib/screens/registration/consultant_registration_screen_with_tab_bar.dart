import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'dart:async';
import 'package:land_consultancy_service/src/custom_date_time_utility.dart';

// import 'package:land_consultancy_service/src/other_contributors/custom_drop_down_int.dart';
// import 'package:land_consultancy_service/src/other_contributors/custom_drop_down_string.dart';

class TabState {
  bool isComplete;
  bool isDisabled;
  TabState({required this.isComplete, required this.isDisabled});
}


class ConsultantRegistrationScreen extends StatefulWidget {
  static String pageID = 'consultant_registration_screen';
  const ConsultantRegistrationScreen({Key? key}) : super(key: key);

  @override
  _ConsultantRegistrationScreenState createState() =>
      _ConsultantRegistrationScreenState();
}

class _ConsultantRegistrationScreenState extends State<ConsultantRegistrationScreen> with TickerProviderStateMixin {

  late TabController tabController;
  List <TabState> tabIndex = [
    TabState(isComplete: false, isDisabled: false),
    TabState(isComplete: false, isDisabled: true),
    TabState(isComplete: false, isDisabled: true),
    TabState(isComplete: false, isDisabled: true),
  ];
  int currentTab = 0;

  // final GlobalKey<_ConsultantRegistrationScreenState> parent = GlobalKey();
  final formGlobalKey = GlobalKey<FormState>();
  final formGlobalKey0 = GlobalKey<FormState>();
  final formGlobalKey1 = GlobalKey<FormState>();
  final formGlobalKey2 = GlobalKey<FormState>();
  final formGlobalKey3 = GlobalKey<FormState>();

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


  CustomMultiSelectionButtonController customMultiSelectionButtonController = CustomMultiSelectionButtonController();


  List<Widget> specialities = [];


  /* Form 0 data controllers -> start */
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

  String courseDurationInputDecoratorLabelText = "";
  List<int> courseDuration = [3, 4, 5];
  int selectedCourseDuration = 0;
  /* Form 0 data controllers <- end */







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

  /* multi selected Items card builder*/
  Widget multiSelectionSelectedItemCard(dynamic selectedItem, int selectedItemID, CustomMultiSelectionButtonController controller) {
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
              child: const Icon(Icons.clear, size: 20,),
              onTap: () {
                print("tapped_on_clear_icon");
                // print(controller.selectedItems);
                final index = controller.selectedItemsIndexID.indexWhere((element) =>
                element == selectedItemID);
                if (index >= 0) {
                  controller.selectedItems.removeAt(index);
                  controller.selectedItemsIndexID.removeAt(index);

                  specialities.removeAt(index);

                  setState(() {
                    // specialities.clear();
                    // for(int i=0; i<customMultiSelectionButtonController.selectedItems.length; i++) {
                    //   specialities.add(
                    //     CardItem(
                    //         customMultiSelectionButtonController.selectedItems[i],
                    //         customMultiSelectionButtonController.selectedItemsIndices[i],
                    //         customMultiSelectionButtonController
                    //     ),
                    //   );
                    //
                    // }
                  });
                }

              },
              // splashColor: Color.fromRGBO(229, 240, 250, 1),
              borderRadius: BorderRadius.circular(12),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              selectedItem.toString(),
              style: const TextStyle(
                fontSize: 17,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }

  Widget form(GlobalKey<FormState> formGlobalKey) {
    return Form(
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


            /* Specialities field*/
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
                        side: BorderSide(color: Colors.blue, width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: InkWell(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            child: Row(
                              children: const [
                                Text(
                                  // (specialities.isEmpty? "Select Specialities": "Selected Specialities"),
                                  "Select/Selected Specialities",
                                  style: TextStyle(fontSize: 18),
                                ),
                                Expanded(child: SizedBox(height: 1,),),
                                Icon(Icons.arrow_drop_down, size: 30, color: Colors.blue,),
                              ],
                            ),
                          ),
                          onTap: () {

                            customMultiSelectionButtonController.temporarySelectedItems = List.from(customMultiSelectionButtonController.selectedItems);
                            customMultiSelectionButtonController.temporaryselectedItemsIndexID = List.from(customMultiSelectionButtonController.selectedItemsIndexID);

                            showDialog(
                              context: context,
                              builder: (ctx) {
                                return AlertDialog(
                                  title: Text('Select Items'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          specialities.clear();

                                          customMultiSelectionButtonController.selectedItems = List.from(customMultiSelectionButtonController.temporarySelectedItems);
                                          customMultiSelectionButtonController.selectedItemsIndexID = List.from(customMultiSelectionButtonController.temporaryselectedItemsIndexID);

                                          for(int i=0; i<customMultiSelectionButtonController.selectedItems.length; i++) {
                                            specialities.add(
                                              multiSelectionSelectedItemCard(
                                                customMultiSelectionButtonController.selectedItems[i],
                                                customMultiSelectionButtonController.selectedItemsIndexID[i],
                                                customMultiSelectionButtonController,
                                              ),
                                            );
                                          }

                                        });

                                        Navigator.pop(context);

                                      },
                                      child: Text('Ok'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        // multiSelectionButtonController.selectedItems.clear();
                                        Navigator.pop(context);
                                      },
                                      child: Text('Cancel'),
                                    ),

                                  ],
                                  content: Container(
                                    width: 250,
                                    height: 300,
                                    child: CustomMultiSelectionButton(
                                      multiSelectionItems: ["Item 1", "Item 2", "Item 3"],
                                      multiSelectionButtonController: customMultiSelectionButtonController,
                                    ),
                                  ),
                                );
                              },
                            );
                          }

                      )
                  ),
                  Wrap(
                    direction: Axis.horizontal,
                    children: specialities,
                    // children: [
                    //   CardItem("froggie_morgan_gottar", 1, customMultiSelectionButtonController),
                    //   CardItem("morgan_gottar", 0, customMultiSelectionButtonController),
                    //   CardItem("oggie_bar", 3, customMultiSelectionButtonController),
                    //   CardItem("gottar_morgan", 2, customMultiSelectionButtonController),
                    //
                    // ],
                  ),
                ],
              ),
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
                print(customMultiSelectionButtonController.selectedItems);
                // print(customMultiSelectionButtonController.selectedItemsIndexID)5
                // 4;
              },
              child: const Text("Get"),
            ),
          ],
        ),
      ),
    );
  }

  Widget form0(GlobalKey<FormState> formGlobalKey) {
    return Form(
      key: formGlobalKey,
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

                // Level of Education
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

                    // //office version
                    // child: CustomDropDownString(
                    //   value: selectedLevelOfEducation==""? null: selectedLevelOfEducation,
                    //   itemsList: levelOfEducation,
                    //   hintText: "Level of Education",
                    //   onChanged: (value) {
                    //     setState(() {
                    //       selectedLevelOfEducation = value;
                    //       levelOfEducationInputDecoratorLabelText = "Level of Education";
                    //
                    //     });
                    //   },
                    // ),

                    // self version
                    child: DropdownButtonHideUnderline(
                      child: Padding(

                        padding: EdgeInsets.only(left: 5, right: 5),
                        child: DropdownButton<String>(
                            // menuMaxHeight: 300,
                            // isExpanded: true,
                            icon: Icon(Icons.arrow_drop_down, size: 30, color: Colors.blue,),
                            // alignment: AlignmentDirectional.center,
                            hint: const Text("Level of Education"),
                            value: selectedLevelOfEducation==""? null: selectedLevelOfEducation,
                            items: levelOfEducation
                                .map((String value) {
                              return DropdownMenuItem<String>(
                                // alignment: AlignmentDirectional.center,
                                value: value,
                                child: Text(value.toString()),
                              );
                            }).toList(),
                            onChanged: (newVal) {
                              // selected_item = newVal!;
                              setState(() {
                                selectedLevelOfEducation = newVal!;
                                levelOfEducationInputDecoratorLabelText = "Level of Education";
                              });
                            }),
                      ),
                    ),

                  ),
                ),

                // Institute name
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

                //Institute Location
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

                    child: DropdownButtonHideUnderline(
                      child: Padding(

                        padding: EdgeInsets.only(left: 5, right: 5),
                        child: DropdownButton<String>(
                          // menuMaxHeight: 300,
                          // isExpanded: true,
                            icon: Icon(Icons.arrow_drop_down, size: 30, color: Colors.blue,),
                            // alignment: AlignmentDirectional.center,
                            hint: const Text("Institute Location"),
                            value: selectedInstituteLocation==""? null: selectedInstituteLocation,
                            items: instituteLocation
                                .map((String value) {
                              return DropdownMenuItem<String>(
                                // alignment: AlignmentDirectional.center,
                                value: value,
                                child: Text(value.toString()),
                              );
                            }).toList(),
                            onChanged: (newVal) {
                              // selected_item = newVal!;
                              setState(() {
                                selectedInstituteLocation = newVal!;
                                instituteLocationInputDecoratorLabelText = "Institute Location";
                              });
                            }),
                      ),
                    ),

                  ),
                ),

                //Passing Year
                SizedBox(height:  30,),
                InputDecorator(
                  decoration: InputDecoration(
                    // labelText: "Passing Year",
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

                    child: DropdownButtonHideUnderline(
                      child: Padding(

                        padding: EdgeInsets.only(left: 5, right: 5),
                        child: DropdownButton<int>(
                          // menuMaxHeight: 300,
                          // isExpanded: true,
                            icon: Icon(Icons.arrow_drop_down, size: 30, color: Colors.blue,),
                            // alignment: AlignmentDirectional.center,
                            hint: const Text("Passing Year"),
                            value: selectedPassingYear==0? null: selectedPassingYear,
                            items: passingYear
                                .map((int value) {
                              return DropdownMenuItem<int>(
                                // alignment: AlignmentDirectional.center,
                                value: value,
                                child: Text(value.toString()),
                              );
                            }).toList(),
                            onChanged: (newVal) {
                              // selected_item = newVal!;
                              setState(() {
                                selectedPassingYear = newVal!;
                                passingYearInputDecoratorLabelText = "Passing Year";
                              });
                            }),
                      ),
                    ),

                  ),
                ),

                // Course Duration
                SizedBox(height:  30,),
                InputDecorator(
                  decoration: InputDecoration(
                    // labelText: "Course Duration",
                    labelText: courseDurationInputDecoratorLabelText,
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

                    child: DropdownButtonHideUnderline(
                      child: Padding(

                        padding: EdgeInsets.only(left: 5, right: 5),
                        child: DropdownButton<int>(
                          // menuMaxHeight: 300,
                          // isExpanded: true,
                            icon: Icon(Icons.arrow_drop_down, size: 30, color: Colors.blue,),
                            // alignment: AlignmentDirectional.center,
                            hint: const Text("Course Duration"),
                            value: selectedCourseDuration==0? null: selectedCourseDuration,
                            items: courseDuration
                                .map((int value) {
                              return DropdownMenuItem<int>(
                                // alignment: AlignmentDirectional.center,
                                value: value,
                                child: Text(value.toString()),
                              );
                            }).toList(),
                            onChanged: (newVal) {
                              // selected_item = newVal!;
                              setState(() {
                                selectedCourseDuration = newVal!;
                                courseDurationInputDecoratorLabelText = "Course Duration";
                              });
                            }),
                      ),
                    ),

                  ),
                ),

              ],
            ),

            SizedBox(
              height: 20,
            ),

            // Add New Button
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
                    /// print data
                    print(selectedLevelOfEducation);
                    print(controllerInstituteName.text);
                    print(selectedInstituteLocation);
                    print(selectedPassingYear);
                    print(selectedCourseDuration);
                    /// print data
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

          ],
        ),
      ),
    );
  }

  //**form 0 optional part
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
  //**form 0 optional part



  _ConsultantRegistrationScreenState() {
    super.initState();
    tabController = TabController(initialIndex: 0, length: 4, vsync: this);
    tabController.addListener(() {
      if(tabController.index < currentTab) {
        currentTab = tabController.index;
        tabController.animateTo(currentTab);
      }
      else if(tabIndex[currentTab].isComplete && !tabIndex[tabController.index].isDisabled) {
        currentTab = tabController.index;
        tabController.animateTo(currentTab);
      }
      else {
        tabController.animateTo(currentTab);
      }
    });
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
                children: [
                  // the tab bar with four items
                  // create widgets for each tab bar here
                  Container(
                    height: 50,
                    child: AppBar(
                      backgroundColor: Colors.white10,
                      // shape: const RoundedRectangleBorder(
                      //   // borderRadius: BorderRadius.only(
                      //   //   topLeft: Radius.circular(10.0),
                      //   //   topRight: Radius.circular(10.0),
                      //   // ),
                      // ),
                      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(10)),
                      // backgroundColor: Colors.grey[700]!.withOpacity(0.4),
                      bottom: TabBar(
                        controller: tabController,

                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.grey,
                        labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                        unselectedLabelStyle: const TextStyle(fontStyle: FontStyle.italic),
                        overlayColor: MaterialStateColor.resolveWith((Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Colors.blue;
                          } if (states.contains(MaterialState.focused)) {
                            return Colors.orange;
                          } else if (states.contains(MaterialState.hovered)) {
                            return Colors.pinkAccent;
                          }

                          return Colors.transparent;
                        }),
                        indicatorWeight: 0,
                        indicatorColor: Colors.blueAccent,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicatorPadding: const EdgeInsets.all(5),
                        indicator: BoxDecoration(
                          border: Border.all(color: Colors.white10),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey,
                        ),
                        // isScrollable: true,
                        physics: BouncingScrollPhysics(),
                        onTap: (int index) {
                          print('Tab $index is tapped');
                        },
                        enableFeedback: true,

                        tabs: const <Widget>[
                          Tab(
                            icon: Icon(Icons.cloud_outlined),
                          ),
                          Tab(
                            icon: Icon(Icons.grain_sharp),
                          ),
                          Tab(
                            icon: Icon(Icons.beach_access_sharp),
                          ),
                          Tab(
                            icon: Icon(Icons.brightness_5_sharp),
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

                        // Tab 0 Container
                        Container(
                          // color: Colors.grey,
                          child: Column(
                            children: [

                              const SizedBox(
                                height: 15,
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
                                  child: Column(
                                    children: [

                                      form0(formGlobalKey0),
                                      
                                      SizedBox(height: 20,),
                                      OutlinedButton(
                                        onPressed: () {
                                          tabIndex[0].isComplete = true;

                                        },
                                        child: Text("Make Tab 0 complete"),
                                      ),
                                      SizedBox(height: 40,),
                                      ElevatedButton(
                                        onPressed: () {
                                          if(tabIndex[0].isComplete) {
                                            tabIndex[1].isDisabled = false;
                                            tabController.animateTo(1);
                                          }
                                        },
                                        child: const Text("Tab 0 to Tab 1"),
                                      ),

                                    ],
                                  ),
                                ),

                              ),


                            ],
                          ),
                        ),


                        // Tab 1 Container
                        Container(
                          // color: Colors.grey,
                          child: Column(
                            children: [

                              const SizedBox(
                                height: 15,
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
                                  child: Column(
                                    children: [

                                      form0(formGlobalKey1),

                                      SizedBox(height: 20,),
                                      OutlinedButton(
                                        onPressed: () {
                                          tabIndex[1].isComplete = true;
                                        },
                                        child: Text("Make Tab 1 complete"),
                                      ),
                                      SizedBox(height: 40,),
                                      ElevatedButton(
                                        onPressed: () {
                                          if(tabIndex[1].isComplete) {
                                            tabIndex[2].isDisabled = false;
                                            tabController.animateTo(2);
                                          }
                                        },
                                        child: const Text("Tab 1 to Tab 2"),
                                      ),

                                    ],
                                  ),
                                ),

                              ),


                            ],
                          ),
                        ),


                        // Tab 2 Container
                        Container(
                          // color: Colors.grey,
                          child: Column(
                            children: [

                              const SizedBox(
                                height: 15,
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
                                  child: Column(
                                    children: [

                                      form0(formGlobalKey2),

                                      SizedBox(height: 20,),
                                      OutlinedButton(
                                        onPressed: () {
                                          tabIndex[2].isComplete = true;
                                        },
                                        child: Text("Make Tab 2 complete"),
                                      ),
                                      SizedBox(height: 40,),
                                      ElevatedButton(
                                        onPressed: () {
                                          if(tabIndex[2].isComplete) {
                                            tabIndex[3].isDisabled = false;
                                            tabController.animateTo(3);
                                          }
                                        },
                                        child: const Text("Tab 2 to Tab 3"),
                                      ),

                                    ],
                                  ),
                                ),

                              ),


                            ],
                          ),
                        ),


                        // Tab 3 Container
                        Container(
                          // color: Colors.grey,
                          child: Column(
                            children: [

                              const SizedBox(
                                height: 15,
                              ),
                              const Text(
                                "Availability and Consultation Fee",
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
                                  child: Column(
                                    children: [

                                      form0(formGlobalKey3),

                                      SizedBox(height: 20,),
                                      OutlinedButton(
                                        onPressed: () {
                                          tabIndex[3].isComplete = true;
                                        },
                                        child: Text("Make Tab 3 complete"),
                                      ),
                                      SizedBox(height: 40,),
                                      ElevatedButton(
                                        onPressed: () {
                                          if(tabIndex[3].isComplete) {
                                            print("Complete");
                                          } else {
                                            print("Not Complete");
                                          }
                                        },
                                        child: const Text("Tab 3 to Tab 3"),
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

                ],
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



class CustomMultiSelectionButtonController {
  List<dynamic> selectedItems = [];
  List<int> selectedItemsIndexID = [];

  List<dynamic> temporarySelectedItems = [];
  List<int> temporaryselectedItemsIndexID = [];
// CustomMultiSelectionButtonController(this.selectedItems);
}

class MultiSelectionItemState {
  dynamic selectionItem;
  int selectionItemIndexID;
  bool isSelected;
  MultiSelectionItemState(
      {required this.selectionItem, required this.selectionItemIndexID, required this.isSelected});
}

class CustomMultiSelectionButton extends StatefulWidget {
  List<dynamic> multiSelectionItems;
  CustomMultiSelectionButtonController multiSelectionButtonController;

  CustomMultiSelectionButton({
    Key? key,
    required this.multiSelectionItems,
    required this.multiSelectionButtonController,
  }) : super(key: key);

  @override
  _CustomMultiSelectionButtonState createState() =>
      _CustomMultiSelectionButtonState(
        multiSelectionItems: multiSelectionItems,
        multiSelectionButtonController: multiSelectionButtonController,
      );
}

class _CustomMultiSelectionButtonState
    extends State<CustomMultiSelectionButton> {
  List<MultiSelectionItemState> multiSelectionItemsStates = [];
  List<dynamic> multiSelectionItems;
  CustomMultiSelectionButtonController multiSelectionButtonController;

  _CustomMultiSelectionButtonState({
    required this.multiSelectionItems,
    required this.multiSelectionButtonController,
  }) {
    for (int indexID=0; indexID < multiSelectionItems.length; indexID++) {
      multiSelectionItemsStates.add(
        MultiSelectionItemState(
          selectionItem: multiSelectionItems[indexID],
          selectionItemIndexID: indexID,
          isSelected: (multiSelectionButtonController.selectedItemsIndexID.contains(indexID)? true : false),
        ),
      );
    }
  }

  Widget multiSelectionItemBuilder(int multiSelectionItemIndexID) {

    // multiSelectionButtonController.temporarySelectedItems = List.from(multiSelectionButtonController.selectedItems);
    // multiSelectionButtonController.temporaryselectedItemsIndexID = List.from(multiSelectionButtonController.selectedItemsIndexID);

    return Column(
      children: <Widget>[
        Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Checkbox(
                value: multiSelectionItemsStates[multiSelectionItemIndexID].isSelected,
                onChanged: (value) {
                  setState(() {
                    multiSelectionItemsStates[multiSelectionItemIndexID].isSelected = !multiSelectionItemsStates[multiSelectionItemIndexID].isSelected;

                    if(multiSelectionItemsStates[multiSelectionItemIndexID].isSelected) {
                      multiSelectionButtonController.temporarySelectedItems
                          .add(multiSelectionItemsStates[multiSelectionItemIndexID].selectionItem);
                      multiSelectionButtonController.temporaryselectedItemsIndexID
                          .add(multiSelectionItemIndexID);
                    }
                    else {
                      final index = multiSelectionButtonController.temporaryselectedItemsIndexID.indexWhere((element) =>
                      element == multiSelectionItemIndexID);
                      if (index >= 0) {
                        multiSelectionButtonController.temporarySelectedItems.removeAt(index);
                        multiSelectionButtonController.temporaryselectedItemsIndexID.removeAt(index);
                      }
                    }

                  });

                }
            ),
            const Padding(padding: EdgeInsets.only(left: 0.0)),
            Text(
              multiSelectionItemsStates[multiSelectionItemIndexID]
                  .selectionItem
                  .toString(),
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
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) => multiSelectionItemBuilder(index),
        itemCount: multiSelectionItemsStates.length,
      ),
    );
  }
}


















/*
Temporary

//show select dialogue option
Container(
  width: 100,
  height: 50,
  color: Colors.yellow,
  child: InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: Text('Select Items'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {

                  },
                  child: Text('OK'),
                ),
                TextButton(
                  onPressed: () {
                    multiSelectionButtonController.selectedItems.clear();
                  },
                  child: Text('Cancel'),
                ),

              ],
              content: Container(
                width: 250,
                height: 300,
                child: CustomMultiSelectionButton(
                  multiSelectionItems: ["Item 1", "Item 2", "Item 3"],
                  multiSelectionButtonController: multiSelectionButtonController,
                ),
              ),
            );
          },
        );
      }
  ),
),
*/

