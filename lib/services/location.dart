import 'dart:developer';

import 'package:geolocator/geolocator.dart';

class Location {
  late double longitud;
  late double latitud;
  Future<void> getCurrentPosition() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      longitud = position.longitude;
      latitud = position.latitude;
    } catch (e) {
      log(e.toString());
    }
  }
}
