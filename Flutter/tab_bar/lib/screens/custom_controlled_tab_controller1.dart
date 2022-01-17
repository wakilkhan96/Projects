import 'package:flutter/material.dart';

class CustomControlledTabController1 extends StatefulWidget {
  const CustomControlledTabController1({Key? key}) : super(key: key);

  @override
  _CustomControlledTabController1State createState() =>
      _CustomControlledTabController1State();
}

const List<Tab> tabs = <Tab>[
  Tab(text: 'Zeroth'),
  Tab(text: 'First'),
  Tab(text: 'Second'),
  Tab(text: 'Third'),
];

class _CustomControlledTabController1State
    extends State<CustomControlledTabController1> {

  List<bool> _isDisabled = [false, true, true];
  List<bool> _isComplete = [false, false, false];
  int currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      // The Builder widget is used to have a different BuildContext to access
      // closest DefaultTabController.
      child: Builder(
        builder: (BuildContext context) {
          final TabController tabController = DefaultTabController.of(context)!;
          tabController.addListener(() {

          });
          return Scaffold(
            appBar: AppBar(
              bottom: const TabBar(
                tabs: tabs,
              ),
            ),
            body: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              // children: tabs.map((Tab tab) {
              //   return Center(
              //     child: Text(
              //       '${tab.text!} Tab',
              //       style: Theme.of(context).textTheme.headline5,
              //     ),
              //   );
              // }).toList(),
              children: [
                Center(
                  child: ElevatedButton(
                      onPressed: () {
                        tabController.animateTo(1);
                      },
                      child: Text(tabs[0].text.toString()+" to "+tabs[1].text.toString()),
                  ),
                ),

                Center(
                  child: ElevatedButton(
                      onPressed: () {
                        tabController.animateTo(2);
                      },
                    child: Text(tabs[1].text.toString()+" to "+tabs[2].text.toString()),
                  ),
                ),

                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      tabController.animateTo(3);
                    },
                    child: Text(tabs[2].text.toString()+" to "+tabs[3].text.toString()),
                  ),
                ),

                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      print("Done");
                    },
                    child: Text(tabs[3].text.toString()+" to "+tabs[3].text.toString()),
                  ),
                ),

              ],
            ),
          );
        },

        // Container(
        //   color: Colors.blueGrey,
        //   child: Center(
        //     child: ElevatedButton(
        //       onPressed: () {
        //         tabController.animateTo(2);
        //       },
        //       child: Text("It's rainy here"),
        //     ),
        //   )
        // ),
        // Container(
        //   color: Colors.brown,
        //   child: Center(
        //     child: ElevatedButton(
        //       onPressed: () {
        //         // tabController.animateTo(0, duration: 0);
        //         tabController.animateTo(0);
        //       },
        //       child: Text("It's sunny here"),
        //     ),
        //   )
        // ),
      ),
    );
  }
}
