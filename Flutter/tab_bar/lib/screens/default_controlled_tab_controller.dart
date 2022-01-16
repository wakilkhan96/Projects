import 'package:flutter/material.dart';

class DefaultControlledTabController extends StatefulWidget {
  const DefaultControlledTabController({Key? key}) : super(key: key);

  @override
  DefaultControlledTabControllerPageState createState() => DefaultControlledTabControllerPageState();
}

class DefaultControlledTabControllerPageState extends State<DefaultControlledTabController> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'My Profile',
          ),
          centerTitle: true,
          backgroundColor: Colors.grey[700]!.withOpacity(0.4),
          elevation: 0,
          // give the app bar rounded corners
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            ),
          ),
          leading: const Icon(
            Icons.menu,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            children: <Widget>[
              // construct the profile details widget here
              Container(
                color: Colors.black12,
                height: 100,
                child: Center(
                  child: Text(
                    'Profile Details Goes here',
                  ),
                ),
              ),

              // the tab bar with two items
              Container(
                height: 55,
                child: AppBar(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                    ),
                  ),
                  // backgroundColor: Colors.grey[700]!.withOpacity(0.4),
                  bottom: const TabBar(
                    tabs: [
                      Tab(
                        icon: Icon(Icons.directions_bike),
                      ),
                      Tab(
                        icon: Icon(
                          Icons.directions_car,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // create widgets for each tab bar here
              Expanded(
                child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    // first tab bar view widget
                    Container(
                      color: Colors.greenAccent,
                      child: const Center(
                        child: Text(
                          'Bike',
                        ),
                      ),
                    ),

                    // second tab bar view widget
                    Container(
                      color: Colors.tealAccent,
                      child: const Center(
                        child: Text(
                          'Car',
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
    );
  }
}