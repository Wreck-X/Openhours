import 'package:flutter/material.dart';
import 'package:openhours/Widgets/RestaurantCard.dart';
class Restaurants extends StatefulWidget {
  const Restaurants({super.key});

  @override
  State<Restaurants> createState() => _RestaurantsState();
}

class _RestaurantsState extends State<Restaurants> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
           automaticallyImplyLeading: false,
            actions: [
              SizedBox(
                width: width * 0.8,
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.transparent,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    hintText: 'Enter some text',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(Icons.search),
              )]
        ),
        body: Container(
          height: height,
          width: width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                Color.fromARGB(255, 199, 152, 255),
                Color.fromARGB(255, 140, 173, 255),
              ],
            ),
          ),
          child: Column(
              children: [
                RestaurantCard("hello"),
              ]
          ),
        )
    );
  }

}