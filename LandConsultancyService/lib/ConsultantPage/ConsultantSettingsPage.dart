import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:landconsultancy/CitizenPage/ChangePasswordPage.dart';
import 'package:landconsultancy/CitizenPage/LogoutAction.dart';
import 'package:landconsultancy/CommonWidget/FaqPage.dart';
import 'package:landconsultancy/CommonWidget/PrivacyPolicyPage.dart';

class ConsultantSettingsPage extends StatefulWidget{
  @override
  _ConsultantSettingsPageState createState() => _ConsultantSettingsPageState();
}

class _ConsultantSettingsPageState extends State<ConsultantSettingsPage> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
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
              onPressed: () => {
                myProfile()
              },
              style: ButtonStyle(
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
            ),
            ElevatedButton(
              onPressed: () => {
                changePassword()
              },
              style: ButtonStyle(
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
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
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
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
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
            ),
            ElevatedButton(
              onPressed:  () => {
                termsAndConditions()
              },
              style: ButtonStyle(
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
            ),
            ElevatedButton(
              onPressed:  () => {
                aboutUs()
              },
              style: ButtonStyle(
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
            ),
            ElevatedButton(
              onPressed:  () => {
                contactus()
              },
              style: ButtonStyle(
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
            ),
            ElevatedButton(
              onPressed:  () => {
                faq()
              },
              style: ButtonStyle(
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
            ),
            Visibility(
              visible: false,
              child: ElevatedButton(
                onPressed: () => {
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
  }

  changePassword(){
    print("change password");
    Navigator.push(context,
        MaterialPageRoute(
            builder: (BuildContext context)=> ChangePasswordPage()));
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