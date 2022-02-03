import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:landconsultancy/utils/constants.dart';


class CitizenProfilePage extends StatefulWidget{

  @override
  _CitizenProfilePageState createState() => _CitizenProfilePageState();

}

class _CitizenProfilePageState extends State<CitizenProfilePage>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
//        resizeToAvoidBottomPadding: false,
      /*appBar: AppBar(
        title: Text("Consultant Details"),
      ),*/

      body: SingleChildScrollView(child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
//        crossAxisAlignment: CrossAxisAlignment.center,
//      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          SizedBox(height: 8,),
                          /*Badge(
                            child:

                            badgeColor: Colors.green,
//                            alignment: Alignment.bottomRight,
                            alignment: Alignment.bottomRight,
                          ),*/

                          Container(
                            width: 75,
                            child: Stack(
                              children: [
                                CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      "https://picsum.photos/200/300.jpg"),
                                  radius: 45,
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Padding(
                                    padding: EdgeInsets.all(6),
                                    child: Container(
                                      height: 22,
                                      width: 22,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: Colors.black26, width: 1),
                                      ),
                                      child: Center(
                                        child: InkWell(
                                          onTap: () {
                                            citizenActiveness==true? print("Offline Now"): print("Online Now");
                                            setState(() {
                                              citizenActiveness = !citizenActiveness;
                                            });

                                          },
                                          child: Container(
                                            height: 14,
                                            width: 14,
                                            decoration: BoxDecoration(
                                              color: (citizenActiveness==true? Colors.green: Colors.red),
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          /*Container(
                            height: 20.0,
                            width: 20.0,
                            color: Colors.blue[50],
                            child: Align(
                              alignment: Alignment.topRight,
                              child: FlutterLogo(
                                size: 60,
                              ),
                            ),
                          ),*/

                          /*Badge(
                            child: Icon(Icons.shop, size: 50,),
                          ),*/
                        ],
                      )
                  ),
                  Expanded(
                      flex: 2,
                      child: Card(
//                        color: Colors.white,
                        child: Container(
                          margin: EdgeInsets.only(right: 20),
                          padding: EdgeInsets.only(top: 10),
//                            transform: Matrix4.translationValues(0.0, -50.0, 0.0),
                          height: 80,
                          decoration: BoxDecoration(
//                                border: Border(left: BorderSide(color: Colors.green, width: 10)),
//                              borderRadius: BorderRadius.all( Radius.circular(25.0)),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40.0),
                                bottomLeft: Radius.circular(40.0)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Consultation Fee", style: TextStyle(color: Colors.blue,),),
                              SizedBox(height: 5,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("\$250", style: TextStyle(color: Colors.blue, fontSize: 18, fontWeight: FontWeight.bold,),),
                                  SizedBox(width: 3,),
                                  Text("(incl. VAT)", overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold,),),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("before", style: TextStyle(fontSize: 12,),),
                                  SizedBox(width: 3,),
                                  Text("\$300", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, decoration: TextDecoration.lineThrough),),
                                ],
                              ),
                            ],
                          ),
                        ),
//                        elevation: 5,
                        /*child: ClipPath(
                          clipper: ShapeBorderClipper(shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25))),
                        ),*/
                      )
                  )
                ],
              )
          ),
          /*Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://picsum.photos/200/300.jpg"),
                      radius: 50,
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Imdadul Haque"),
                          SizedBox(height: 10,),
                          Text("\$ 200"),
                          Card(
                            child: Column(
                              children: [
                                Text("Imdadul Haque"),
                              ],
                            ),
                          ),
                        ],
                      )
                  )
                ],
              )
          ),*/
