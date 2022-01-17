import 'package:flutter/material.dart';

class TabState {
  bool isComplete;
  TabState({required this.isComplete});
}

class CustomControlledTabController2 extends StatefulWidget {
  const CustomControlledTabController2({Key? key}) : super(key: key);

  @override
  _CustomControlledTabController2State createState() =>
      _CustomControlledTabController2State();
}

class _CustomControlledTabController2State
    extends State<CustomControlledTabController2> with TickerProviderStateMixin {

  late TabController tabController;

  int currentTab = 0;
  // bool tab1IsComplete = false, tab2IsComplete = false, tab3IsComplete = false;
  List <TabState> tabIndex = [
    TabState(isComplete: false),
    TabState(isComplete: false),
    TabState(isComplete: false)];

  @override
  void initState() {
    super.initState();
    tabController = TabController(initialIndex: 0, length: 3, vsync: this);
    tabController.addListener(() {
      // print(counter++);
      // print(tabController.index);
      if(tabIndex[currentTab].isComplete) {
        if(tabController.index==currentTab+1) {
          currentTab = currentTab+1;
          tabController.animateTo(currentTab);
        }
        else {
          tabController.animateTo(currentTab);
        }
      }
      else {
        tabController.animateTo(currentTab);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TabBar Widget'),
        bottom: TabBar(
          controller: tabController,
          tabs: const <Widget>[
            Tab(
              icon: Icon(Icons.cloud_outlined),
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: [
            // SizedBox(height: 20,),
            Expanded(
              child: TabBarView(
                controller: tabController,
                physics: NeverScrollableScrollPhysics(),
                children: <Widget>[
                  Container(
                    // color: Colors.grey,
                    child: Column(
                      children: [
                        SizedBox(height: 20,),
                        OutlinedButton(
                          onPressed: () {
                            tabIndex[0].isComplete = true;
                          },
                          child: Text("Make Tab 1 complete"),
                        ),
                        SizedBox(height: 40,),
                        ElevatedButton(
                          onPressed: () {
                            tabController.animateTo(1);
                          },
                          child: Text("It's cloudy here"),
                        ),

                      ],
                    ),
                  ),
                  Container(
                    // color: Colors.blueGrey,
                    child: Column(
                      children: [
                        SizedBox(height: 20,),
                        OutlinedButton(
                          onPressed: () {
                            tabIndex[1].isComplete = true;
                          },
                          child: Text("Make Tab 2 complete"),
                        ),
                        SizedBox(height: 40,),
                        ElevatedButton(
                          onPressed: () {
                            tabController.animateTo(2);
                          },
                          child: Text("It's cloudy here"),
                        ),

                      ],
                    ),
                  ),
                  Container(
                    // color: Colors.brown,
                    child: Column(
                      children: [
                        SizedBox(height: 20,),
                        OutlinedButton(
                          onPressed: () {
                            tabIndex[2].isComplete = true;
                          },
                          child: Text("Make Tab 3 complete"),
                        ),
                        SizedBox(height: 40,),
                        ElevatedButton(
                          onPressed: () {
                            tabController.animateTo(0);
                          },
                          child: Text("It's cloudy here"),
                        ),

                      ],
                    ),
                  ),

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

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//
// class MyStatefulWidget extends StatefulWidget {
//   const MyStatefulWidget({Key? key}) : super(key: key);
//
//   @override
//   State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
// }
//
// /// AnimationControllers can be created with `vsync: this` because of TickerProviderStateMixin.
// class _MyStatefulWidgetState extends State<MyStatefulWidget>
//     with TickerProviderStateMixin {
//   late TabController _tabController;
//
//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 3, vsync: this);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('TabBar Widget'),
//         bottom: TabBar(
//           controller: _tabController,
//           tabs: const <Widget>[
//             Tab(
//               icon: Icon(Icons.cloud_outlined),
//             ),
//             Tab(
//               icon: Icon(Icons.beach_access_sharp),
//             ),
//             Tab(
//               icon: Icon(Icons.brightness_5_sharp),
//             ),
//           ],
//         ),
//       ),
//       body: TabBarView(
//         controller: _tabController,
//         children: const <Widget>[
//           Center(
//             child: Text("It's cloudy here"),
//           ),
//           Center(
//             child: Text("It's rainy here"),
//           ),
//           Center(
//             child: Text("It's sunny here"),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//
