import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:landconsultancy/CitizenPage/CitizenLoginPage.dart';
import 'package:landconsultancy/CommonWidget/FormButton.dart';
import 'package:landconsultancy/ConsultantPage/ConsultantLoginPage.dart';

class OTPVerificationPage extends StatefulWidget{
  final String otp;
  final String pageFlag;
//  OTPVerificationPage(Key key, this.otp) : super(key: key);
  OTPVerificationPage(this.otp, this.pageFlag);
  @override
  _OTPVerificationPageState createState() => _OTPVerificationPageState(this.otp, this.pageFlag);
}

class _OTPVerificationPageState extends State<OTPVerificationPage> {
  String obtainedOtp;
  String pageFlag;
  String _otp = "";
  _OTPVerificationPageState(this.obtainedOtp, this.pageFlag);
  var _otpSymbols = ["\u{25CB}","\u{25CB}","\u{25CB}","\u{25CB}","\u{25CB}","\u{25CB}"];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState(){
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
  }

  void _handleKeypadClick(String val) {
    setState(() {
      if (_otp.length < 6){
        _otp = _otp + val;
        for (int i=0; i < _otp.length; i++)
          _otpSymbols[i] = "\u{25CF}";
      }
    });
  }

  void _handleKeypadDel() {
    setState(() {
      if (_otp.length > 0) {
        _otp = _otp.substring(0,_otp.length - 1);
        for (int i = _otp.length; i < 6; i++)
          _otpSymbols[i] = "\u{25CB}";
      }
    });
  }

  void _handleSubmit() {
    if (_otp.length == 6) {

      if(_otp != obtainedOtp){
        _scaffoldKey.currentState!.showSnackBar(SnackBar(
          content: Text('OTP does not match'),
          backgroundColor: Colors.red,
        ));
      }else{
        _scaffoldKey.currentState!.showSnackBar(SnackBar(
          content: Text('Entered OTP is $_otp'),
        ));

        if(pageFlag == "1"){
          Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute( builder: (_) => const CitizenLoginPage(),), (route) => false,);
        }else if(pageFlag == "2"){
          Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute( builder: (_) => const ConsultantLoginPage(),), (route) => false,);
        }

      }

//    }else if(_otp != obtainedOtp){

    }else {
      _scaffoldKey.currentState!.showSnackBar(SnackBar(
        content: Text('OTP has to be of 6 digits'),
        backgroundColor: Colors.red,
      ));
    }
  }



  @override
  dispose(){
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("OTP Verification"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
//          crossAxisAlignment: CrossAxisAlignment.baseline,
          children: <Widget>[
            Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
//                  SizedBox(height: 100,),
                  Container(
                      margin: const EdgeInsets.only(top: 30),
                      child: Text(
                        'Enter the OTP received',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w400),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      SizedBox(width: 25,),
                      Text(
                        _otpSymbols[0],
                        style: TextStyle(
                            fontSize: 60, fontWeight: FontWeight.w200),
                      ),
                      Text(
                        _otpSymbols[1],
                        style: TextStyle(
                            fontSize: 60, fontWeight: FontWeight.w200),
                      ),
                      Text(
                        _otpSymbols[2],
                        style: TextStyle(
                            fontSize: 60, fontWeight: FontWeight.w200),
                      ),
                      Text(
                        _otpSymbols[3],
                        style: TextStyle(
                            fontSize: 60, fontWeight: FontWeight.w200),
                      ),
                      Text(
                        _otpSymbols[4],
                        style: TextStyle(
                            fontSize: 60, fontWeight: FontWeight.w200),
                      ),
                      Text(
                        _otpSymbols[5],
                        style: TextStyle(
                            fontSize: 60, fontWeight: FontWeight.w200),
                      ),
                      SizedBox(width: 25,)
                    ],
                  )
                ]
            ),
            Container(
              color: Colors.blue[50],
              padding: EdgeInsets.only(top: 10),
              child: Column(

                  children: <Widget>[
                    Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: Text(
                          _otp,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w400),
                        )),
                    SizedBox(height: 15,),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          FlatButton(
                            onPressed: () {
                              _handleKeypadClick('1');
                            },
                            child: Text('1',
                                style: TextStyle(
                                    fontSize: 40,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400)),
                          ),
                          FlatButton(
                            onPressed: () {
                              _handleKeypadClick('2');
                            },
                            child: Text('2',
                                style: TextStyle(
                                    fontSize: 40,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400)),
                          ),
                          FlatButton(
                            onPressed: () {
                              _handleKeypadClick('3');
                            },
                            child: Text('3',
                                style: TextStyle(
                                    fontSize: 40,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400)),
                          )
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          FlatButton(
                            onPressed: () {
                              _handleKeypadClick('4');
                            },
                            child: Text('4',
                                style: TextStyle(
                                    fontSize: 40,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400)),
                          ),
                          FlatButton(
                            onPressed: () {
                              _handleKeypadClick('5');
                            },
                            child: Text('5',
                                style: TextStyle(
                                    fontSize: 40,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400)),
                          ),
                          FlatButton(
                            onPressed: () {
                              _handleKeypadClick('6');
                            },
                            child: Text('6',
                                style: TextStyle(
                                    fontSize: 40,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400)),
                          )
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          FlatButton(
                            onPressed: () {
                              _handleKeypadClick('7');
                            },
                            child: Text('7',
                                style: TextStyle(
                                    fontSize: 40,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400)),
                          ),
                          FlatButton(
                            onPressed: () {
                              _handleKeypadClick('8');
                            },
                            child: Text('8',
                                style: TextStyle(
                                    fontSize: 40,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400)),
                          ),
                          FlatButton(
                            onPressed: () {
                              _handleKeypadClick('9');
                            },
                            child: Text('9',
                                style: TextStyle(
                                    fontSize: 40,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400)),
                          )
                        ]),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            FlatButton(
                              onPressed: () {
                                _handleKeypadDel();
                              },
                              child: Text('\u{232b}',
                                  style: TextStyle(
                                      fontSize: 40,
                                      color: Colors.red,
                                      fontWeight: FontWeight.w400)),
                            ),
                            FlatButton(
                              onPressed: () {
                                _handleKeypadClick('0');
                              },
                              child: Text('0',
                                  style: TextStyle(
                                      fontSize: 40,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400)),
                            ),
                            FlatButton(
                              onPressed: () {
                                _handleSubmit();
                              },
                              child: Text('\u{2713}',
                                  style: TextStyle(
                                      fontSize: 40,
                                      color: Colors.green,
                                      fontWeight: FontWeight.w400)),
                            )
                          ]),
                    ),
                    SizedBox(height: 30,)
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
