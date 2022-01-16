import 'package:flutter/material.dart';

class CustomControlledTabController1 extends StatefulWidget {
  const CustomControlledTabController1({Key? key}) : super(key: key);

  @override
  _CustomControlledTabController1State createState() => _CustomControlledTabController1State();
}


const List<Tab> tabs = <Tab>[
  Tab(text: 'Zeroth'),
  Tab(text: 'First'),
  Tab(text: 'Second'),
];

class _CustomControlledTabController1State extends State<CustomControlledTabController1> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      // The Builder widget is used to have a different BuildContext to access
      // closest DefaultTabController.
      child: Builder(builder: (BuildContext context) {
        final TabController tabController = DefaultTabController.of(context)!;
        tabController.addListener(() {
          if (!tabController.indexIsChanging) {
            // Your code goes here.
            // To get index of current tab use tabController.index
            print(tabController.index);
          }
        });
        return Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: tabs,
            ),
          ),
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: tabs.map((Tab tab) {
              return Center(
                child: Text(
                  '${tab.text!} Tab',
                  style: Theme
                      .of(context)
                      .textTheme
                      .headline5,
                ),
              );
            }).toList(),
          ),
        );
      }),
    );
  }

}
