import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:pretty_json/pretty_json.dart';
import 'package:flutter/material.dart';
import 'package:ui_build/screens/api_data_viewing_screens/api_flowed_data_viewing_screen1.dart';
import 'package:ui_build/tools/api_tools/api_data.dart';

class APIDataViewingScreen1 extends StatefulWidget {
  const APIDataViewingScreen1({Key? key}) : super(key: key);

  @override
  _APIDataViewingScreen1State createState() => _APIDataViewingScreen1State();
}

class _APIDataViewingScreen1State extends State<APIDataViewingScreen1> {
  /// user defined methods and attributes
  String resultData = "";
  // TextEditingController linkTextFieldController = TextEditingController(text: 'https://ipinfo.io/192.185.160.93/geo');
  //TextEditingController linkTextFieldController = TextEditingController(text:'https://datausa.io/api/data?drilldowns=Nation&measures=Population');
  TextEditingController linkTextFieldController = TextEditingController(text:'https://list.ly/api/v4/meta?url=http://google.com');
  TextEditingController dataTextFieldController = TextEditingController(text: '');

  void getDataButtonPressed() async {
    //print(textFieldController.text);
    String apiLocation = linkTextFieldController.text;
    //bool flag = await getAPIData(apiLocation);
    var apiData = await getAPIData(apiLocation);

    Map<String, dynamic> dataMap = apiData;

    var readableApiData = prettyJson(dataMap, indent: 2);
    print(readableApiData);
    // //print("got\n\n\n\n\n\n\n");
    // //var user = User.fromJson(userMap);
    String name = "", main_url = "", metadata_status = "", description = "", imageUrl = "";
    main_url = apiData['url'];
    name = apiData['metadata']['name'];
    metadata_status = apiData['metadata']['status'].toString();
    description = apiData['metadata']['description'];
    imageUrl = apiData['metadata']['images'][0];


    String userDataView = "Name: $name\nUrl: $main_url\nStatus: $metadata_status\nDescription: $description\nImage: $imageUrl";
    print(userDataView);

    setState(() {
      // dataTextFieldController.text = apiData.toString();
      dataTextFieldController.text = "";
      // dataTextFieldController.text = readableApiData;
      dataTextFieldController.text = userDataView;
    });
  }

  void flowDataButtonPressed() async {
    String apiLocation = linkTextFieldController.text;
    var apiData = await getAPIData(apiLocation);
    Map<String, dynamic> dataMap = apiData;

    String name = "", main_url = "", metadata_status = "", description = "", imageUrl = "";
    main_url = apiData['url'];
    name = apiData['metadata']['name'];
    metadata_status = apiData['metadata']['status'].toString();
    description = apiData['metadata']['description'];
    imageUrl = apiData['metadata']['images'][0].toString();
    //imageUrl = 'https://flutter-examples.com/wp-content/uploads/2021/01/happy_mothers_Day.gif';


    String userDataView = "Name: $name\nUrl: $main_url\nStatus: $metadata_status\nDescription: $description\nImage: $imageUrl";
    print(userDataView);
    print('flow-'+userDataView);
    Navigator.push(context,
      MaterialPageRoute(builder: (context)=> APIFlowedDataViewingScreen1(
        name: name, url: main_url, status: metadata_status, description: description, imageUrl: imageUrl),
      ),
    );

  }

  //Future<bool> getAPIData(String apiLocation) async {
  Future<dynamic> getAPIData(String apiLocation) async {
    //String apiLocation = 'https://ipinfo.io/192.185.160.93/geo';
    //String apiLocation = linkTextFieldController.text;
    APInterface apiObject = APInterface(apiLocation);
    var apiData = await apiObject.getData();

    return apiData;

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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "API Data",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Container(
                      alignment: Alignment.center,
                      //height: 100,
                      child: TextField(
                        controller: linkTextFieldController,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          height: .8,
                          fontSize: 15,
                        ),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'API Address',
                        ),
                        //cursorHeight: .8,
                        //showCursor: false,
                      ),
                    ),
                    SizedBox(height: 10,),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue, // background
                        onPrimary: Colors.black, // foreground
                      ),
                      onPressed: () {
                        getDataButtonPressed();
                      },
                      child: const Text('Get Data'),
                    ),
                    SizedBox(height: 1),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue, // background
                        onPrimary: Colors.black, // foreground
                      ),
                      onPressed: () {
                        flowDataButtonPressed();
                      },
                      child: const Text('Flow Data to New Page'),
                    ),
                    SizedBox(height: 30),
                    Container(

                      child: Expanded(
                        flex: 0,
                        child: TextField(
                          controller: dataTextFieldController,
                          maxLines: null, //wrap text
                          autofocus: true,
                          autocorrect: true,
                          enabled: false,  // editing permission
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            //height: 20,
                            fontSize: 18,
                          ),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: '',
                          ),
                          //showCursor: false,
                          //cursorHeight: 18,
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
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




