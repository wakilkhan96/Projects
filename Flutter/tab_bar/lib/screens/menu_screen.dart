import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:tab_bar/screens/default_controlled_tab_controller.dart';
import 'package:tab_bar/screens/custom_controlled_tab_controller1.dart';
import 'package:tab_bar/screens/custom_controlled_tab_controller2.dart';
import 'package:tab_bar/screens/custom_controlled_tab_controller3.dart';
import 'package:tab_bar/screens/woolha.com_tab_layout_example.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20,),
              OutlinedButton(
                style: ButtonStyle(),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context)=>const DefaultControlledTabController()),
                  );
                },
                child: const Center(
                  child: Text(
                    "Default Controlled Tab Controller",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              SizedBox(height: 20,),

              OutlinedButton(
                style: ButtonStyle(),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context)=>const CustomControlledTabController1()),
                  );
                },
                child: const Center(
                  child: Text(
                    "Custom Controlled Tab Controller 1",
                    style: TextStyle(fontSize: 20),

                  ),
                ),
              ),
              SizedBox(height: 20,),

              OutlinedButton(
                style: ButtonStyle(),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context)=>const CustomControlledTabController2()),
                  );
                },
                child: const Center(
                  child: Text(
                    "Custom Controlled Tab Controller 2",
                    style: TextStyle(fontSize: 20),
              
                  ),
                ),
              ),
              SizedBox(height: 20,),
              
              OutlinedButton(
                style: ButtonStyle(),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context)=>const CustomControlledTabController3()),
                  );
                },
                child: const Center(
                  child: Text(
                    "Custom Controlled Tab Controller 3",
                    style: TextStyle(fontSize: 20),
              
                  ),
                ),
              ),
              SizedBox(height: 20,),
              
              OutlinedButton(
                style: ButtonStyle(),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context)=>const TabLayoutExample()),
                  );
                },
                child: const Center(
                  child: Text(
                    "woolha.com Tab layout example",
                    style: TextStyle(fontSize: 20),
              
                  ),
                ),
              ),
              SizedBox(height: 20,),

            ],

          ),
        ),
      ),
    );
  }
}
