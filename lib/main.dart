import 'package:flutter/material.dart';
import 'package:weather_app/Activities/home.dart';
import 'package:weather_app/Activities/location.dart';
import 'package:weather_app/Activities/loading.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context){
    return  MaterialApp(
      routes: {
        "/" :(context) => Loading(),
        "/home": (context) {
          final cityName = ModalRoute.of(context)!.settings.arguments as String;
          return Home(cityName: cityName);
        },
        "/location": (context) => Location(),
      },
    );
  }
}