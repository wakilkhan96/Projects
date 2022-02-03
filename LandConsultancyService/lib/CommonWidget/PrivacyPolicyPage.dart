import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Privacy Policy"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Privacy Policy for Mysoftheaven (BD) Ltd.", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.blue),),
                  SizedBox(height: 5,),
                  Text("At Mysoftheaven (BD) Ltd., accessible from http://mysoftheaven.com, one of our main priorities is the privacy of our visitors. This Privacy Policy document contains types of information that is collected and recorded by Mysoftheaven (BD) Ltd. and how we use it.",
                      style: TextStyle(fontSize: 12, color: Colors.black), textAlign: TextAlign.justify),
                  SizedBox(height: 5,),
                  Text("If you have additional questions or require more information about our Privacy Policy, do not hesitate to contact us through email at mysoftheaven@gmail.com",
                      style: TextStyle(fontSize: 12, color: Colors.black), textAlign: TextAlign.justify)
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Log Files", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.blue),),
                  SizedBox(height: 5,),
                  Text("Mysoftheaven (BD) Ltd. follows a standard procedure of using log files. These files log visitors when they visit websites. All hosting companies do this and a part of hosting services' analytics. The information collected by log files include internet protocol (IP) addresses, browser type, Internet Service Provider (ISP), date and time stamp, referring/exit pages, and possibly the number of clicks. These are not linked to any information that is personally identifiable. The purpose of the information is for analyzing trends, administering the site, tracking users' movement on the website, and gathering demographic information.",
                      style: TextStyle(fontSize: 12, color: Colors.black), textAlign: TextAlign.justify)
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Cookies and Web Beacons", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.blue),),
                  SizedBox(height: 5,),
                  Text("Like any other website, Mysoftheaven (BD) Ltd. uses 'cookies'. These cookies are used to store information including visitors' preferences, and the pages on the website that the visitor accessed or visited. The information is used to optimize the users' experience by customizing our web page content based on visitors' browser type and/or other information.",
                      style: TextStyle(fontSize: 12, color: Colors.black), textAlign: TextAlign.justify)
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Privacy Policies", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.blue),),
                  SizedBox(height: 5,),
                  Text("You may consult this list to find the Privacy Policy for each of the advertising partners of Mysoftheaven (BD) Ltd.",
                      style: TextStyle(fontSize: 12, color: Colors.black), textAlign: TextAlign.justify),
                  SizedBox(height: 5),
                  Text("Third-party ad servers or ad networks uses technologies like cookies, JavaScript, or Web Beacons that are used in their respective advertisements and links that appear on Mysoftheaven (BD) Ltd., which are sent directly to users' browser. They automatically receive your IP address when this occurs. These technologies are used to measure the effectiveness of their advertising campaigns and/or to personalize the advertising content that you see on websites that you visit.",
                      style: TextStyle(fontSize: 12, color: Colors.black), textAlign: TextAlign.justify),
                  SizedBox(height: 5),
                  Text("Note that Mysoftheaven (BD) Ltd. has no access to or control over these cookies that are used by third-party advertisers.",
                      style: TextStyle(fontSize: 12, color: Colors.black), textAlign: TextAlign.justify)
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Third Party Privacy Policies", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.blue),),
                  SizedBox(height: 5,),
                  Text("Mysoftheaven (BD) Ltd. does not apply to other advertisers or websites. Thus, we are advising you to consult the respective Privacy Policies of these third-party ad servers for more detailed information. It may include their practices and instructions about how to opt-out of certain options. You may find a complete list of these Privacy Policies and their links here: Privacy Policy Links.",
                      style: TextStyle(fontSize: 12, color: Colors.black), textAlign: TextAlign.justify),
                  SizedBox(height: 5,),
                  Text("You can choose to disable cookies through your individual browser options. To know more detailed information about cookie management with specific web browsers, it can be found at the browsers' respective websites. What Are Cookies?",
                      style: TextStyle(fontSize: 12, color: Colors.black), textAlign: TextAlign.justify)
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Children's Information", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.blue),),
                  SizedBox(height: 5,),
                  Text("Another part of our priority is adding protection for children while using the internet. We encourage parents and guardians to observe, participate in, and/or monitor and guide their online activity.",
                      style: TextStyle(fontSize: 12, color: Colors.black), textAlign: TextAlign.justify),
                  SizedBox(height: 5,),
                  Text("Mysoftheaven (BD) Ltd. does not knowingly collect any Personal Identifiable Information from children under the age of 13. If you think that your child provided this kind of information on our website, we strongly encourage you to contact us immediately and we will do our best efforts to promptly remove such information from our records.",
                      style: TextStyle(fontSize: 12, color: Colors.black), textAlign: TextAlign.justify)
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Online Privacy Policy Only", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.blue),),
                  SizedBox(height: 5,),
                  Text("This Privacy Policy applies only to our online activities and is valid for visitors to our website with regards to the information that they shared and/or collect in Mysoftheaven (BD) Ltd.. This policy is not applicable to any information collected offline or via channels other than this website.",
                      style: TextStyle(fontSize: 12, color: Colors.black), textAlign: TextAlign.justify),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Consent", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.blue),),
                  SizedBox(height: 5,),
                  Text("By using our website, you hereby consent to our Privacy Policy and agree to its Terms and Conditions.",
                      style: TextStyle(fontSize: 12, color: Colors.black), textAlign: TextAlign.justify),
                  SizedBox(height: 15,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}