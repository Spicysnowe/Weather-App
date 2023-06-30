import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';


class NatureMetricsCard extends StatelessWidget {
  const NatureMetricsCard({Key? key, required this.clouds, required this.wind,required this.humidity}) : super(key: key);

  final String clouds;
  final String wind;
  final String humidity;
  

  @override
  Widget build(BuildContext context) {
    return Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Expanded(
      child: Card(
        // color: kblue.withOpacity(0.8),
        elevation: 0.0,
        
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Container(
          padding: const EdgeInsets.only(top: 24,left: 12, right: 10, bottom: 16),

          decoration: BoxDecoration(
            color: kblue.withOpacity(0.8),
          ),

          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             Icon(
                              Icons.access_alarm,
                              size: 15.0,
                              color: kyellow,
                            ),
                            const SizedBox(width: 5,),
                             Text('CLOUDS', style: TextStyle(fontSize: 15, color: Colors.white,fontWeight: FontWeight.w400) , ),
                          ],                          
                        ),

                        const SizedBox(height: 4.0),

                         Text(
                          clouds,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 22.0,
                          ),
                        ),
                        
                      ],
                    ),
                  ),


                 Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             Icon(
                              Icons.access_alarm,
                              size: 15.0,
                              color: kyellow,
                            ),
                            const SizedBox(width: 5,),
                             Text('WIND', style: TextStyle(fontSize: 15, color: Colors.white,fontWeight: FontWeight.w400) , ),
                          ],                          
                        ),

                        const SizedBox(height: 4.0),

                         Text(
                          wind,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 22.0,
                          ),
                        ),
                        
                      ],
                    ),
                  ),



                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             Icon(
                              Icons.access_alarm,
                              size: 11.0,
                              color: kyellow,
                            ),
                            const SizedBox(width: 5,),
                             Text('HUMIDITY', style: TextStyle(fontSize: 15, color: Colors.white,fontWeight: FontWeight.w400) , ),
                          ],                          
                        ),

                        const SizedBox(height: 6.0),

                         Text(
                          humidity,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                        
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  ],
);




  }
}
