import 'package:http/http.dart';
import 'dart:convert';

class APInterface {
  APInterface(this.url);
  String url;

  Future getData() async {
    var uri = Uri.parse(url);
    Response response = await get(uri);
    //print(response.body);
    var decodedData = jsonDecode(response.body);
    return decodedData;
  }

}