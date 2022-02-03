import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:landconsultancy/CitizenPage/CitizenLoginPage.dart';
import 'package:landconsultancy/ConsultantPage/ConsultantLoginPage.dart';

class LandingPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return WillPopScope(
        onWillPop: () async {
          bool willLeave = false;
          // show the confirm dialog
          await showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: Text('Are you sure want to leave?'),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        willLeave = true;
                        Navigator.of(context).pop();
                      },
                      child: Text('Yes')),
                  TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text('No'))
                ],
              ));
          return willLeave;
        },
        child: Scaffold(
            body: Center(
              child: Padding(
                padding: EdgeInsets.only(left: screenWidth* .10, right: screenWidth*.10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push( context, MaterialPageRoute( builder: (_) => const CitizenLoginPage(),),);
                      },
                      child: Stack(
                        overflow: Overflow.visible,
                        children: [
                          Card(
                            elevation: 10,
                            color: Colors.blue,
                            child: Container(
                              width: 300,
                              height: 120,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("    নাগরিক কর্নার", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),)
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: 20,
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
                    ),

                    SizedBox(height: 30,),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ConsultantLoginPage(),
                          ),
                        );
                      },
                      child: Stack(
                        overflow: Overflow.visible,
                        children: [
                          Card(
                            elevation: 10,
                            color: Colors.green,
                            child: Container(
                              width: 300,
                              height: 120,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("    পরামর্শক কর্নার", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),)
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: 20,
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
                    ),
                  ],
                ),
              ),
            )

        ));

  }
}
