import 'package:http/http.dart' as http;
import 'dart:convert';

class Networking{
  final String url;
  Networking(this.url);

  void getData() async{
    http.Response response = await http.get(Uri.parse(url));
    
    if(response.statusCode == 200){
      String data = response.body;
      int condition = jsonDecode(data)['weather'][0]['id'];
      double temperature = jsonDecode(data)['main']['temp'];
      String city = jsonDecode(data)['name'];
      print('id: $condition, temp: $temperature, city:$city');
    } else {
      print(response.statusCode);
    }
  }
}