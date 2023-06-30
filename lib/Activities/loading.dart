import 'dart:ui';
import 'package:weather_app/constants.dart';
import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          
          // Background with blur effect
          ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF61B5FF),
                    Color(0xFFD3B2FF),
                    Color(0xFFFFE45C),
                  ],

                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),
          
        
          
          
          // Content on top of the background
        Align(
        alignment: Alignment.bottomCenter,

        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0),

          child: Card(

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40.0),
            ),

            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(16.0),

              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                   const SizedBox(height: 60),

                  const Text(
                    'Weather App',
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      color: kdarkBlue,
                    ),
                    textAlign: TextAlign.center
                  ),


                  const SizedBox(height: 30),
                  

                  const Text(
                    'Discover the weather in your\ncity and plan your day\ncorrectly',
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w500,  
                      color: kdarkBlue,                  
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 3,
                  ),


                  const SizedBox(height: 50),

                  

                 Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                   shape: BoxShape.circle,
                   border: Border.all(color: const Color(0xFF61B5FF), width: 4.0),
                  ),
                  
                  child: Stack(
                    children: [
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(

                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF61B5FF), // Set the blue color here
                          ),
                          
                          child: IconButton(
                          icon: const Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/location');
                          },
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),


         const SizedBox(height: 30),
                  
                ],
              ),
            ),
          ),
        ),
      ),
        ],
      ),
    );

  }
}