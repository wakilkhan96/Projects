import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DoctorInfo {
  final String doctorName;
  final String doctorDegrees;
  final String doctorSpecialities;
  final String doctorWorkingPlace;
  final int doctorExperience;
  final double doctorRating;
  final int totalRatings;
  final int doctorFeePerConsultation;
  DoctorInfo({
    required this.doctorName,
    required this.doctorDegrees,
    required this.doctorSpecialities,
    required this.doctorWorkingPlace,
    required this.doctorExperience,
    required this.doctorRating,
    required this.totalRatings,
    required this.doctorFeePerConsultation
  });
}
class MyScreen1 extends StatefulWidget {
  const MyScreen1({Key? key}) : super(key: key);

  @override
  _MyScreen1State createState() => _MyScreen1State();
}

class _MyScreen1State extends State<MyScreen1> {

  int totalResultFound = 0;
  String searchCategory = "Medicine";
  String url = "https://images.unsplash.com/photo-1612531386530-97286d97c2d2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80";

  List<DoctorInfo> doctorInfoItems = [];

  _MyScreen1State() {

    for(int i=0; i<1; i++) {
      DoctorInfo ob = DoctorInfo(
          doctorName: "Mr. Doctor",
          doctorDegrees: "MBBS",
          doctorSpecialities: "General Physician, Pediatrics, Covid unit, Internal Medicine, ENT, Gastroliver Surgeon",
          doctorWorkingPlace: "Chittagong Medical College Hospital",
          doctorExperience: 3,
          doctorRating: 4.9,
          totalRatings: 3680,
          doctorFeePerConsultation: 126
      );
      doctorInfoItems.add(ob);
    }
    // print(doctorInfoItems.length);

  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: SafeArea(
            // child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 40,
                      ),

                      Expanded(
                        child: Column(
                          children: const [
                            Text(
                              "Search a doctor",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'RobotoMono',
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                      ),


                      Container(
                        width: 40,
                        // color: Colors.green,
                        child: const CircleAvatar(
                          backgroundColor: Colors.orange,
                          radius: 17,
                          child: Center(
                            child: Text(
                              "I",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'RobotoMono',
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                  const SizedBox(height: 30),

                  searchFieldWidget(),

                  const SizedBox(height: 20),
                  Container(
                    height: 60,
                    color: const Color.fromRGBO(238, 244, 255, 1.0),
                    // color: Colors.yellow,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 12,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                      text: '',  // default text
                                      style: TextStyle(color: Colors.black),  // default color
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: "$totalResultFound doctors found in",
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'RobotoMono',
                                            fontWeight: FontWeight.w300,
                                            fontSize: 16,
                                          ),
                                        ),
                                        TextSpan(
                                          text: " $searchCategory",
                                          style: const TextStyle(
                                            color: Colors.deepPurple,
                                            fontFamily: 'RobotoMono',
                                            fontWeight: FontWeight.w300,
                                            fontSize: 16,
                                          ),
                                        ),

                                      ]
                                  ),
                                ),

                              ],
                            ),
                          ),
                          const Expanded(
                            child: SizedBox(height: 1,),
                          ),

                          Expanded(
                            child: Column(
                              children: [
                                Material(
                                  color: Colors.transparent,
                                  child: Ink(
                                    // width: 50,
                                    // height: 50,
                                    decoration: const BoxDecoration(
                                      // gradient: LinearGradient(
                                      //   begin: Alignment.centerLeft,
                                      //   end: Alignment.centerRight,
                                      //   colors: [Colors.yellow, Colors.green],
                                      // ),
                                      shape: BoxShape.circle,
                                    ), // LinearGradientBoxDecoration
                                    child: InkWell(
                                      onTap: () {
                                        print("filter");
                                      },
                                      customBorder: CircleBorder(),
                                      child: const ImageIcon(
                                        AssetImage("assets/images/filter_icon.png"),
                                        // color: Color(0xFF3A5A98),
                                        size: 22,
                                        color: Colors.black54,
                                      ),
                                      splashColor: Colors.black12,
                                    ), // Red will correctly spread over gradient
                                  ),
                                ),

                              ],
                            ),
                          ),
                          const SizedBox(width: 30,),
                          Expanded(
                            child: Column(
                              children: [
                                Material(
                                  color: Colors.transparent,
                                  child: Ink(
                                    // width: 50,
                                    // height: 50,
                                    decoration: const BoxDecoration(
                                      // gradient: LinearGradient(
                                      //   begin: Alignment.centerLeft,
                                      //   end: Alignment.centerRight,
                                      //   colors: [Colors.yellow, Colors.green],
                                      // ),
                                      shape: BoxShape.circle,
                                    ), // LinearGradientBoxDecoration
                                    child: InkWell(
                                      onTap: () {
                                        print("sort");
                                      },
                                      customBorder: CircleBorder(),
                                      child: const ImageIcon(
                                        AssetImage("assets/images/sort_icon.png"),
                                        // color: Color(0xFF3A5A98),
                                        size: 22,
                                        color: Colors.black54,
                                      ),
                                      splashColor: Colors.black12,
                                    ), // Red will correctly spread over gradient
                                  ),
                                ),

                              ],
                            ),
                          ),
                          const SizedBox(width: 10,),

                        ],
                      ),
                    ),
                  ),

                  // cards holder

				  /* widgets expanded upto bottom - way 1 best way*/
				  Expanded(
				    child: ListView.separated(
				  	  scrollDirection: Axis.vertical,
					  itemBuilder: (BuildContext context, int index)=>doctorInfoCard(doctorInfoItems[index], context),
					  separatorBuilder: (BuildContext context, int index) =>const SizedBox(height: 10,),
					  itemCount: doctorInfoItems.length,
				    ),
				  ),
				  
				  /* widgets expanded upto bottom - way 2*/
                  // Expanded(
                  //   child: Container(
                  //     color: const Color.fromRGBO(238, 244, 255, 1.0),
                  //     child: SingleChildScrollView(
                  //       child: Column(
                  //         children: [
                  //           doctorInfoCard(doctorInfoItems[0]),
                  //           doctorInfoCard(doctorInfoItems[0]),
                  //           doctorInfoCard(doctorInfoItems[0]),
                  //           // doctorInfoCard(doctorInfoItems[0]),
				  // 
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),


                ],
              ),

            ),
            // ),  // single child scrollview
          ),
        ),
      ],
    );
  }
}


