import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';


class SearchBox extends StatelessWidget {
  const SearchBox({
    super.key, required this.onChanged, required this.cityController, required this.isSearchActivated,
  });

  final ValueChanged onChanged;
  final TextEditingController cityController;
  final bool isSearchActivated;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.all(kDefaultPadding),
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding, vertical:  2),
      
      decoration: BoxDecoration(
        color: kgrey.withOpacity(0.4),
        borderRadius: BorderRadius.circular(20)),
        
      child: TextField(
        controller: cityController,
        enabled: isSearchActivated,
        onChanged: onChanged,
        style: const TextStyle(color: kdarkBlue),
        decoration: const InputDecoration(
          enabledBorder:InputBorder.none,
          focusedBorder: InputBorder.none,
          icon: Icon(Icons.search),
          hintText: 'Search for a city',
          hintStyle: TextStyle(color:kdarkBlue),
        ),
      ),
    );
  }
}