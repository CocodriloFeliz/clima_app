import 'dart:developer';

import 'package:http/http.dart' as http;
import 'dart:convert';

class Networking{
  final String url;
  Networking(this.url);

  Future getData() async{
    http.Response response = await http.get(Uri.parse(url));
    
    if(response.statusCode == 200){
      Map weatherData = jsonDecode(response.body);
      return weatherData;
    } else {
      log(response.statusCode.toString());
    }
  }
}