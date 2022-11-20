import 'package:clima_app/screens/location_screen.dart';
import 'package:clima_app/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
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
    Map weatherData = await WeatherModel().getLocationWeather();
    mainScreen(weatherData);
  }

  void mainScreen(Map data) {
    Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LocationScreen(weatherData: data,)),
            );
  }
}
