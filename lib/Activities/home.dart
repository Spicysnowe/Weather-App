import 'package:flutter/material.dart';
import 'package:weather_app/Models/current_weather_model.dart';
import 'package:weather_app/Services/api_services.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/Components/nature_metrics_card.dart';
import 'package:get/get.dart';
import 'package:weather_app/Controllers/main_controller.dart';
import 'package:weather_app/Models/hourly_model.dart';
import 'package:intl/intl.dart';



class Home extends StatefulWidget {
 const Home({Key? key, required this.cityName}) : super(key: key);

final String cityName;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var controller = Get.put(MainController());


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Obx(
        ()=> controller.isloaded.value==true? SafeArea(
         child: FutureBuilder(
          // future: controller.currentWeatherData,
          future: widget.cityName == "Default City"? controller.currentWeatherData:controller.getCityWeatherData(widget.cityName),
          
          builder: (BuildContext context, AsyncSnapshot  snapshot){
            if(snapshot.hasData){
              CurrentWeatherData data = snapshot.data;
              
             return SingleChildScrollView(
           child: Container(
            padding: const EdgeInsets.only(top: 35,left: 8,right: 8, bottom: 25),
            color: kblue,
             child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                 Text(
                  // widget.cityName
                      "${data.name}",
                      style: const TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
         
                  const SizedBox(height: 10,),
         
                  const Text(
                      'Today, 7Sep',
                      style:  TextStyle(fontSize: 15,color: Colors.white,),
                    ),
         
                  const SizedBox(height: 5,),
         
                  Image.asset('assets/images/weather.png', width: 350, height: 350,),                
                  // SizedBox(height: 350, width:350, child: Image.network('assets/images/${data.weather[0].icon}.png')),
         
                  const SizedBox(height: 5,),
         
                   Text(
                      "${data.main.temp}",
                      style:  const TextStyle(fontSize: 75,color: Colors.white, fontWeight: FontWeight.bold),
                    ),
         
                    const SizedBox(height: 5,),
         
                   Text(
                      "${data.weather[0].main}",
                      style:  const TextStyle(fontSize: 20,color: Colors.white, fontWeight: FontWeight.w500),
                    ),
         
                  const SizedBox(height: 15,),
         
                   NatureMetricsCard(clouds: "${data.clouds.all}", wind: "${data.main.humidity}", humidity: "${data.wind.speed} km/h",),
         
                 const SizedBox(height: 10,),
         
                 FutureBuilder(
                  future: controller.hourlyWeatherData,                
                  builder: (BuildContext context,AsyncSnapshot snapshot){
                    if(snapshot.hasData){
      
                      HourlyWeatherData hourlyData= snapshot.data;
      
                      return Container(
                        padding: const EdgeInsets.all(8),
                  height: 150,
                  decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 122, 193, 255),
                          borderRadius: BorderRadius.circular(30),
                        ),
                   child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: hourlyData.list.length >8 ? 8: hourlyData.list.length,
                    itemBuilder: (BuildContext context, int index) {
      
                      var time = DateFormat.jm()
                            .format(DateTime.fromMillisecondsSinceEpoch(hourlyData.list[index].dt.toInt()*1000));
      
                      return Container(                      
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.only(right: 6),                      
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                           
                            Text(
                              time,
                              style: const TextStyle(color: Colors.white) ,
                            ),
                            const SizedBox(height: 10,),
                            Image.asset('assets/images/weather.png', width: 60),
                            //  Image.asset('assets/images/${hourlyData.list[index].weather[0].icon}.png', width: 60),
                            // "38$degree".text.white.make(),
                            const SizedBox(height: 10,),
                            Text(
                              "${hourlyData.list[index].main.temp}",
                              style: const TextStyle(color: Colors.white) ,
                            ),
                          ],
                        ),
                      );
                    }
                             ),
                 );
                 
                    }
                    else{
                  return const Center(child: CircularProgressIndicator(),);
                 }
                  }
                  
                )
                
                    
               ],
             ),
           ),
         );
      
            }
            else{
              return const Center(child: CircularProgressIndicator(),);
            }
          }
        )
          ): const Center(child: CircularProgressIndicator(),),
      ),
    );
  }
}