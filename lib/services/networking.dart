import 'dart:developer';

import 'package:http/http.dart' as http;
import 'dart:convert';

class Networking{
  final String url;
  Networking(this.url);

  void getData() async{
    http.Response response = await http.get(Uri.parse(url));
    
    if(response.statusCode == 200){
      dynamic data = response.body;
      return jsonDecode(data);
    } else {
      log(response.statusCode.toString());
    }
  }
}