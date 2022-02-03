import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("For Test"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              overflow: Overflow.visible,
              children: [
                Card(
                  elevation: 10,
                  color: Colors.blue,
                  child: Container(
                    width: 300,
                    height: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("নাগরিক কর্নার", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),)
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 30,
                  left: -20,
                  child: Card(
                      elevation: 10,
                      color: Colors.white,
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
//                          color: Colors.red,
                          image: DecorationImage(
                              image: AssetImage('assets/images/citizen_icon.png'),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.all(Radius.circular(75.0)),
                        ),
                      )),
                )
              ],
            ),
            SizedBox(height: 20,),
            Stack(
              overflow: Overflow.visible,
              children: [
                Card(
                  elevation: 10,
                  color: Colors.green,
                  child: Container(
                    width: 300,
                    height: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("পরামর্শক কর্নার", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),)
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 30,
                  left: -20,
                  child: Card(
                      elevation: 10,
                      color: Colors.white,
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
//                          color: Colors.red,
                          image: DecorationImage(
                              image: AssetImage('assets/images/consultant_icon.png'),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.all(Radius.circular(75.0)),
                        ),
                      )),
                )
              ],
            ),
          ],
        ),
      )


    );
  }
}

// Overflow widget card
/*
child: Stack(
overflow: Overflow.visible,
children: [
Positioned(
top: 10,
right: -20,
child: Card(
elevation: 3,
color: Colors.red.withOpacity(0.5),
child: Container(width: 30, height: 50),
)),
Card(
elevation: 1,
color: Colors.purple,
child: Container(
width: 300,
height: 150,
),
),
Positioned(
top: 20,
left: -20,
child: Card(
elevation: 3,
color: Colors.orange,
child: Container(width: 80, height: 80),
)),

Positioned(
top: 20,
right: -20,
child: Card(
elevation: 3,
color: Colors.red,
child: Container(width: 120, height: 50),
))
],
),*/
