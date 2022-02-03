import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:landconsultancy/CitizenPage/ConsultantProfileDetailsPage.dart';

class CardItem {
  final IconData icon;
  final String title;
  // final String subtitle;
  const CardItem({required this.icon, required this.title});
}

class ConsultantInfo {
  // final String urlImage = "https://images.unsplash.com/photo-1612531386530-97286d97c2d2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80";
  // final String urlImage = "https://images.unsplash.com/photo-1585846328761-acbf5a12beea?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80";
  final String urlImage;

  final String consultantType;
  final String consultantName;
  final String consultantDegrees;
  final String consultantSpecialities;
  final String consultantWorkingPlace;
  final int consultantExperience;
  final double consultantRating;
  final int totalRatings;
  final int consultantFeePerConsultation;
  final int currentOffPercentagePerConsultation;
  const ConsultantInfo({
    required this.urlImage,

    required this.consultantType,
    required this.consultantName,
    required this.consultantDegrees,
    required this.consultantSpecialities,
    required this.consultantWorkingPlace,
    required this.consultantExperience,
    required this.consultantRating,
    required this.totalRatings,
    required this.consultantFeePerConsultation,
    required this.currentOffPercentagePerConsultation
  });
}

class CitizenDashboardTab extends StatefulWidget {
  @override
  _CitizenDashboardTabState createState() => _CitizenDashboardTabState();
}

class _CitizenDashboardTabState extends State<CitizenDashboardTab> {
  String url =
      "https://images.unsplash.com/photo-1612531386530-97286d97c2d2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80";

  List<CardItem> items = [];
  List<ConsultantInfo> imageItems = [];

