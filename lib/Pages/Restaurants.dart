import 'package:flutter/material.dart';
import 'package:openhours/Widgets/RestaurantCard.dart';
import '../Widgets/customappbar.dart';

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
      child: SingleChildScrollView(
        child: Column(children: [
          PurpAppBar(),
          RestaurantCard("Casablanca", 3.4, [
            'https://lh3.googleusercontent.com/p/AF1QipNHr_KPpZ0orf3tXeuOjtChdiFhlgF66u_nUKDD=s1360-w1360-h1020',
            'https://img.restaurantguru.com/cfd6-Casablanca-Vallikavu-interior.jpg',
            'https://10619-2.s.cdn12.com/rests/small/w285/102_505848815.jpg'
          ]),
          RestaurantCard("Spicy Villa family restaurant", 4.2, [
            'https://10619-2.s.cdn12.com/rests/original/106_509754993.jpg',
            'https://img.restaurantguru.com/c48a-Spicy-villa-family-Restaurant-Vallikavu-design.jpg',
            'https://img.restaurantguru.com/re84-Spicy-villa-family-Restaurant-interior.jpg'
          ]),
          RestaurantCard("Califo", 4.3, [
            'https://img.restaurantguru.com/w550/h367/rfc1-Califo-Restaurant-logo.jpg',
            'https://img.restaurantguru.com/c9cb-Califo-Restaurant-view.jpg',
            'https://img.restaurantguru.com/r98b-Califo-Restaurant-interior.jpg'
          ])
        ]),
      ),
    ));
  }
}
