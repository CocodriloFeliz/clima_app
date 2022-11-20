import 'package:clima_app/screens/city_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima_app/services/weather.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key, required this.weatherData});

  final Map weatherData;
  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  double temperature = 0;
  int condition = 0;
  String cityName = '';
  WeatherModel weather = WeatherModel();
  String weatherIcon = '';
  String messageWeather = '';
  @override
  void initState() {
    super.initState();
    updateUI(widget.weatherData);
  }
  void updateUI(newLocation){
    setState(() {
      temperature = newLocation['main']['temp'];
    condition = newLocation['weather'][0]['id'];
    cityName = newLocation['name'];
    weatherIcon = weather.getWeatherIcon(condition);
    messageWeather = weather.getMessage(temperature.toInt());
    });    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/img/Background.jfif"),
            fit: BoxFit.cover,
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: () async{
                updateUI(await weather.getLocationWeather());
              }, icon: const Icon(Icons.near_me,size: 40,)),
              IconButton(onPressed: () async{
                String typedName = await Navigator.push(context, MaterialPageRoute(builder: (context)=> const CityScreen()));
                updateUI(await weather.getByCityName(typedName));
              }, icon: const Icon(Icons.location_city,size: 40,)),
            ]),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Row(
                children: [
                  Text(
                    '$temperature° $weatherIcon',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.w800),
                  ),
                ],
              ),
            ),
            Padding(padding: const EdgeInsets.all(50.0),child: 
                  Text('$messageWeather in $cityName' , style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w800),),)
          ],
        )),
      ),
    );
  }
}