  _CitizenDashboardTabState() {
    for (int j = 0; j < 1; j++) {
      imageItems.add(
          ConsultantInfo(
            urlImage: "https://images.unsplash.com/photo-1585846328761-acbf5a12beea?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80",
            consultantType: "General Consultant",
            consultantName: "Dr. Abu Noyim Mohammad Bozlur Rashid",
            consultantDegrees: "PhD / Hons",
            consultantSpecialities: "Land Consultancy",
            consultantWorkingPlace: "Mysoftheaven (BD) Ltd.",
            consultantExperience: 5,
            consultantRating: 4.9,
            totalRatings: 2026,
            consultantFeePerConsultation: 220,
            currentOffPercentagePerConsultation: 0,
          ),
      );
    }
    for (int j = 0; j < 1; j++) {
      imageItems.add(
        ConsultantInfo(
          urlImage: "https://st.depositphotos.com/1075946/1821/i/950/depositphotos_18214139-stock-photo-salesman-standing-outside-the-airport.jpg",
          consultantType: "General Consultant",
          consultantName: "Hasan ul Alam",
          consultantDegrees: "Hons",
          consultantSpecialities: "Land Consultancy",
          consultantWorkingPlace: "Newgen Private Ltd.",
          consultantExperience: 1,
          consultantRating: 4.5,
          totalRatings: 126,
          consultantFeePerConsultation: 190,
          currentOffPercentagePerConsultation: 20,
        ),
      );
    }

    for (int i = 0; i < 5; i++) {
      // items.add(CardItem(urlImage: url, title: "Text inside container.", subtitle: "10\$"));
      items.add(CardItem(
          icon: Icons.account_circle_outlined, title: "General Consultant"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            // padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 5),
                //profile and menu
                Row(
                  children: <Widget>[
                    Container(
                      child: Icon(Icons.restaurant_menu_sharp, size:  30,),
                    ),
                    const Expanded(
                      child: SizedBox(
                        height: 1,
                      ),
                    ),
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

                //search
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
                                'Search by consultant\'s name/code & speciality',
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

                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Top Rated Consultants",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'RobotoMono',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 300,
                  child: ListView.separated(
                      // padding: EdgeInsets.all(5),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) =>
                          buildImageCard(imageItems[index]),
                      separatorBuilder: (context, _) => const SizedBox(
                            width: 10,
                          ),
                      itemCount: imageItems.length),
                ),
                const SizedBox(
                  height: 25,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Active Consultants",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'RobotoMono',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 300,
                  child: ListView.separated(
                      // padding: EdgeInsets.all(5),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) =>
                          buildImageCardActive(imageItems[index]),
                      separatorBuilder: (context, _) => const SizedBox(
                            width: 10,
                          ),
                      itemCount: imageItems.length),
                ),
                const SizedBox(
                  height: 25,
                ),

                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Category List",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'RobotoMono',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),

                Container(
                  height: 170,
                  child: ListView.separated(
                      // padding: EdgeInsets.all(5),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => buildCard(items[index]),
                      separatorBuilder: (context, _) => const SizedBox(
                            width: 20,
                          ),
                      itemCount: items.length),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCard(CardItem consultantInfo) {
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
        child: Material(
          child: InkWell(
            onTap: () {
              print("category_list");
            },
            child: Column(
              children: [
                const Expanded(child: SizedBox(width: 1)),
                Icon(
                  consultantInfo.icon,
                  size: 50,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  consultantInfo.title,
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
        ),
      ),
    );
  }


  Widget buildImageCard(ConsultantInfo consultantInfo) {
    double containerWidth = 200;

    return Padding(
      padding: EdgeInsets.all(0),
      // padding: EdgeInsets.only(top: 1, bottom: 1),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          // side: const BorderSide(color: Colors.black12, width: 2),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 11,
              child: InkWell(
                onTap: () {
                  print("top");
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context)=> ConsultantProfileDetailsPage(consultantInfo: consultantInfo),),
                  );
                },
                child: Column(
                  children: [
                    Container(
                      // color: Colors.yellow,
                      width: containerWidth,
                      height: 130,
                      child: AspectRatio(
                        aspectRatio: 4 / 3,
                        child: ClipRRect(
                          // borderRadius: BorderRadius.circular(22.0),
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15),),
                          child: Stack(
                            fit: StackFit.expand,
                            children : [

                              Image.network(consultantInfo.urlImage, fit: BoxFit.cover,),


                            ],
                          ),
                          // child: Image.network(
                          //   consultantInfo.urlImage,
                          //   fit: BoxFit.cover,
                          //
                          // ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5,),
                    Container(
                      width: containerWidth,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(consultantInfo.consultantType, style: TextStyle(fontSize: 12, color: Colors.blue),),
                            SizedBox(height: 1.5,),
                            Text(consultantInfo.consultantName, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800, color: Colors.black),),
                            SizedBox(height: 2.5,),
                            Text(consultantInfo.consultantDegrees, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w200, color: Colors.black),),
                            SizedBox(height: 3,),

                            Wrap(
                              children: [
                                RatingBarIndicator(
                                  rating: consultantInfo.consultantRating,
                                  itemBuilder: (context, index) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  itemCount: 5,
                                  itemSize: 15.0,
                                  direction: Axis.horizontal,
                                ),
                                SizedBox(width: 5,),
                                RichText(
                                  text: TextSpan(
                                      text: '',  // default text
                                      style: TextStyle(color: Colors.black),  // default color
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: consultantInfo.consultantRating.toString(),
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'RobotoMono',
                                            fontWeight: FontWeight.w800,
                                            fontSize: 14,
                                          ),
                                        ),
                                        TextSpan(
                                          text: " (" + consultantInfo.totalRatings.toString()+")",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'RobotoMono',
                                            fontWeight: FontWeight.w300,
                                            fontSize: 14,
                                          ),
                                        ),


                                      ]
                                  ),
                                ),
                              ],
                            ),

                          ],
                        ),
                      ),
                    ),
                    Expanded(child: Container(width: 10,),),
                  ],
                ),
              ),
            ),

            Expanded(
              flex: 2,
              child: Container(
                // color: Colors.green,
                width: containerWidth,
                height: 45,
                // decoration: BoxDecoration(
                //     border: Border.all(color: Colors.blueAccent),
                // ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {print("proceed_to_consultation");},
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "\$"+ ((consultantInfo.consultantFeePerConsultation*(100-consultantInfo.currentOffPercentagePerConsultation))/100).toString(),
                                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800),),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              // child: Text("\$"+consultantInfo.currentConsultantFeePerConsultation.toString(), style: TextStyle(decoration: TextDecoration.lineThrough, fontSize: 17),),
                              child: RichText(
                                text: TextSpan(
                                    children: <TextSpan>[
                                      if(consultantInfo.currentOffPercentagePerConsultation != 0 ) TextSpan(
                                        text: "\$"+consultantInfo.consultantFeePerConsultation.toString(),
                                        style: const TextStyle(
                                          decoration: TextDecoration.lineThrough,
                                          color: Colors.grey,
                                          fontFamily: 'RobotoMono',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13,
                                        ),
                                      ),
                                      TextSpan(
                                        text: " per consultation",
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontFamily: 'RobotoMono',
                                          fontWeight: FontWeight.w300,
                                          fontSize: 13,
                                        ),
                                      ),

                                    ]
                                ),
                              ),

                            ),
                            // SizedBox(height: 5,),

                          ],
                        ),
                        Expanded(child: SizedBox(height: 1,)),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color:  Colors.black12,
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(40), bottomRight: Radius.circular(15),),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 10, right: 0, top: 7, bottom: 0),
                              child: Icon(Icons.keyboard_arrow_right, size: 20, ),
                              // child: Icon(IconData(0xe09bc, fontFamily: 'MaterialIcons', matchTextDirection: true), size: 10, ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

              ),
            ),

          ],
        ),
      ),
    );
  }


  Widget buildImageCardActive(ConsultantInfo consultantInfo) {
    double containerWidth = 200;

    return Padding(
      padding: EdgeInsets.all(0),
      // padding: EdgeInsets.only(top: 1, bottom: 1),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          // side: const BorderSide(color: Colors.black12, width: 2),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 11,
              child: InkWell(
                onTap: () {
                  print("top");
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context)=> ConsultantProfileDetailsPage(consultantInfo: consultantInfo,),),
                  );
                },
                child: Column(
                  children: [
                    Container(
                      width: containerWidth,
                      height: 130,
                      child: AspectRatio(
                        aspectRatio: 4 / 3,
                        child: ClipRRect(
                          // borderRadius: BorderRadius.circular(22.0),
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15),),
                          child: Stack(
                            fit: StackFit.expand,
                            children : [

                              Image.network(consultantInfo.urlImage, fit: BoxFit.cover,),

                              Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  // padding: EdgeInsets.only(top: 5, right: 10),
                                  padding: EdgeInsets.all(7),
                                  child: Container(
                                    height: 20,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.green,
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Online",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),

                                  // child: Container(
                                  //   height: 16,
                                  //   width: 16,
                                  //   decoration: BoxDecoration(
                                  //     color: Colors.white,
                                  //     borderRadius: BorderRadius.circular(10),
                                  //   ),
                                  //   child: Center(
                                  //     child: Container(
                                  //       height: 11,
                                  //       width: 11,
                                  //       decoration: BoxDecoration(
                                  //         color: Colors.green,
                                  //         borderRadius: BorderRadius.circular(10),
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                ),
                              ),

                            ],
                          ),
                          // child: Image.network(
                          //   consultantInfo.urlImage,
                          //   fit: BoxFit.cover,
                          //
                          // ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5,),
                    Container(
                      width: containerWidth,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(consultantInfo.consultantType, style: TextStyle(fontSize: 12, color: Colors.blue),),
                            SizedBox(height: 1.5,),
                            Text(consultantInfo.consultantName, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800, color: Colors.black),),
                            SizedBox(height: 2.5,),
                            Text(consultantInfo.consultantDegrees, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w200, color: Colors.black),),
                            SizedBox(height: 3,),

                            Wrap(
                              children: [
                                RatingBarIndicator(
                                  rating: consultantInfo.consultantRating,
                                  itemBuilder: (context, index) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  itemCount: 5,
                                  itemSize: 15.0,
                                  direction: Axis.horizontal,
                                ),
                                SizedBox(width: 5,),
                                RichText(
                                  text: TextSpan(
                                      text: '',  // default text
                                      style: TextStyle(color: Colors.black),  // default color
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: consultantInfo.consultantRating.toString(),
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'RobotoMono',
                                            fontWeight: FontWeight.w800,
                                            fontSize: 14,
                                          ),
                                        ),
                                        TextSpan(
                                          text: " (" + consultantInfo.totalRatings.toString()+")",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'RobotoMono',
                                            fontWeight: FontWeight.w300,
                                            fontSize: 14,
                                          ),
                                        ),


                                      ]
                                  ),
                                ),
                              ],
                            ),

                          ],
                        ),
                      ),
                    ),
                    Expanded(child: Container(width: 10,),),
                  ],
                ),
              ),
            ),

            Expanded(
              flex: 2,
                child: Container(
                  // color: Colors.green,
                  width: containerWidth,
                  height: 45,
                  // decoration: BoxDecoration(
                  //     border: Border.all(color: Colors.blueAccent),
                  // ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {print("proceed_to_consultation");},
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  "\$"+ ((consultantInfo.consultantFeePerConsultation*(100-consultantInfo.currentOffPercentagePerConsultation))/100).toString(),
                                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800),),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                // child: Text("\$"+consultantInfo.currentConsultantFeePerConsultation.toString(), style: TextStyle(decoration: TextDecoration.lineThrough, fontSize: 17),),
                                child: RichText(
                                  text: TextSpan(
                                      children: <TextSpan>[
                                        if(consultantInfo.currentOffPercentagePerConsultation != 0 ) TextSpan(
                                          text: "\$"+consultantInfo.consultantFeePerConsultation.toString(),
                                          style: const TextStyle(
                                            decoration: TextDecoration.lineThrough,
                                            color: Colors.grey,
                                            fontFamily: 'RobotoMono',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13,
                                          ),
                                        ),
                                        TextSpan(
                                          text: " per consultation",
                                          style: const TextStyle(
                                            color: Colors.grey,
                                            fontFamily: 'RobotoMono',
                                            fontWeight: FontWeight.w300,
                                            fontSize: 13,
                                          ),
                                        ),

                                      ]
                                  ),
                                ),

                              ),
                              // SizedBox(height: 5,),

                            ],
                          ),
                          Expanded(child: SizedBox(height: 1,)),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color:  Colors.black12,
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(40), bottomRight: Radius.circular(15),),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: 10, right: 0, top: 7, bottom: 0),
                                child: Icon(Icons.keyboard_arrow_right, size: 20, ),
                                // child: Icon(IconData(0xe09bc, fontFamily: 'MaterialIcons', matchTextDirection: true), size: 10, ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                ),
            ),

          ],
        ),
      ),
    );
  }

}
