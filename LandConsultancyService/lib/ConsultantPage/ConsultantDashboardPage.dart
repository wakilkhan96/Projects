import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:landconsultancy/CitizenPage/LogoutAction.dart';
import 'package:landconsultancy/ConsultantPage/ConsultantDashboardTabPage.dart';
import 'package:landconsultancy/ConsultantPage/ConsultantProfilePage.dart';
import 'package:landconsultancy/ConsultantPage/ConsultantSettingsPage.dart';

class ConsultantDashboardPage extends StatefulWidget{
  const ConsultantDashboardPage({Key? key}) : super(key: key);
  @override
  _ConsultantDashboardPageState createState() => _ConsultantDashboardPageState();
}

class _ConsultantDashboardPageState extends State<ConsultantDashboardPage>{
  int _pageIndex = 0;
  late PageController _pageController;

  List<Widget> tabPages = [
    ConsultantDashboardTabPage(),
    ConsultantProfilePage(),
    ConsultantSettingsPage(),
  ];

  @override
  void initState(){
    super.initState();
    _pageController = PageController(initialPage: _pageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
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
          appBar: AppBar(
            centerTitle: true,
            title: Text("Consultant"),
            actions: const [
              LogoutAction(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _pageIndex,
            onTap: onTabTapped,
            backgroundColor: Colors.white,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem( icon: Icon(Icons.home), title: Text("Home")),
              BottomNavigationBarItem(icon: Icon(Icons.person), title: Text("Profile")),
              BottomNavigationBarItem(icon: Icon(Icons.settings), title: Text("Settings")),
            ],
          ),
          body: PageView(
            children: tabPages,
            physics: NeverScrollableScrollPhysics(),
            onPageChanged: onPageChanged,
            controller: _pageController,
          ),
        ));

  }

  void onPageChanged(int page) {
    setState(() {
      this._pageIndex = page;
    });
  }

  void onTabTapped(int index) {
    this._pageController.animateToPage(index,duration: const Duration(milliseconds: 500),curve: Curves.easeInOut);
  }
}