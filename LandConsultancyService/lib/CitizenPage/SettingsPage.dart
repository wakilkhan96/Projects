import 'package:flutter/material.dart';
import 'package:landconsultancy/CitizenPage/ChangePasswordPage.dart';
import 'package:landconsultancy/CitizenPage/LogoutAction.dart';
import 'package:landconsultancy/CommonWidget/FaqPage.dart';
import 'package:landconsultancy/CommonWidget/PrivacyPolicyPage.dart';

class SettingsPage extends StatefulWidget {

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      /*appBar: AppBar(
        title: Text("Setting"),
        actions: [
          LogoutAction(),
        ],
      ),*/
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
//              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(top: 20, bottom: 20, left: 15),
                    color: Color(0xffEBEDEF),
                    child: Text('My Account', textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xff566573)),),
                  ),
                ),

              ],
            ),
            ElevatedButton(
//              color: Color(0xffEBEDEF),
              onPressed: () => {
                myProfile()
              },
              style: ButtonStyle(
//                backgroundColor: MaterialStateProperty.all<Color>(color),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('My Profile', textAlign: TextAlign.center, style: TextStyle(fontSize: 14, color: Color(0xff000000)),),
                  Icon(
                    Icons.person,
                    color: Color(0xff000000),
                  )
                ],
              ),

              /*Container(
                alignment: Alignment.centerLeft,
//                padding: EdgeInsets.only(top: 10, bottom: 10),
//                color: Color(0xffEBEDEF),
                child: Text('My Profile', textAlign: TextAlign.center, style: TextStyle(fontSize: 14, color: Color(0xff000000)),),
              ),*/
            ),
            ElevatedButton(
              onPressed: () => {
                changePassword()
              },
              style: ButtonStyle(
//                backgroundColor: MaterialStateProperty.all<Color>(color),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Change Password', textAlign: TextAlign.center, style: TextStyle(fontSize: 14, color: Color(0xff000000)),),
                  Icon(
                    Icons.password,
                    color: Color(0xff000000),
                  )
                ],
              ),

              /* Container(
                alignment: Alignment.centerLeft,
//                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Text('Change Password', textAlign: TextAlign.center, style: TextStyle(fontSize: 14, color: Color(0xff000000)),),
              ),*/
            ),
            ElevatedButton(
              onPressed:  () => {
                favouriteConsultant()
              },
              style: ButtonStyle(
//                backgroundColor: MaterialStateProperty.all<Color>(color),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Favourite Consultant', textAlign: TextAlign.center, style: TextStyle(fontSize: 14, color: Color(0xff000000)),),
                  Icon(
                    Icons.favorite_rounded,
                    color: Color(0xff000000),
                  )
                ],
              ),

              /*Container(
                color: Colors.white,
                alignment: Alignment.centerLeft,
//                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Text('Favourite Consultant', textAlign: TextAlign.center, style: TextStyle(fontSize: 14, color: Color(0xff000000)),),
              ),*/
            ),
            /*ElevatedButton.icon(
              label: Text('FlutterCorner.com', textAlign: TextAlign.right,),
              icon: Icon(Icons.person),
              onPressed: () {
                print('Button Pressed');
              },
            ),*/
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
//              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(top: 20, bottom: 20, left: 15),
                    color: Color(0xffEBEDEF),
                    child: Text('Payments', textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xff566573)),),
                  ),
                ),

              ],
            ),
            ElevatedButton(
              onPressed:  () => {
                paymentHistory()
              },
              style: ButtonStyle(
//                backgroundColor: MaterialStateProperty.all<Color>(color),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Payment History', textAlign: TextAlign.center, style: TextStyle(fontSize: 14, color: Color(0xff000000)),),
                  Icon(
                    Icons.payment,
                    color: Color(0xff000000),
                  )
                ],
              ),

              /*Container(
                color: Colors.white,
                alignment: Alignment.centerLeft,
//                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Text('Payment History', textAlign: TextAlign.center, style: TextStyle(fontSize: 14, color: Color(0xff000000)),),
              ),*/
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
//              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(top: 20, bottom: 20, left: 15),
                    color: Color(0xffEBEDEF),
                    child: Text('Leagals & Support', textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xff566573)),),
                  ),
                ),

              ],
            ),
            ElevatedButton(
              onPressed:  () => {
                privacyPolicy()
              },
              style: ButtonStyle(
//                backgroundColor: MaterialStateProperty.all<Color>(color),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Privacy Policy', textAlign: TextAlign.center, style: TextStyle(fontSize: 14, color: Color(0xff000000)),),
                  Icon(
                    Icons.policy,
                    color: Color(0xff000000),
                  )
                ],
              ),

              /*Container(
                color: Colors.white,
                alignment: Alignment.centerLeft,
//                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Text('Privacy Policy', textAlign: TextAlign.center, style: TextStyle(fontSize: 14, color: Color(0xff000000)),),
              ),*/
            ),
            ElevatedButton(
              onPressed:  () => {
                termsAndConditions()
              },
              style: ButtonStyle(
//                backgroundColor: MaterialStateProperty.all<Color>(color),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('শর্তসমূহ', textAlign: TextAlign.center, style: TextStyle(fontSize: 14, color: Color(0xff000000)),),
                  Icon(
                    Icons.rule_sharp,
                    color: Color(0xff000000),
                  )
                ],
              ),

              /*Container(
                color: Colors.white,
                alignment: Alignment.centerLeft,
//                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Text('Terrms & Conditions', textAlign: TextAlign.center, style: TextStyle(fontSize: 14, color: Color(0xff000000)),),
              ),*/
            ),
            ElevatedButton(
              onPressed:  () => {
                aboutUs()
              },
              style: ButtonStyle(
//                backgroundColor: MaterialStateProperty.all<Color>(color),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('আমাদের সম্পর্কে', textAlign: TextAlign.center, style: TextStyle(fontSize: 14, color: Color(0xff000000)),),
                  Icon(
                    Icons.info,
                    color: Color(0xff000000),
                  )
                ],
              ),

              /*Container(
                color: Colors.white,
                alignment: Alignment.centerLeft,
//                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Text('About Us', textAlign: TextAlign.center, style: TextStyle(fontSize: 14, color: Color(0xff000000)),),
              ),*/
            ),
            ElevatedButton(
              onPressed:  () => {
                contactus()
              },
              style: ButtonStyle(
//                backgroundColor: MaterialStateProperty.all<Color>(color),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('যোগাযোগ', textAlign: TextAlign.center, style: TextStyle(fontSize: 14, color: Color(0xff000000)),),
                  Icon(
                    Icons.contact_page,
                    color: Color(0xff000000),
                  )
                ],
              ),

              /*Container(
                color: Colors.white,
                alignment: Alignment.centerLeft,
//                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Text('Contact Us', textAlign: TextAlign.center, style: TextStyle(fontSize: 14, color: Color(0xff000000)),),
              ),*/
            ),
            ElevatedButton(
              onPressed:  () => {
                faq()
              },
              style: ButtonStyle(
//                backgroundColor: MaterialStateProperty.all<Color>(color),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('এফএকিউ', textAlign: TextAlign.center, style: TextStyle(fontSize: 14, color: Color(0xff000000)),),
                  Icon(
                    Icons.question_answer,
                    color: Color(0xff000000),
                  )
                ],
              ),

              /*Container(
                color: Colors.white,
                alignment: Alignment.centerLeft,
//                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Text('FAQ', textAlign: TextAlign.center, style: TextStyle(fontSize: 14, color: Color(0xff000000)),),
              ),*/
            ),
            Visibility(
              visible: false,
              child: ElevatedButton(
                onPressed: () => {
//                logout()
                  LogoutAction()
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Logout', textAlign: TextAlign.center, style: TextStyle(fontSize: 14, color: Color(0xff000000)),),
                    Icon(
                      Icons.logout,
                      color: Color(0xff000000),
                    )
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  myProfile(){
    print("my profile");
    /*Navigator.push(context,
        MaterialPageRoute(
            builder: (BuildContext context)=> ProfilePage()));*/
  }

  changePassword(){
    print("change password");
    Navigator.push(context,
        MaterialPageRoute(
            builder: (BuildContext context)=> ChangePasswordPage()));
  }

  favouriteConsultant(){
    print("favourite consultant");
    /*Navigator.push(context,
        MaterialPageRoute(
            builder: (BuildContext context)=> FavouriteUserListPage()));*/
  }

  paymentHistory(){
    print("payment History");
  }

  termsAndConditions(){
    print("শর্তসমূহ");
  }

  privacyPolicy(){
    print("Privacy Policy");

    Navigator.push(context,
        MaterialPageRoute(
            builder: (BuildContext context)=> PrivacyPolicyPage()));
  }

  aboutUs(){
    print("আমাদের সম্পর্কে");
    /*Navigator.push(context,
        MaterialPageRoute(
            builder: (BuildContext context)=> AboutUsPage()));*/
  }

  contactus(){
    print("যোগাযোগ");
  }

  faq(){
    print("এফএকিউ");
    Navigator.push(context,
        MaterialPageRoute(
            builder: (BuildContext context)=> FaqPage()));
  }
}