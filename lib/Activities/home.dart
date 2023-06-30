import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/Components/nature_metrics_card.dart';

class Home extends StatefulWidget {
 const Home({Key? key, required this.cityName}) : super(key: key);

final String cityName;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
       child: SingleChildScrollView(
         child: Container(
          padding: const EdgeInsets.only(top: 35,left: 8,right: 8, bottom: 25),
          color: kblue,
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               Text(
                    widget.cityName,
                    style: const TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
       
                const SizedBox(height: 10,),
       
                const Text(
                    'Today, 7Sep',
                    style:  TextStyle(fontSize: 15,color: Colors.white,),
                  ),
       
                const SizedBox(height: 5,),
       
                Container(height: 350, width:350, child: Image.asset('assets/images/weather.png')),
       
                const SizedBox(height: 5,),
       
                const Text(
                    '13°',
                    style:  TextStyle(fontSize: 75,color: Colors.white, fontWeight: FontWeight.bold),
                  ),
       
                  const SizedBox(height: 5,),
       
                const Text(
                    'Rainy',
                    style:  TextStyle(fontSize: 20,color: Colors.white, fontWeight: FontWeight.w500),
                  ),
       
                const SizedBox(height: 15,),
       
               const  NatureMetricsCard(),
       
               const SizedBox(height: 10,),
       
               Container(
                height: 150,
                decoration: BoxDecoration(
                        color: Color.fromARGB(255, 122, 193, 255),
                        borderRadius: BorderRadius.circular(30),
                      ),
                 child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(                      
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.only(right: 4),                      
                      child: Column(
                        children: [
                          // "${index+1} AM".text.gray200.make(),
                          Image.asset('assets/images/weather.png', width: 60),
                          // "38$degree".text.white.make(),
                        ],
                      ),
                    );
                  }
                           ),
               )
              
                  
             ],
           ),
         ),
       ),
        ),
    );
  }
}