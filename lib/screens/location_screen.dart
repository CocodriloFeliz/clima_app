import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({required this.locationWeather});

  final locationWeather;

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  double temperature = 0;
  @override
  void initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/img/Background.jfif"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(child: Column(
          children: [
            Padding(padding: EdgeInsets.only(left: 15.0),
            child: Row(
              children: [Text('32 grados'),
              Text('solsito')],
            ),)
          ],
        )),
      ),
    );
  }
}