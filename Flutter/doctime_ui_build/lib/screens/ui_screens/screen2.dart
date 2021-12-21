import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CardItem {
  final IconData icon;
  final String title;
  // final String subtitle;
  const CardItem({required this.icon, required this.title});
}
class ImageCardItem {
  final String urlImage;
  final String title;
  final String subtitle;
  const ImageCardItem({required this.urlImage, required this.title, required this.subtitle});
}

class UIScreen2 extends StatefulWidget {
  const UIScreen2({Key? key}) : super(key: key);

  @override
  _UIScreen2State createState() => _UIScreen2State();
}

class _UIScreen2State extends State<UIScreen2> {

  String url = "https://images.unsplash.com/photo-1612531386530-97286d97c2d2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80";

  _UIScreen2State() {

  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Select Patient",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'RobotoMono',
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),

                    Row(
                      children: [
                        Column(
                          children: [

                            Row(
                              children: <Widget>[

                                CircleAvatar(
                                  radius: 35.0,
                                  backgroundColor: Colors.white,
                                  child: AspectRatio(
                                    aspectRatio: 1 / 1,
                                    child: ClipRRect(
                                      child: Image.network(
                                        url,
                                        // width: 300,
                                        // height: 300,
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(40.0),
                                    ),
                                  ),

                                ),

                              ],
                            )

                          ],

                        ),
                        
                        SizedBox(width: 15,),

                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                children: const [
                                  Text(
                                    "doctor",
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        Container(
                          width: 150,
                          decoration: const BoxDecoration(
                            color: Colors.yellow,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: const [
                                          Text(
                                            "Patient in Queue",
                                            style: TextStyle(
                                              color: Colors.blue,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 20,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: const [
                                          Text("data")
                                        ],
                                      ),
                                    ],
                                  )
                              ),
                            ],
                          ),
                        ),


                      ],
                    ),



                    const SizedBox(height: 20,),


                    const SizedBox(
                      height: 15,
                    ),


                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        border: Border.all(
                          //color: Colors.grey.withOpacity(0.5),
                          color: Colors.white,
                          width: 0.00,
                        ),
                        // boxShadow: const [
                        //   BoxShadow(
                        //     color: Color.fromRGBO(0, 0, 0, 0.03),
                        //     offset: Offset(0, 0),
                        //     blurRadius: 2,
                        //     spreadRadius: 2,
                        //   )
                        // ],
                        borderRadius: BorderRadius.circular(30.0),
                        color: const Color.fromRGBO(238, 244, 255, 1.0),
                        // color: Colors.transparent,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [

                              Text(
                                "Share ",
                                style: TextStyle(
                                  fontFamily: 'RobotoMono',
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                "DocTime",
                                style: TextStyle(
                                    fontFamily: 'RobotoMono',
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.lightBlue
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 10),
                          // Row(
                          //   children: const [
                          //       Expanded(child: Icon(IconData(0xe593, fontFamily: 'MaterialIcons'), size: 16, color: Colors.blue,)),
                          //       Expanded(
                          //           child: ImageIcon(
                          //             AssetImage("assets/images/share_icon.png"),
                          //             // color: Color(0xFF3A5A98),
                          //             size: 16,
                          //             color: Colors.red,
                          //           ),
                          //       ),
                          //   ],
                          // ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "with family and friends",
                                style: TextStyle(
                                  fontFamily: 'RobotoMono',
                                  fontSize: 23,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 12),

                          Container(
                            height: 50,
                            width: 320,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              color: Colors.blue,
                              // color: Colors.transparent,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      // Icon(Icons.add, size: 16, color: Colors.white,),
                                      Icon(IconData(0xe593, fontFamily: 'MaterialIcons'), size: 20, color: Colors.white,),
                                      SizedBox(width: 10,),
                                      Text(
                                        "SHARE WITH YOUR FRIENDS",
                                        style: TextStyle(
                                          fontFamily: 'RobotoMono',
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),

                          ),

                        ],
                      ),
                    ),

                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}




Widget buildCard(CardItem item) {

  return Padding(
    // padding: EdgeInsets.all(10),
    padding: EdgeInsets.only(top: 5, bottom: 5),
    child: Container(
      width: 130,
      decoration: BoxDecoration(
        // border: Border.all(
        //   //color: Colors.grey.withOpacity(0.5),
        //   color: Colors.white,
        //   width: 0.00,
        // ),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.07),
            offset: Offset(0, 0),
            blurRadius: 7,
            spreadRadius: 2,
          )
        ],
        borderRadius: BorderRadius.circular(10.0),
        color: const Color.fromRGBO(238, 244, 255, 1.0),
      ),
      child: Column(
        children: [
          const Expanded(child: SizedBox(width: 1)),

          Icon(
            item.icon,
            size: 50,
          ),
          SizedBox(height: 10,),
          Text(
            item.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'RobotoMono',
              fontSize: 18,
              // fontWeight: FontWeight.bold,
            ),
          ),

          const Expanded(child: SizedBox(width: 1)),
        ],
      ),
    ),
  );
}

Widget buildImageCard(ImageCardItem item) {

  return Padding(
    padding: EdgeInsets.all(0),
    // padding: EdgeInsets.only(top: 1, bottom: 1),
    child: Container(
      width: 100,
      decoration: BoxDecoration(
        border: Border.all(
          //color: Colors.grey.withOpacity(0.5),
          color: Colors.white,
          width: 0.00,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.07),
            offset: Offset(0, 0),
            blurRadius: 7,
            spreadRadius: 2,
          )
        ],
        borderRadius: BorderRadius.circular(30.0),
        color: const Color.fromRGBO(238, 244, 255, 1.0),
        // color: Colors.transparent,
      ),
      child: Column(
        children: [
          Expanded(
            child: AspectRatio(
              aspectRatio: 4 / 3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: Image.network(
                  item.urlImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Text(
          //   item.title,
          //   style: TextStyle(
          //     fontSize: 18,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
          // Text(
          //   item.subtitle,
          //   style: TextStyle(
          //     fontSize: 14,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
        ],
      ),
    ),
  );
}