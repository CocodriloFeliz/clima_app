import 'package:clima_app/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../services/networking.dart';
import '../services/location.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Location position = Location();
  String apiKey = '7fa0289b012b80415c65beab517fbb39';
  double longitud = 0;
  double latitud = 0;
  @override
  void initState() {
    super.initState();
    getPositionData();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitCircle(color: Colors.white),
      ),
    );
  }

  void getPositionData() async {
    await position.getCurrentPosition();
    longitud = position.longitud;
    latitud = position.latitud;
    Networking helperNetworking = Networking(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitud&lon=$longitud&appid=$apiKey');
    helperNetworking.getData();
    Navigator.push(context, MaterialPageRoute(builder: (context) =>
      LocationScreen(locationWeather: helperNetworking,)
    ));
  }

  void mainScreen() {
    
  }
}
