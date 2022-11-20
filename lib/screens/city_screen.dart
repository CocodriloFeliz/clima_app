import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({super.key});

  @override
  State<CityScreen> createState() => CityScreenState();
}

class CityScreenState extends State<CityScreen> {
  String cityName = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/img/Background.jfif'),
                fit: BoxFit.cover)),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 60.0,
                  ),
                  alignment: Alignment.centerLeft,),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                    icon: Icon(Icons.location_city),
                    hintText: 'Search a city',
                    hintStyle: TextStyle(
                      color: Colors.black45
                    ),
                    fillColor: Colors.white,
                    iconColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide.none)
                  ),                
                  onChanged: (value) {
                    cityName=value;
                  },
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context,cityName);
                }, child: const Text('Get Weather',style: TextStyle(fontSize: 40.0,fontWeight: FontWeight.bold, color: Colors.white),),
                ),
              Container(height: 100,)
            ],
          ),
        ),
      ),
    );
  }
}