//          Spacer(),
          SizedBox(height: 10,),

          Visibility(
            visible: false,
            child: Container(
                child: Card(
                  elevation: 5,
                  child: ClipPath(
                    child: Container(
                      height: 80,
                      margin: EdgeInsets.only(left: 10, top: 10),
                      decoration: BoxDecoration(
//                        border: Border(right: BorderSide(color: Colors.green, width: 10))
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 5),
                          Text("Md. Imdadul Haue", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),),
                          SizedBox(height: 5,),
                          Text("Software Engineer"),
                          SizedBox(height: 5,),
                          Text("Begum Rokeya University, Rangpur", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,),),
                        ],
                      ),
                    ),
                    clipper: ShapeBorderClipper(shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3))),
                  ),
                )
            ),
          ),

          Visibility(
            visible: false,
            child: Container(
                child: Card(
                  elevation: 5,
                  child: ClipPath(
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                          border: Border(right: BorderSide(color: Colors.green, width: 5))),
                    ),
                    clipper: ShapeBorderClipper(shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3))),
                  ),
                )
            ),
          ),
          Container(
//              transform: Matrix4.translationValues(0.0, 0.0, -50.0),
//              transform: Matrix4.diagonal3Values(100.0, 60.0, 90.0),
//          transformAlignment: Matrix4.rotationY(90),
            child: Card(
//              margin: EdgeInsets.only(right: 50.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              shadowColor: Colors.blueAccent,
              elevation: 5,
              child: ClipPath(
                clipper: ShapeBorderClipper(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                child: Container(
                    decoration: BoxDecoration(
//                      border: Border(left: BorderSide(color: Colors.red, width: 15)),
//                      color: Colors.yellowAccent.shade100,
                    ),
                    padding: EdgeInsets.only(top: 20.0),
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 80,
                          margin: EdgeInsets.only(left: 20, top: 10),
                          decoration: BoxDecoration(
//                        border: Border(right: BorderSide(color: Colors.green, width: 10))
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 5),
                              Text("Md. Imdadul Haue", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),),
                              SizedBox(height: 5,),
                              Text("Software Engineer"),
                              SizedBox(height: 5,),
                              Text("Begum Rokeya University, Rangpur", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,),),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Container(
                                height: 40,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text("Total Experience", style: TextStyle(fontSize: 10, color: Colors.grey),),
                                    Text("4+ years", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),),
                                  ],
                                ),
                              ),
                            ),

                            DottedLine(
                              direction: Axis.vertical,
                              lineLength: 50.0,
                              lineThickness: 0.5,
                              dashColor: Colors.grey,
//                          dashGradient: [Colors.red, Colors.blue],
                              dashRadius: 0.0,
//                          dashGapLength: 4.0,
//                          dashGapColor: Colors.transparent,
//                          dashGapGradient: [Colors.red, Colors.blue],
                              dashGapRadius: 0.0,
                            ),
                            Expanded(
                              child: Container(
                                height: 40,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text("Total Ratings (20)", style: TextStyle(fontSize: 10, color: Colors.grey),),
//                                  Text("4+ years", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        RatingBar.builder(
                                          initialRating: 4,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          unratedColor: Colors.amber.withAlpha(50),
                                          itemCount: 5,
                                          itemSize: 15.0,
                                          itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                                          itemBuilder: (context, _) => Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          updateOnDrag: true, onRatingUpdate: (double value) {  },
                                        ),
                                        SizedBox(width: 5,),
                                        Text("5", style: TextStyle(fontWeight: FontWeight.bold),)
                                      ],
                                    ),

                                  ],
                                ),
                              ),
                            ),

                            DottedLine(
                              direction: Axis.vertical,
                              lineLength: 50.0,
                              lineThickness: 0.5,
                              dashColor: Colors.grey,
                              dashRadius: 0.0,
                              dashGapRadius: 0.0,
                            ),
                            Expanded(
                              child: Container(
                                height: 40,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text("Emp ID", style: TextStyle(fontSize: 10, color: Colors.grey),),
                                    Text("48506", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SingleChildScrollView(
                          child:  Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 20),
                                height: 50,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Working in", style: TextStyle(fontSize: 11, color: Colors.grey),),
                                    SizedBox(height: 5,),
                                    Text("Mysoft Heaven (BD) Ltd", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),)
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("About Consultant", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),),
                                    SizedBox(height: 5,),
                                    Text("Md. Imdadul Haque"),
                                    SizedBox(height: 5,),
                                    Text("Sr. Software Engineer",style: TextStyle(fontSize: 12, color: Colors.black),),
                                    SizedBox(height: 5,),
                                    Text("Mysoftheaven (BD) Ltd.",style: TextStyle(fontSize: 12, color: Colors.black),),
                                    SizedBox(height: 5,),
                                    Text("t is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here',",
                                        style: TextStyle(fontSize: 12, color: Colors.black), textAlign: TextAlign.justify)
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("About Consultant", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),),
                                    SizedBox(height: 5,),
                                    Text("Md. Imdadul Haque"),
                                    SizedBox(height: 5,),
                                    Text("Sr. Software Engineer",style: TextStyle(fontSize: 12, color: Colors.black),),
                                    SizedBox(height: 5,),
                                    Text("Mysoftheaven (BD) Ltd.",style: TextStyle(fontSize: 12, color: Colors.black),),
                                    SizedBox(height: 5,),
                                    Text("t is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here',",
                                        style: TextStyle(fontSize: 12, color: Colors.black), textAlign: TextAlign.justify)
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("About Consultant", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),),
                                    SizedBox(height: 5,),
                                    Text("Md. Imdadul Haque"),
                                    SizedBox(height: 5,),
                                    Text("Sr. Software Engineer",style: TextStyle(fontSize: 12, color: Colors.black),),
                                    SizedBox(height: 5,),
                                    Text("Mysoftheaven (BD) Ltd.",style: TextStyle(fontSize: 12, color: Colors.black),),
                                    SizedBox(height: 5,),
                                    Text("t is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here',",
                                        style: TextStyle(fontSize: 12, color: Colors.black), textAlign: TextAlign.justify)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                      ],
                    )
                ),

              ),
            ),

          ),

        ],
      )),

    );
  }
}