import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CardItem {
  final IconData icon;
  final String title;
  // final String subtitle;
  const CardItem({required this.icon, required this.title});
}

class UIScreen3 extends StatefulWidget {
  const UIScreen3({Key? key}) : super(key: key);

  @override
  _UIScreen3State createState() => _UIScreen3State();
}

class _UIScreen3State extends State<UIScreen3> {
  List<CardItem> items = [];

  _UIScreen3State() {
    String url = "https://images.unsplash.com/photo-1600185365926-3a2ce3cdb9eb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=725&q=80";

    for (int i = 0; i < 5; i++) {
      // items.add(CardItem(urlImage: url, title: "Text inside container.", subtitle: "10\$"));
      items.add(CardItem(icon: Icons.account_circle_outlined, title: "General Physician"));
    }
    print(items.length);
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
                        color: Color.fromRGBO(238, 244, 255, 1.0),
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
                        separatorBuilder: (context, _) => SizedBox(width: 15,),
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
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.add),
                                Text(
                                  " See how doctime work -> Render Problem.",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'RobotoMono',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),


                    ),


                    const SizedBox(height: 20,),

                    Row(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
                      height: 10,
                    ),
                    Container(
                      child: const Expanded(
                        flex: 0,
                        child: TextField(
                          // controller: descriptionTextFieldController,
                          maxLines: null, //wrap text
                          autofocus: true,
                          autocorrect: true,
                          enabled: false, // editing permission
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            height: 1.8, // line spacing height
                            fontSize: 18,
                            wordSpacing: 2.00,
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: '',
                            contentPadding: EdgeInsets.zero,
                          ),
                          //showCursor: false,
                          //cursorHeight: 18,
                        ),
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

  return Container(
    width: 130,
    decoration: BoxDecoration(
      // border: Border.all(
      //   //color: Colors.grey.withOpacity(0.5),
      //   color: Colors.white,
      //   width: 0.00,
      // ),
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
  );
}