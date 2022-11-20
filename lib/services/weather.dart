import '../services/networking.dart';
import '../services/location.dart';

class WeatherModel{
  String apiKey = '7fa0289b012b80415c65beab517fbb39';
  String apiWeatherURL = 'https://api.openweathermap.org/data/2.5/weather';
  Future<Map> getByCityName(String typedName) async{
    Networking helperNetworking = Networking('$apiWeatherURL?q=$typedName&appid=$apiKey&units=metric');
    return await helperNetworking.getData();
  }
  Future<Map> getLocationWeather() async {
    Location position = Location();
    await position.getCurrentPosition();
    Networking helperNetworking = Networking(
        '$apiWeatherURL?lat=${position.latitud}&lon=${position.longitud}&appid=$apiKey&units=metric');
    return await helperNetworking.getData();
  }
  String getWeatherIcon(int condition){
    if(condition<300){
      return '🌩️';
    }else if(condition<400){
      return '🌧️';
    }else if(condition<600){
      return '☔';
    }else if(condition<700){
      return '❄️';
    }else if(condition<800){
      return '🌫';
    }else if(condition==800){
      return '☀️';
    }else if(condition<=804){
      return '☁';
    } else{
      return 'noc';
    }
  }
  
  String getMessage(int temperature){
    if(temperature>25){
      return 'it\'s ice cream time';
    }else if(temperature>21){
      return 'Time for ligere clothes';
    }else if(temperature>10){
      return 'You\'ll need some winter clothes';
    }else{
      return 'Bring a suit just in case';
    }
  }

}