import 'package:flutter/material.dart';


class CustomControlledTabController3 extends StatefulWidget {
  const CustomControlledTabController3({Key? key}) : super(key: key);

  @override
  _CustomControlledTabController3State createState() =>
      _CustomControlledTabController3State();
}

class _CustomControlledTabController3State
    extends State<CustomControlledTabController3> with TickerProviderStateMixin {

  late TabController tabController;

  List<bool> _isDisabled = [false, true, true];
  List<bool> _isComplete = [false, false, false];
  int currentTab = 0;


  @override
  void initState() {
    super.initState();
    tabController = TabController(initialIndex: 0, length: 3, vsync: this);
    tabController.addListener(() {
      if(!_isComplete[currentTab] || _isDisabled[tabController.index]) {
        tabController.animateTo(currentTab);
      }
      else if(tabController.index == currentTab+1) {
        tabController.animateTo(currentTab++);
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
        backgroundColor: Colors.white10,
        title: const Text('TabBar Widget 3'),
        bottom: TabBar(
          controller: tabController,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey,
          labelStyle: const TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelStyle: const TextStyle(fontStyle: FontStyle.italic),
          overlayColor: MaterialStateColor.resolveWith((Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.blue;
            } if (states.contains(MaterialState.focused)) {
              return Colors.orange;
            } else if (states.contains(MaterialState.hovered)) {
              return Colors.pinkAccent;
            }

            return Colors.transparent;
          }),
          indicatorWeight: 0,
          indicatorColor: Colors.blueAccent,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorPadding: const EdgeInsets.all(5),
          indicator: BoxDecoration(
            border: Border.all(color: Colors.white10),
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey,
          ),
          // isScrollable: true,
          physics: BouncingScrollPhysics(),
          onTap: (int index) {
            print('Tab $index is tapped');
          },
          enableFeedback: true,

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
                            _isComplete[currentTab] = true;
                            if(currentTab+1 < tabController.length) _isDisabled[currentTab+1] = false;
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
                            _isComplete[currentTab] = true;
                            if(currentTab+1 < tabController.length) _isDisabled[currentTab+1] = false;
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
                            _isComplete[currentTab] = true;
                            if(currentTab+1 < tabController.length) _isDisabled[currentTab+1] = false;
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
