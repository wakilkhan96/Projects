import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardItem {
  final String urlImage;
  final String title;
  final String subtitle;
  const CardItem(
      {required this.urlImage, required this.title, required this.subtitle});
}

class HorizontalCardScrollScreen1 extends StatefulWidget {
  const HorizontalCardScrollScreen1({Key? key}) : super(key: key);

  @override
  _HorizontalCardScrollScreen1State createState() => _HorizontalCardScrollScreen1State();
}

class _HorizontalCardScrollScreen1State extends State<HorizontalCardScrollScreen1> {
  List<CardItem> items = [];

  _HorizontalCardScrollScreen1State() {
    String url = "https://images.unsplash.com/photo-1600185365926-3a2ce3cdb9eb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=725&q=80";

    for (int i = 0; i < 5; i++) {
      items.add(CardItem(urlImage: url, title: "NIKE Shoe", subtitle: "10\$"));
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
                        // CircleAvatar(
                        //   radius: 50.0,
                        //   backgroundColor: Colors.white,
                        //   child: Center(
                        //       child: Image.network(
                        //         "",
                        //         // width: 500,
                        //         // height: 500,
                        //
                        //         fit: BoxFit.cover,
                        //       )),
                        //
                        // ),

                        Expanded(
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
                    const SizedBox(height: 10),

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
                                'Search by doctors name/code or speciality',
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
                      height: 140,
                      child: ListView.separated(
                        // padding: EdgeInsets.all(5),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => buildCard(items[index]),
                          separatorBuilder: (context, _) => SizedBox(width: 5,),
                          itemCount: items.length
                      ),
                    ),

                    const SizedBox(
                      height: 10,
                    ),
                    
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
    width: 120,
    child: Column(
      children: [
        Expanded(
          child: AspectRatio(
            aspectRatio: 4 / 3 ,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.network(
                  item.urlImage
              ),
            ),
          ),
        ),
        Text(
          item.title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          item.subtitle,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}