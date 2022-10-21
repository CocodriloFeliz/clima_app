import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../services/location.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Location position = Location();
  String apiKey = '7fa0289b012b80415c65beab517fbb39';
  @override
  void initState() {
    super.initState();
    getPositionData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed:  (){
            getPositionData();
          }, 
          child: const Text('Obtener Ubicacion'),
        )
        ),
    );
  }
  void getPositionData() async{
    await position.getCurrentPosition();
    double longitud = position.longitud;
    double latitud = position.latitud;

    http.Response response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=$latitud.34&lon=$longitud&appid=$apiKey'));
    if(response.statusCode == 200){
      String data = response.body;
      int condition = jsonDecode(data)['weather'][0]['id'];
      double temperature = jsonDecode(data)['main']['temp'];
      String city = jsonDecode(data)['name'];
      print('id: $condition, temp: $temperature, city:$city');
    } else {
      print(response.statusCode);
      print('choco');
    }
  }
}