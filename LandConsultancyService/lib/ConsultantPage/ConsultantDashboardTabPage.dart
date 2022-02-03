import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConsultantDashboardTabPage extends StatefulWidget{
  @override
  _ConsultantDashboardTabPageState createState() => _ConsultantDashboardTabPageState();
}

class _ConsultantDashboardTabPageState extends State<ConsultantDashboardTabPage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Text("Consultant Dashboard"),
      ),
    );
  }
}