import 'package:flutter/material.dart';
import 'package:landconsultancy/LandingPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogoutAction extends StatefulWidget {
  const LogoutAction({Key? key}) : super(key: key);

  @override
  _LogoutActionState createState() => _LogoutActionState();
}

class _LogoutActionState extends State<LogoutAction> {

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Stack(
          alignment: Alignment.center,
          children: [
            const Icon(
              Icons.logout,
            ),
          ],
        ),
        onPressed: () => {
          showAlertDialog(context)
        }
      /*_pushScreen(
        context: context,
        screen: const CartScreen(),
      ),*/
    );
  }

  showAlertDialog(BuildContext context) {

    /*Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed:  () {
        Navigator.of(context).pop();
      },
    );*/
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        setState(() async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setBool('isLoggedIn', false);
          /*putInStorage(Keys.USER_ID, "");
          putInStorage(Keys.USER_NAME, "");
          putInStorage(Keys.EMAIL, "");
          putInStorage(Keys.ROLE_ID, "");
          setToken(Keys.TOKEN, "");*/
          Navigator.of(context).pop();
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => LandingPage()), (route) => false,);

        });

      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Alert!"),
      content: Text("Are you sure want to logout?"),
      actions: [
//        cancelButton,
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}