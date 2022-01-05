import 'package:http/http.dart';
import 'dart:convert';

class APInterface {
  APInterface(this.url);
  String url;

  String ip="", city="", region="", country="";
  //APInterface(this.ip, this.city, this.region, this.country);
  void viewData() async {
    var uri = Uri.parse(url);
    Response response = await get(uri);
    //print(response.body);
    var decodedData = jsonDecode(response.body);
    ip = decodedData['ip'];
    city = decodedData['city'];
    region = decodedData['region'];
    country = decodedData['country'];
    print("IP($ip) -> $city, $region, $country");
  }

  Future getData() async {
    var uri = Uri.parse(url);
    Response response = await get(uri);
    //print(response.body);
    var decodedData = jsonDecode(response.body);
    return decodedData;
  }

}