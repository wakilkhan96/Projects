import 'package:flutter/material.dart';

class APIFlowedDataViewingScreen1 extends StatefulWidget {
  String name, url, status, description, imageUrl;
  APIFlowedDataViewingScreen1({Key? key, required this.name, required this.url, required this.status, required this.description, required this.imageUrl}) : super(key: key);

  @override
  _APIFlowedDataViewingScreen1State createState() => _APIFlowedDataViewingScreen1State(name, url, status, description, imageUrl);
}

class _APIFlowedDataViewingScreen1State extends State<APIFlowedDataViewingScreen1> {
  String name = "", url = "", status = "", description ="", imageUrl = "", tempUrl='https://flutter-examples.com/wp-content/uploads/2021/01/happy_mothers_Day.gif';
  TextEditingController urlTextFieldController = TextEditingController(text: '');
  TextEditingController descriptionTextFieldController = TextEditingController(text: '');

  _APIFlowedDataViewingScreen1State(String name, String url, String status, String description, String imageUrl) {
    this.name = name;
    this.url = url;
    this.status = status;
    this.description = description;
    this.imageUrl = imageUrl;

    String preDescripton = "At '$url', ";
    urlTextFieldController.text = url;
    descriptionTextFieldController.text = preDescripton+description;
    //setState(() {

  }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   print('constructor');
  //
  //   //getAPIData();
  //
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue[100],
            foregroundColor: Colors.black,
            title: Text('Data'),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Received API Data",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // CircleAvatar(
                        //   radius: 40.0,
                        //   child: ClipRRect(
                        //     child: Image.network(imageUrl),
                        //     borderRadius: BorderRadius.circular(100.0),
                        //
                        //   ),
                        //
                        // ),
                        CircleAvatar(
                          radius: 50.0,
                          backgroundColor: Colors.white,
                          child: Center(
                              child: Image.network(
                                imageUrl,
                                // width: 500,
                                // height: 500,

                                fit: BoxFit.cover,
                              )),

                        ),
                        // CircleAvatar(
                        //   radius: 40,
                        //   // backgroundImage: AssetImage("assets/images/ground.jpg"),
                        //   // backgroundImage: NetworkImage(
                        //   //     'https://flutter-examples.com/wp-content/uploads/2021/01/happy_mothers_Day.gif'
                        //   // ),
                        //   backgroundImage: NetworkImage(imageUrl),
                        // ),
                        // CircularProfileAvatar is a Flutter package which allows developers
                        // to implement circular profile avatar with border, overlay, initialsText
                        // and many other awesome features, which simplifies developers job.
                        // It is an alternative to Flutter's CircleAvatar Widget.
                        const SizedBox(width: 30),
                        // Text(
                        //   // "Name",
                        //   name,
                        //   textAlign: TextAlign.center,
                        //   style: Theme.of(context)
                        //       .textTheme
                        //       .headline5!
                        //       .copyWith(fontWeight: FontWeight.bold),
                        // ),
                        Text(
                          // "Name",
                          name,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontFamily: 'RobotoMono',
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Web Address:",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Container(
                      alignment: Alignment.center,
                      //height: 100,
                      child: TextField(
                        controller: urlTextFieldController,
                        //enabled: false,  // editing permission
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          height: .8,
                          fontSize: 20,
                        ),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Url Address',
                        ),
                        //cursorHeight: .8,
                        //showCursor: false,
                      ),
                    ),
                    const SizedBox(height: 30,), //in between spacer
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Response Status:",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "HTTP "+status,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontFamily: 'RobotoMono',
                              fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30,), //in between spacer
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Description:",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Container(

                      child: Expanded(
                        flex: 0,
                        child: TextField(
                          controller: descriptionTextFieldController,
                          maxLines: null, //wrap text
                          autofocus: true,
                          autocorrect: true,
                          enabled: false,  // editing permission
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            height: 1.8, // line spacing height
                            fontSize: 18,
                            wordSpacing: 2.00,
                          ),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: '',
                            contentPadding: EdgeInsets.zero,
                          ),
                          //showCursor: false,
                          //cursorHeight: 18,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
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
