import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';
import 'package:weather_app/Components/search_box.dart';
import 'package:weather_app/constants.dart';

class CityCard {
  String cityName;
  bool isDeleting = false;
  String additionalText="Rainy";
  int temp=13;
  
  CityCard({required this.cityName,});
}

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List<CityCard> cityCards = [
    CityCard(
      cityName: 'Default City',
      ),
  ];
  TextEditingController cityController = TextEditingController();
  bool isSearchActivated = true;
  bool isLongPressMode = false;
  int longPressIndex = -1;
  late Database database;

 Future<void> initializeDatabase() async {
  try {
    Directory appDirectory = await getApplicationDocumentsDirectory();
    String databasePath = appDirectory.path + '/weather.db';

    database = await openDatabase(
      databasePath,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          'CREATE TABLE CityCard (id INTEGER PRIMARY KEY AUTOINCREMENT, cityName TEXT)',
        );
      },
    );
  } catch (e) {
    print('Error opening database: $e');
    // Handle the error here (show a toast, display an error message, etc.)
  }
}

 void loadCityCards() async {
  await initializeDatabase();

  List<Map<String, dynamic>> cityCardsFromDb = await database.query('CityCard');

  bool containsDefaultCity = cityCardsFromDb.any((card) => card['cityName'] == 'Default City');
  if (!containsDefaultCity) {
    setState(() {
      cityCards = [
        CityCard(cityName: 'Default City'), // Add the default city as the first item
        ...cityCardsFromDb.map((card) => CityCard(cityName: card['cityName'])),
      ];
    });
  } else {
    setState(() {
      cityCards = cityCardsFromDb
          .map((card) => CityCard(cityName: card['cityName']))
          .toList();
    });
  }
}

  void saveCityCards() async {
    await initializeDatabase();

    await database.delete('CityCard'); // Clear the existing city cards in the database

    // Insert the updated city cards into the database
    for (var card in cityCards) {
      await database.insert(
        'CityCard',
        {'cityName': card.cityName},
      );
    }
  }

  void addCityCard(String cityName) {
    if (cityName.isEmpty) {
      Fluttertoast.showToast(
        msg: 'Enter the city first',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    } else if (cityCards.any((card) => card.cityName == cityName)) {
      Fluttertoast.showToast(
        msg: 'City already added',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    } else {
      setState(() {
        cityCards.add(CityCard(cityName: cityName));
        cityController.clear();
      });
      saveCityCards(); // Save the city cards after adding a new card
    }
  }

  void deleteCityCard(int index) {
    if (index == 0) {
      Fluttertoast.showToast(
        msg: 'Cannot delete the default city',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    } else {
      setState(() {
        cityCards.removeAt(index);
      });
      saveCityCards(); // Save the city cards after deleting a card
    }
  }

  @override
  void initState() {
    super.initState();
    loadCityCards();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20,left: 16,right: 16,bottom: 16),
          
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  const Text(
                    'Weather',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                       color: kdarkBlue,
                    ),
                  ),

                  Container(                    
                    decoration: BoxDecoration(
                      color: kgrey.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(20)),

                    child: IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        addCityCard(cityController.text);                       
                      },
                    ),
                  ),

                ],
              ),

              const SizedBox(height: 16),
              
              SearchBox(
                onChanged:  (value) {
                  // Do nothing on text change
                },
               cityController: cityController, 
               isSearchActivated: isSearchActivated),

               const SizedBox(height: 16),

              Expanded(
                child: ListView.builder(
                  itemCount: cityCards.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(

                     onTap: (){
                      Navigator.pushNamed(context, '/home',arguments: cityCards[index].cityName,);
                      // Navigator.pushNamed(context, '/home',arguments: "Mumbai",);
                     },

                      onLongPress: () {
                        if (index != 0) {
                          setState(() {
                            isLongPressMode = true;
                            longPressIndex = index;
                          });
                        }
                      },
                      
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Container(
                          height: 120,
                          margin: const EdgeInsets.only(bottom: 8),
                          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 16),
                      
                          decoration: BoxDecoration(
                            color:  (isLongPressMode && longPressIndex == index) ? Colors.red[400] : const Color(0xFF61B5FF),
                            borderRadius: BorderRadius.circular(30)),
                        
                          child: Row(
                            children: [
                      
                              if (!(isLongPressMode && longPressIndex == index))
                                Expanded(
                                  child:                              
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            cityCards[index].cityName, 
                                            style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                          
                                          const SizedBox(height: 4,),
                      
                                          Text(
                                            cityCards[index].additionalText,
                                             style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                            ),
                                          ),
                      
                                           const SizedBox(height: 6,),
                      
                                          Text(
                                            cityCards[index].temp.toString() + "°C",
                                             style: const TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                      
                                        ],
                                      ),
                                      
                                        Image.asset(
                                          'assets/images/weather.png',                                        
                                        )
                                        
                                    ],
                                  ),
                                ),
                      
                      
                      
                              if (isLongPressMode && longPressIndex == index)
                                Expanded(
                                  child: Column(
                                     crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [

                                      const Text(
                                        'Are you sure?',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),

                                      const SizedBox(height: 15,),
                                      
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [

                                          Container(
                                           
                                            decoration: BoxDecoration(
                                              color: kgrey,
                                              borderRadius: BorderRadius.circular(10)),

                                            child: TextButton(
                                              child: const Text('No', style: TextStyle(fontSize: 18,color: kdarkBlue),),
                                              onPressed: () {
                                                setState(() {
                                                  isLongPressMode = false;
                                                  longPressIndex = -1;
                                                });
                                              },
                                            ),
                                          ),

                                          Container(

                                            decoration: BoxDecoration(
                                              color: kgrey,
                                              borderRadius: BorderRadius.circular(10)),
                                            
                                            child: TextButton(
                                              child: const Text('Yes', style: TextStyle(fontSize: 18,color: kdarkBlue),),
                                              onPressed: () {
                                                deleteCityCard(index);
                                                setState(() {
                                                  isLongPressMode = false;
                                                  longPressIndex = -1;
                                                });
                                              },
                                            ),
                                          ),


                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
