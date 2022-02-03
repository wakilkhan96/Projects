import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:time_range/time_range.dart';
import 'package:landconsultancy/CitizenPage/CitizenDashboardTab.dart';
import 'package:landconsultancy/utils/constants.dart';
import 'package:landconsultancy/CitizenPage/CitizenDashboardPage.dart';
import 'package:landconsultancy/utils/custom_date_time_utility.dart';
import 'package:landconsultancy/CitizenPage/PaymentPage.dart';

class ConsultantProfileDetailsPage extends StatefulWidget {
  final ConsultantInfo consultantInfo;
  ConsultantProfileDetailsPage({required this.consultantInfo});
  @override
  _ConsultantProfileDetailsPageState createState() =>
      _ConsultantProfileDetailsPageState(consultantInfo: consultantInfo);
}

class _ConsultantProfileDetailsPageState
    extends State<ConsultantProfileDetailsPage> {
  ConsultantInfo consultantInfo;
  _ConsultantProfileDetailsPageState({required this.consultantInfo});

  String _currentItemSelected = "Jan";

  CustomDateTimeUtility dateTimeUtility = CustomDateTimeUtility();
  int selectedDayValue = 1;
  String selectedMonthValue = "Jan";
  int selectedYearValue = 2000;

  final _defaultTimeRange = TimeRangeResult(
    TimeOfDay(hour: 14, minute: 50),
    TimeOfDay(hour: 15, minute: 20),
  );
  TimeRangeResult? _timeRange;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Scaffold(
//        resizeToAvoidBottomPadding: false,
          appBar: AppBar(
            title: Text("Consultant Details"),
          ),

          body: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Container(
                    color: Colors.white,
                    // color: Colors.yellow,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                            flex: 2,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 4,
                                ),
                                Container(
                                  width: 110,
                                  child: Stack(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Colors.grey,
                                        radius: 55,
                                        child: CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              consultantInfo.urlImage),
                                          radius: 52,
                                        ),
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
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color: Colors.black12,
                                                  width: 1),
                                            ),
                                            child: Center(
                                              child: InkWell(
                                                onTap: () {
                                                  citizenActiveness == true
                                                      ? print("Offline Now")
                                                      : print("Online Now");
                                                  setState(() {
                                                    citizenActiveness =
                                                        !citizenActiveness;
                                                  });
                                                },
                                                child: Container(
                                                  height: 14,
                                                  width: 14,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        (citizenActiveness == true
                                                            ? Colors.green
                                                            : Colors.blueGrey),
                                                    borderRadius:
                                                        BorderRadius.circular(10),
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
                              ],
                            )),
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
                                    Text(
                                      "Consultation Fee",
                                      style: TextStyle(
                                        color: Colors.blue,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          // "\$250",
                                          "\$" +
                                              ((consultantInfo.consultantFeePerConsultation *
                                                          (100 -
                                                              consultantInfo
                                                                  .currentOffPercentagePerConsultation)) /
                                                      100)
                                                  .toString(),
                                          style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                          "(incl. VAT)",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    if(consultantInfo.currentOffPercentagePerConsultation != 0 ) Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "before",
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                          "\$" +
                                              consultantInfo
                                                  .consultantFeePerConsultation
                                                  .toString(),
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              decoration:
                                                  TextDecoration.lineThrough),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 9,
                child: Card(
                  // color: Colors.green,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  // color: Colors.green,
                  child: Container(
                    // color: Colors.amberAccent,
                    child: Padding(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Expanded(
                          SizedBox(
                            height: 10,
                          ),
                          // ),

                          Text(
                            consultantInfo.consultantName,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(
                            height: 5,
                          ),
                          Text(consultantInfo.consultantDegrees),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Begum Rokeya University, Rangpur",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(
                            height: 15,
                          ),

                          Container(
                            // color: Colors.red,
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              // mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Total Experience",
                                        style: TextStyle(
                                            fontSize: 10, color: Colors.grey),
                                      ),
                                      Text(
                                        consultantInfo.consultantExperience
                                                .toString() +
                                            "+ years",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                                DottedLine(
                                  direction: Axis.vertical,
                                  lineLength: 40.0,
                                  lineThickness: 0.5,
                                  dashColor: Colors.grey,
                                  // dashGradient: [Colors.red, Colors.blue],
                                  dashRadius: 0.0,
                                  // dashGapLength: 4.0,
                                  // dashGapColor: Colors.transparent,
                                  // dashGapGradient: [Colors.red, Colors.blue],
                                  dashGapRadius: 0.0,
                                ),
                                Expanded(
                                  flex: 6,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Total Ratings (" +
                                            consultantInfo.totalRatings
                                                .toString() +
                                            ")",
                                        style: TextStyle(
                                            fontSize: 10, color: Colors.grey),
                                      ),
                                      //                                  Text("4+ years", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          RatingBar.builder(
                                            initialRating:
                                                consultantInfo.consultantRating,
                                            minRating: 1,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            unratedColor:
                                                Colors.amber.withAlpha(50),
                                            itemCount: 5,
                                            itemSize: 15.0,
                                            itemPadding: EdgeInsets.symmetric(
                                                horizontal: 1.0),
                                            itemBuilder: (context, _) => Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            updateOnDrag: false,
                                            onRatingUpdate: (double value) {},
                                            ignoreGestures: true,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            consultantInfo.consultantRating
                                                .toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                DottedLine(
                                  direction: Axis.vertical,
                                  lineLength: 40.0,
                                  lineThickness: 0.5,
                                  dashColor: Colors.grey,
                                  dashRadius: 0.0,
                                  dashGapRadius: 0.0,
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Emp ID",
                                        style: TextStyle(
                                            fontSize: 10, color: Colors.grey),
                                      ),
                                      Text(
                                        "48506",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: SizedBox(
                                    height: 1,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(
                            height: 10,
                          ),

                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Working in",
                                    style: TextStyle(
                                        fontSize: 11, color: Colors.grey),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    consultantInfo.consultantWorkingPlace,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  SingleChildScrollView(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(
                                              left: 0, right: 0, bottom: 20),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "About Consultant",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(consultantInfo
                                                  .consultantName),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                consultantInfo
                                                    .consultantDegrees,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                consultantInfo
                                                    .consultantWorkingPlace,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                "t is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here',",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black),
                                                textAlign: TextAlign.justify,
                                              ),
                                              Text(
                                                "t is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here',",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black),
                                                textAlign: TextAlign.justify,
                                              ),
                                              Text(
                                                "t is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here',",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black),
                                                textAlign: TextAlign.justify,
                                              ),
                                              Text(
                                                "t is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here',",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black),
                                                textAlign: TextAlign.justify,
                                              ),

                                              SizedBox(height: 60,),

                                            ],
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
                ),
              ),
            ],
          ),
        ),

        Align(
          alignment: Alignment.bottomCenter,
          // child: OutlinedButton(
          //   onPressed: () {  },
          //   child: Text("Consult"),
          // ),
          child:  Padding(
            padding: EdgeInsets.all(7),
            child: Container(
              height: 45,
              width: 220,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.green,
                boxShadow: [
                  BoxShadow(
                      color: Color(0xFF233456),
                      offset: Offset.zero,
                      blurRadius: 3.0,
                      spreadRadius: 0.0,
                  ),
                ],
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () async {
                    print("consult_now");
                    showDialog(
                      context: context,
                      builder: (ctx) {

                        /* Default Date and Time setting*/

                        var today = DateTime.now();

                        int startDay = today.day;
                        String startMonth = dateTimeUtility.allMonthsShort[today.month-1];
                        int startYear = today.year;

                        selectedDayValue = startDay;
                        selectedMonthValue = startMonth;
                        selectedYearValue = startYear;



                        int startHour = today.hour;
                        int startMinute = today.minute;

                        int timeStep = 10;
                        int timeBlock = 30;

                        void nextNicerTime(int timeStep) {
                          startMinute = startMinute + (timeStep-(startMinute%timeStep));
                          if(startMinute==60) {
                            startHour++;
                            startMinute = 0;
                          }
                        }
                        nextNicerTime(timeStep);


                        void updateConsultationTime() {
                          if(selectedDayValue==today.day &&
                              selectedMonthValue==dateTimeUtility.allMonthsShort[today.month-1] &&
                              selectedYearValue == today.year) {
                            //
                            startHour = today.hour;
                            startMinute = today.minute;
                            nextNicerTime(timeStep);
                          }
                          else {
                            startHour = 10;
                            startMinute = 0;
                          }
                        }

                        /* Color setting*/
                        Color dayBoxFillColor = Colors.transparent;
                        Color monthBoxFillColor = Colors.transparent;
                        Color yearBoxFillColor = Colors.transparent;

                        bool checkBoxState = false;

                        Color getCheckBoxColorColor(Set<MaterialState> states) {
                          const Set<MaterialState> interactiveStates = <MaterialState>{
                            MaterialState.pressed,
                            MaterialState.hovered,
                            MaterialState.focused,
                          };
                          if (states.any(interactiveStates.contains)) {
                            return Colors.white;
                          }
                          return Colors.lightGreen;
                        }

                        return ScaffoldMessenger(
                          child: Scaffold(
                            backgroundColor: Colors.transparent,
                            body: StatefulBuilder(
                                builder: (context, setState) {

                                  return AlertDialog(
                                    contentPadding: EdgeInsets.only(left: 20, right: 20, top: 20),
                                    title: Text(
                                      'Pick a Date and Time slot',
                                      style: TextStyle(
                                        fontSize: 19,
                                        color: Colors.green,
                                      ),
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {

                                          Navigator.pop(context);
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 20, right: 20),
                                          child: Text('Cancel', style: TextStyle(fontSize: 17),
                                          ),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {

                                          String dateString = DateFormat('d-M-y').format(DateTime.now());
                                          // String timeString = DateFormat("HH:mm:ss").format(DateTime.now());
                                          String timeString = DateFormat("H-m").format(DateTime.now());
                                          // print(dateString);
                                          // print(timeString);

                                          if(_timeRange == null) {
                                            print("Please select time");

                                            final scaffold = ScaffoldMessenger.of(context);
                                            scaffold.showSnackBar(
                                              SnackBar(
                                                content: const Text('Please select date and time'),
                                                action: SnackBarAction(label: 'Hide', onPressed: scaffold.hideCurrentSnackBar),
                                              ),
                                            );

                                          }
                                          else if(checkBoxState==false) {
                                            print("Please tick the checkbox");

                                            final scaffold = ScaffoldMessenger.of(context);
                                            scaffold.showSnackBar(
                                              SnackBar(
                                                content: const Text('Please tick the checkbox'),
                                                action: SnackBarAction(label: 'Hide', onPressed: scaffold.hideCurrentSnackBar),
                                              ),
                                            );

                                          }
                                          else {
                                            print(
                                                selectedDayValue.toString()+" "+
                                                    selectedMonthValue.toString()+" "+
                                                    selectedYearValue.toString()
                                            );

                                            print(
                                                _timeRange!.start.format(context)+" "+
                                                    _timeRange!.end.format(context)
                                            );


                                            Navigator.pop(context);

                                            Navigator.push(context,
                                              MaterialPageRoute(builder: (context)=> PaymentPage(consultantInfo: consultantInfo,),
                                              ),
                                            );

                                          }
                                          // catch(ex) {
                                          //   print("Exception");
                                          // }



                                        },
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 20, right: 40),
                                          child: Text('Ok', style: TextStyle(fontSize: 17),
                                          ),
                                        ),
                                      ),

                                    ],
                                    content: Container(
                                      width: 300,
                                      height: 380,
                                      decoration: BoxDecoration(
                                        // color:  Colors.green,
                                        // borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [

                                            SizedBox(height: 15,),
                                            Text(
                                              'Choose Consultation Date',
                                              style: TextStyle(
                                                fontSize: 17.5,
                                                color: Colors.black87,
                                              ),
                                            ),
                                            SizedBox(height: 5,),
                                            SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    // width: 70,
                                                    height: 40,

                                                    padding: EdgeInsets.only(left: 15),
                                                    decoration: BoxDecoration(
                                                      color: dayBoxFillColor,
                                                      borderRadius: BorderRadius.circular(8),
                                                      border: Border.all(color: Colors.black12,),
                                                    ),
                                                    child: PopupMenuButton<int>(
                                                      // color: Colors.transparent,
                                                      itemBuilder: (context) {
                                                        return dateTimeUtility.allDays.map((val) {
                                                          return PopupMenuItem(
                                                            value: val,
                                                            child: Text(val.toString()),
                                                          );
                                                        }).toList();
                                                      },
                                                      child: Row(
                                                        mainAxisSize: MainAxisSize.min,
                                                        children: <Widget>[
                                                          Text(selectedDayValue.toString()),
                                                          Icon(Icons.arrow_drop_down),
                                                        ],
                                                      ),
                                                      onSelected: (value) {
                                                        setState(() {
                                                          dayBoxFillColor = Colors.lightGreen;
                                                          // print('!!!===== $value');
                                                          selectedDayValue = value;
                                                          updateConsultationTime();
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 8,
                                                  ),
                                                  Container(
                                                    // width: 125,
                                                    height: 40,

                                                    padding: EdgeInsets.only(left: 15),
                                                    decoration: BoxDecoration(
                                                      color: monthBoxFillColor,
                                                      borderRadius: BorderRadius.circular(8),
                                                      border: Border.all(color: Colors.black12,),
                                                    ),
                                                    child: PopupMenuButton<String>(
                                                      itemBuilder: (context) {
                                                        return dateTimeUtility.allMonthsShort.map((val) {
                                                          return PopupMenuItem(
                                                            value: val,
                                                            child: Text(val),
                                                          );
                                                        }).toList();
                                                      },
                                                      child: Row(
                                                        mainAxisSize: MainAxisSize.min,
                                                        children: <Widget>[
                                                          Text(selectedMonthValue),
                                                          Icon(Icons.arrow_drop_down),
                                                        ],
                                                      ),
                                                      onSelected: (value) {
                                                        setState(() {
                                                          monthBoxFillColor = Colors.lightGreen;
                                                          // print('!!!===== $value');
                                                          selectedMonthValue = value;
                                                          updateConsultationTime();
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 8,
                                                  ),
                                                  Container(
                                                    // width: 90,
                                                    height: 40,

                                                    padding: EdgeInsets.only(left: 15),
                                                    decoration: BoxDecoration(
                                                      color: yearBoxFillColor,
                                                      borderRadius: BorderRadius.circular(8),
                                                      border: Border.all(color: Colors.black12,),
                                                    ),
                                                    child: PopupMenuButton<int>(
                                                      itemBuilder: (context) {
                                                        return dateTimeUtility.allYears.map((val) {
                                                          return PopupMenuItem(
                                                            value: val,
                                                            child: Text(val.toString()),
                                                          );
                                                        }).toList();
                                                      },
                                                      child: Row(
                                                        mainAxisSize: MainAxisSize.min,
                                                        children: <Widget>[
                                                          Text(selectedYearValue.toString()),
                                                          Icon(Icons.arrow_drop_down),
                                                        ],
                                                      ),
                                                      onSelected: (value) {
                                                        setState(() {
                                                          yearBoxFillColor = Colors.lightGreen;
                                                          // print('!!!===== $value');
                                                          selectedYearValue = value;
                                                          updateConsultationTime();
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),


                                            SizedBox(height: 30,),
                                            Text(
                                              'Choose Consultation Time',
                                              style: TextStyle(
                                                fontSize: 17.5,
                                                color: Colors.black87,
                                              ),
                                            ),
                                            SizedBox(height: 5,),
                                            TimeRange(
                                                fromTitle: Text('From', style: TextStyle(fontSize: 16, color: Colors.grey),),
                                                toTitle: Text('To', style: TextStyle(fontSize: 16, color: Colors.grey),),
                                                titlePadding: 0,
                                                textStyle: TextStyle(fontWeight: FontWeight.normal, color: Colors.black87),
                                                activeTextStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                                                borderColor: Colors.black12,
                                                backgroundColor: Colors.transparent,
                                                activeBackgroundColor: Colors.lightGreen,
                                                firstTime: TimeOfDay(hour: startHour, minute: startMinute),
                                                lastTime: TimeOfDay(hour: 22, minute: 00),
                                                timeStep: timeStep,
                                                timeBlock: timeBlock,
                                                onRangeCompleted: (range) {
                                                  setState(() {
                                                    _timeRange = range;
                                                    // print('Selected Range: ${_timeRange!.start.format(context)} - ${_timeRange!.end.format(context)}');
                                                    // print(_timeRange!.start.format(context));
                                                    // print(_timeRange!.end.format(context));
                                                  });
                                                }
                                            ),

                                            SizedBox(height: 30),

                                            // if (_timeRange != null) Padding(
                                            //   padding: const EdgeInsets.only(top: 8.0, left: 0),
                                            //   child: Column(
                                            //     crossAxisAlignment: CrossAxisAlignment.start,
                                            //     children: <Widget>[
                                            //       Text(
                                            //         'Selected Range: ${_timeRange!.start.format(context)} - ${_timeRange!.end.format(context)}',
                                            //         style: TextStyle(fontSize: 16, color: Colors.green),
                                            //       ),
                                            //       SizedBox(height: 20),
                                            //
                                            //     ],
                                            //   ),
                                            // ),

                                            Row(
                                              children: [

                                                Column(
                                                  children: [
                                                    Checkbox(
                                                      checkColor: Colors.white,
                                                      fillColor: MaterialStateProperty.resolveWith(getCheckBoxColorColor),
                                                      value: checkBoxState,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          checkBoxState = value!;
                                                        });
                                                      },
                                                    ),
                                                  ],
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                        "I am agreed to book for a consultation",
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          color: Colors.black54,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),

                                              ],
                                            ),


                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }
                            ),


                          ),
                        );
                      },


                    );

                  },
                  child: Center(
                    child: Text(
                      "REQUEST NOW",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white70,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),

      ],
    );
  }
}



