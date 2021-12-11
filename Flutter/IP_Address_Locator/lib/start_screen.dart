import 'package:flutter/material.dart';
import 'package:flutter_test_project/result_screen.dart';
import 'package:http/http.dart';
import 'api_data.dart';
import 'result_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    //print('constructor');

    //getAPIData();

    super.initState();
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    //print('destructor');
    super.deactivate();
  }

  /// user defined methods and attributes
  TextEditingController textFieldController = TextEditingController(text: '182.185.160.93');
  String result = "Press button to get data.";
  String ip_address = "";

  void openResultPage() async {
    //var state = await Navigator.push(
    dynamic state = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) {
              return ResultsPage(result: result,);
            }
        )
    );
    print('Received Data [ $state ]');
    print('[Successfully returned to Parent Screen]');
    // if(state) {
    //   print('[Successfully returned to Parent Screen]');
    // }
  }
  void buttonPressed(int buttonNumber) async {
    //print(textFieldController.text);
    ip_address = textFieldController.text;
    bool flag = await getAPIData();

    if(buttonNumber==1) {
      print('[See Result inside this Page] Button Pressed');
    }
    else if(buttonNumber==2) {
      print('[See Result inside new Page] Button Pressed');
      openResultPage();
    }
  }
  void setResult(String res) {
    setState(() {
      result = res;
    });

  }
  Future<bool> getAPIData() async {
    // APInterface().getData();
    //String apiLocation = 'https://ipinfo.io/192.185.160.93/geo';
    String apiLocation = 'https://ipinfo.io/$ip_address/geo';
    APInterface apiObject = APInterface(apiLocation);
    var apiData = await apiObject.getData();

    String ip = "", city = "", region = "", country = "";
    ip = apiData['ip'];
    city = apiData['city'];
    region = apiData['region'];
    country = apiData['country'];
    //print("IP($ip) -> $city, $region, $country");
    //print("IP($apiData.ip) -> $apiData.city, $apiData.region, $apiData.country");
    String res = "IP($ip) -> $city, $region, $country";
    setResult(res);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IP Address Locator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: textFieldController,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
            ),
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'IP Address',
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.blueGrey, // background
              onPrimary: Colors.black, // foreground
            ),
            onPressed: () {
                const int buttonNumber1 = 1;
                buttonPressed(buttonNumber1);
            },
            child: const Text('See Result inside this Page'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.blueGrey, // background
              onPrimary: Colors.black, // foreground
            ),
            onPressed: () {
              const int buttonNumber2 = 2;
              buttonPressed(buttonNumber2);
            },
            child: const Text('See Result inside new Page'),
          ),
          Center(
            child: Text(
              '$result',
              // 'Text at center',
              style: const TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.w800,
                fontFamily: 'Roboto',
                letterSpacing: 0.5,
                fontSize: 18,
              ),
              // textScaleFactor: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
