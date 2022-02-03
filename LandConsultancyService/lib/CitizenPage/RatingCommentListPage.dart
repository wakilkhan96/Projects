import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RatingCommentListPage extends StatefulWidget{
  @override
  _RatingCommentListPageState createState() => _RatingCommentListPageState();
}

class _RatingCommentListPageState extends State<RatingCommentListPage> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("User Feedback"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Text("Comment and Rating List"),
        ),
      ),
    );
  }
}