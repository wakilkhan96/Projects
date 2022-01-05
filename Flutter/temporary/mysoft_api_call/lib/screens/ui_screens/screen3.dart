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

class UIScreen3 extends StatefulWidget {
  const UIScreen3({Key? key}) : super(key: key);

  @override
  _UIScreen3State createState() => _UIScreen3State();
}

class _UIScreen3State extends State<UIScreen3> {
  List<CardItem> items = [];
  List<ImageCardItem> imageItems = [];

  _UIScreen3State() {
    // String url = "https://images.unsplash.com/photo-1600185365926-3a2ce3cdb9eb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=725&q=80";
    String url = "https://images.unsplash.com/photo-1612531386530-97286d97c2d2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80";

    for (int i = 0; i < 5; i++) {
      // items.add(CardItem(urlImage: url, title: "Text inside container.", subtitle: "10\$"));
      items.add(CardItem(icon: Icons.account_circle_outlined, title: "General Physician"));
    }


    for (int j = 0;  j < 10; j++) {
      imageItems.add(ImageCardItem(urlImage: url, title: "NIKE Shoe", subtitle: "10\$"));
    }
    // print(items.length);
    // print(imageItems.length);
  }

  int _currentIndex = 0;

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
                      children: <Widget>[
                        Container(
                          child: Image.asset(
                            'assets/images/logo_doctime.png',
                            height: 60.0,
                            fit: BoxFit.cover,
                          ),
                        ),

                        const Expanded(
                          child: SizedBox(
                            height: 1,
                          ),
                        ),

                        // Container(
                        //   // alignment: Alignment.centerRight,
                        //   child: Padding(
                        //     padding: EdgeInsets.only( right: 15),
                        //     child: Icon(
                        //       Icons.add,
                        //       color: Colors.grey,
                        //       size: 25,
                        //     ),
                        //   ),
                        // ),

                        Padding(
                          padding: EdgeInsets.only(right: 15),
                          child: Container(
                            // alignment: Alignment.centerRight,
                            child: const CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.blue,
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 25,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          //color: Colors.grey.withOpacity(0.5),
                          color: Colors.white,
                          width: 0.00,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                        color: const Color.fromRGBO(238, 244, 255, 1.0),
                      ),
                      // margin: EdgeInsets.all(10),
                      height: 60,
                      child: Row(
                        children: const <Widget>[
                          Expanded(
                            child: TextField(
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText:
                                    'Search by doctor\'s name/code & speciality',
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15.0,
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 8),
                                isDense: true,
                              ),
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 15),
                            child: Icon(
                              Icons.search,
                              color: Colors.grey,
                              size: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ), //in between spacer

                    Container(
                      height: 170,
                      child: ListView.separated(
                        // padding: EdgeInsets.all(5),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => buildCard(items[index]),
                        separatorBuilder: (context, _) => const SizedBox(width: 20,),
                        itemCount: items.length
                      ),
                    ),

                    // const SizedBox(height: 30,),
                    //
                    // Container(
                    //   height: 100,
                    //   decoration: BoxDecoration(
                    //     border: Border.all(
                    //       //color: Colors.grey.withOpacity(0.5),
                    //       color: Colors.white,
                    //       width: 0.00,
                    //     ),
                    //     borderRadius: BorderRadius.circular(10.0),
                    //     color: const Color.fromRGBO(238, 244, 255, 1.0),
                    //     // color: Colors.green,
                    //   ),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       Icon(Icons.album_outlined),
                    //       Expanded(
                    //         child: Column(
                    //           mainAxisAlignment: MainAxisAlignment.center,
                    //           children: const [
                    //
                    //             Text(
                    //               " See how doctime works",
                    //               textAlign: TextAlign.center,
                    //               style: TextStyle(
                    //                 fontSize: 14,
                    //                 fontFamily: 'RobotoMono',
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    //
                    // ),

                    const SizedBox(height: 30,),

                    Container(
                      height: 100,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage("assets/images/video_background.jpg"),
                          fit: BoxFit.cover,
                        ),
                        border: Border.all(
                          //color: Colors.grey.withOpacity(0.5),
                          color: Colors.white,
                          width: 0.00,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                        color: const Color.fromRGBO(238, 244, 255, 1.0),
                        // color: Colors.green,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              SizedBox(width: 20,),
                              Icon(Icons.adjust, color: Colors.black, ),
                              Flexible(
                                child: Text(
                                  " See how DocTime works",
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontFamily: 'RobotoMono',
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(width: 20,),
                            ],
                          ),
                        ],
                      ),


                    ),


                    const SizedBox(height: 20,),

                    Row(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Recently viewed",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'RobotoMono',
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 100,
                      child: ListView.separated(
                        // padding: EdgeInsets.all(5),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => buildImageCard(imageItems[index]),
                          separatorBuilder: (context, _) => const SizedBox(width: 10,),
                          itemCount: imageItems.length
                      ),
                    ),
                    const SizedBox(
                      height: 25,
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