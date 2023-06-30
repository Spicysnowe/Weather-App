import 'package:http/http.dart' as http;
import 'package:weather_app/Constants/strings.dart';
import 'package:weather_app/Models/current_weather_model.dart';
import 'package:weather_app/Models/hourly_model.dart';





getCurrentWeather(lat,long) async{
  var link="https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$apiKey&units=metric";
  var res = await http.get(Uri.parse(link));
  if(res.statusCode ==200){
    var data=currentWeatherDataFromJson(res.body.toString());
 
 return data;
  }
}

getHourlyWeather(lat,long) async{
var link ="https://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$long&appid=$apiKey&units=metric";
  var res = await http.get(Uri.parse(link));
  if(res.statusCode ==200){
    var data=hourlyWeatherDataFromJson(res.body.toString());
 print ("Hourly Data is recieved");
 return data;
  }
}