import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';


class NatureMetricsCard extends StatelessWidget {
  const NatureMetricsCard({super.key});

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
                             Text('UV Index', style: TextStyle(fontSize: 15, color: Colors.white,fontWeight: FontWeight.w400) , ),
                          ],                          
                        ),

                        const SizedBox(height: 4.0),

                        const Text(
                          '2',
                          style: TextStyle(
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
                             Text('UV Index', style: TextStyle(fontSize: 15, color: Colors.white,fontWeight: FontWeight.w400) , ),
                          ],                          
                        ),

                        const SizedBox(height: 4.0),

                        const Text(
                          '2',
                          style: TextStyle(
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
                             Text('UV Index', style: TextStyle(fontSize: 15, color: Colors.white,fontWeight: FontWeight.w400) , ),
                          ],                          
                        ),

                        const SizedBox(height: 4.0),

                        const Text(
                          '2',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 22.0,
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
