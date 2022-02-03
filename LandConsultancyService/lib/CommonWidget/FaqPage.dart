import 'package:flutter/material.dart';

class FaqPage extends StatefulWidget{
  @override
  _FaqPageState createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("এফএকিউ", textAlign: TextAlign.center,),
      ),
      body: new ListView.builder(
        itemCount: vehicles.length,
        itemBuilder: (context, i) {
          return Card(
            elevation: 5,
            child: new ExpansionTile(
              title: new Text(vehicles[i].title, style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
              children: <Widget>[
                new Column(
                  children: _buildExpandableContent(vehicles[i]),
                ),
              ],
            )
          );
        },
      ),
    );
  }

  _buildExpandableContent(Vehicle vehicle) {
    List<Widget> columnContent = [];

    columnContent.add(
      new ListTile(
        title: new Text(vehicle.body, textAlign: TextAlign.justify, style: new TextStyle(fontSize: 15.0),),
//        leading: new Icon(vehicle.icon),
      ),
    );

    /*for (String content in vehicle.body)
      columnContent.add(
        new ListTile(
          title: new Text(content, style: new TextStyle(fontSize: 18.0),),
          leading: new Icon(vehicle.icon),
        ),
      );*/

    return columnContent;
  }
}

class Vehicle {
  final String title;
  final String body;
  final IconData icon;

  Vehicle(this.title, this.body, this.icon);
}

List<Vehicle> vehicles = [
  new Vehicle(
    'এই  অ্যাপটি কারা ব্যবহার করতে পারবেন?',
    'যেকেউ এই এপ্লিকেশনটি ব্যবহার করতে পারবেন',
    Icons.motorcycle,
  ),
  new Vehicle(
    'এটা কি ফ্রি রেজিস্ট্রেশন করা যায়? ',
    'হ্যাঁ, এটা ফ্রি রেজিস্ট্রেশন করা যায়',
    Icons.directions_car,
  ),
  new Vehicle(
    'এই সিস্টেমে রেজিস্ট্রেশন ফি কত? ',
    'এখানে রেজিস্ট্রেশন সম্পূর্ণ ফ্রি',
    Icons.motorcycle,
  ),
  new Vehicle(
    'এখানে সেবা নিতে গেলে কত টাকা জমা দিতে হবে?',
    'এখানে সামান্য খরচে খুব যত্ন সহকারে সেবা প্রদান করা হয়. এখানে সামান্য খরচে খুব যত্ন সহকারে সেবা প্রদান করা হয়.  এখানে সামান্য খরচে খুব যত্ন সহকারে সেবা প্রদান করা হয়. এখানে সামান্য খরচে খুব যত্ন সহকারে সেবা প্রদান করা হয়.  ',
    Icons.motorcycle,
  ),
];




/*
new Vehicle(
'Cars',
['Vehicle no. 3', 'Vehicle no. 4', 'Vehicle no. 6'],
Icons.directions_car,
),*/

/*class Vehicle {
  final String title;
  List<String> contents = [];
  final IconData icon;

  Vehicle(this.title, this.contents, this.icon);
}*/
