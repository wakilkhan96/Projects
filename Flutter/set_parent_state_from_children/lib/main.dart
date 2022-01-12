import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'set state of stateful Parent from stateful Child',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}





class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class Controller {
  List<String> _list = [];
  Controller();
}
class _MyHomePageState extends State<MyHomePage> {

  Controller controller = Controller();

  void refresh() {
    setState(() {
      print(controller._list);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Total list items:',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Text(
                (controller._list.isEmpty)? 'null': controller._list.length.toString(),
                style: const TextStyle(
                  fontSize: 35,
                ),
              ),
              SizedBox(height: 40,),
              MyButton(
                updateParent: refresh,
                controller: controller,
              ),

            ],
          ),
        ),
      // floatingActionButton: MyButton2(
      //   updateParent: refresh,
      //   controller: controller,
      // ),
    );
  }
}


class MyButton extends StatefulWidget {
  final Function() updateParent;
  final Controller controller;
  const MyButton({Key? key, required this.updateParent, required this.controller}) : super(key: key);

  @override
  _MyButtonState createState() => _MyButtonState(updateParent: updateParent,
      controller:  controller);
}

class _MyButtonState extends State<MyButton> {
  final Function() updateParent;
  final Controller controller;
  _MyButtonState({required this.updateParent, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          // print(controller._list);
          controller._list.add('item '+(controller._list.length+1).toString());
          widget.updateParent();
        },
        child: Text('Add items to List', style: TextStyle(fontSize: 18),),
    );
  }
}