Widget searchFieldWidget() {
  return Padding(
    padding: EdgeInsets.only(left: 10, right: 10),
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(
          //color: Colors.grey.withOpacity(0.5),
          color: Colors.white,
          width: 0.00,
        ),
        borderRadius: BorderRadius.circular(25.0),
        color: const Color.fromRGBO(230, 230, 230, 1.0),
        // color: Colors.black12,
      ),
      // margin: EdgeInsets.all(10),
      height: 50,
      child: Row(
        children: const <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Icon(
              Icons.search,
              color: Colors.grey,
              size: 25,
            ),
          ),
          Expanded(
            child: TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText:
                '  Search by doctor\'s name/code',
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

        ],
      ),
    ),
  );
}


Widget doctorInfoCard(DoctorInfo item) {
  return Padding(
    padding: EdgeInsets.only(left: 15, right: 15),
    child: Container(
      height: 230,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: Colors.black12, width: 2),
        ),
        // color: Colors.yellow,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 12,
              child: Padding(
                padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 5),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 29.0,
                            backgroundColor: Colors.white,
                            child: AspectRatio(
                              aspectRatio: 1 / 1,
                              child: ClipRRect(
                                child: Image.network(
                                  "https://images.unsplash.com/photo-1612531386530-97286d97c2d2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(40.0),
                              ),
                            ),

                          ),
                          const SizedBox(height: 10,),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Text(
                                item.doctorSpecialities,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                    const SizedBox(width: 5,),
                    // Column( // checker column
                    //   children: [
                    //     Text(".\n.\n.\n.\n", style: TextStyle(color: Colors.red, fontSize:20),),
                    //   ],
                    // ),
                    Expanded(
                      flex: 9,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.doctorName,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(height: 3,),
                          Text(
                            item.doctorDegrees,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black87,
                              // fontWeight: FontWeight.w200,
                            ),
                          ),
                          const SizedBox(height: 10,),
                          Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.doctorExperience.toString()+"+ years",
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    const SizedBox(height: 6,),
                                    const Text(
                                      "Total Experience",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black38,
                                      ),
                                    ),

                                  ],
                                ),
                              ),

                              Container(
                                width: 10,
                                height: 26,
                                child: const DottedLine(
                                  direction: Axis.vertical,
                                  lineLength: double.infinity,
                                  lineThickness: 2.0,
                                  dashLength: 2.0,
                                  dashColor: Colors.black38,
                                  // dashGradient: [Colors.red, Colors.blue],
                                  dashRadius: 0.0,
                                  dashGapLength: 2.0,
                                  dashGapColor: Colors.transparent,
                                  // dashGapGradient: [Colors.red, Colors.blue],
                                  dashGapRadius: 0.0,
                                ),
                              ),

                              Expanded(
                                flex: 5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              RatingBarIndicator(
                                                rating: item.doctorRating,
                                                itemBuilder: (context, index) => const Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                ),
                                                itemCount: 5,
                                                itemSize: 15.0,
                                                direction: Axis.horizontal,
                                              ),

                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              RichText(
                                                text: TextSpan(
                                                    text: '',  // default text
                                                    style: TextStyle(color: Colors.black),  // default color
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                        text: item.doctorRating.toString(),
                                                        style: const TextStyle(
                                                          color: Colors.black,
                                                          fontFamily: 'RobotoMono',
                                                          fontWeight: FontWeight.w800,
                                                          fontSize: 15,
                                                        ),
                                                      ),
                                                      const TextSpan(
                                                        text: "/5",
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
                                        ),

                                      ],
                                    ),

                                    Text(
                                      "Total rating ("+item.totalRatings.toString()+ ")",
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.black38,
                                      ),
                                    ),

                                  ],
                                ),
                              ),

                            ],
                          ),
                          const SizedBox(height: 15,),
                          Text(
                            item.doctorWorkingPlace,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(height: 3,),
                          const Text(
                            "Working in",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black38,
                            ),
                          ),

                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),

            // Divider(
            //   thickness: 2,
            // ),

            const Padding(
              padding: EdgeInsets.only(left: 2, right: 2),
              child: DottedLine(
                direction: Axis.horizontal,
                lineLength: double.infinity,
                lineThickness: 1.0,
                dashLength: 4.0,
                dashColor: Colors.black26,
                // dashGradient: [Colors.red, Colors.blue],
                dashRadius: 0.0,
                dashGapLength: 2.0,
                dashGapColor: Colors.transparent,
                // dashGapGradient: [Colors.red, Colors.blue],
                dashGapRadius: 0.0,
              ),
            ),

            Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 0),
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 8,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: RichText(
                              text: TextSpan(
                                  text: '',  // default text
                                  style: TextStyle(color: Colors.black),  // default color
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: "\$"+item.doctorFeePerConsultation.toString(),
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'RobotoMono',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const TextSpan(
                                      text: " (Incl. VAT) per consultation",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontFamily: 'RobotoMono',
                                        fontWeight: FontWeight.w300,
                                        fontSize: 14,
                                      ),
                                    ),

                                  ]
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                                color: Colors.pinkAccent,
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.arrow_forward,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              ),

                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    ),
  );
}


/*
CircleAvatar(
  radius: 35.0,
  backgroundColor: Colors.white,
  child: AspectRatio(
    aspectRatio: 1 / 1,
    child: ClipRRect(
      child: Image.network(
        url,
        fit: BoxFit.cover,
      ),
      borderRadius: BorderRadius.circular(40.0),
    ),
  ),

)
* */