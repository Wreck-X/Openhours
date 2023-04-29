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
        color: Colors.white,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 40, 0, 30),
            child: Row(
              children: [
                Icon(Icons.menu),
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Text("OPEN HOURS", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, fontFamily: "Inter"),),
                ),
              ],
            ),
          ),
          Container(
            height: 300,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Row(children: [
                    RestaurantCard("Casablanca", 3.4, true, [
                      'https://lh3.googleusercontent.com/p/AF1QipNHr_KPpZ0orf3tXeuOjtChdiFhlgF66u_nUKDD=s1360-w1360-h1020',
                      'https://img.restaurantguru.com/cfd6-Casablanca-Vallikavu-interior.jpg',
                      'https://10619-2.s.cdn12.com/rests/small/w285/102_505848815.jpg'
                    ], [
                      'alfam',
                      'shawai',
                      'Shawarma',
                      'Kizhi Biryani'
                    ], [
                      'Orange Juice',
                      'Lemon Juice',
                      'Lassi'
                    ]),
                    RestaurantCard(
                        "Spicy Villa family restaurant", 4.2, false, [
                      'https://10619-2.s.cdn12.com/rests/original/106_509754993.jpg',
                      'https://img.restaurantguru.com/c48a-Spicy-villa-family-Restaurant-Vallikavu-design.jpg',
                      'https://img.restaurantguru.com/re84-Spicy-villa-family-Restaurant-interior.jpg'
                    ], [
                      'alfam',
                      'shawai',
                      'Shawarma',
                      'Kizhi Biryani'
                    ], [
                      'Orange Juice',
                      'Lemon Juice',
                      'Lassi'
                    ]),
                    RestaurantCard("Califo", 4.3, false, [
                      'https://img.restaurantguru.com/w550/h367/rfc1-Califo-Restaurant-logo.jpg',
                      'https://img.restaurantguru.com/c9cb-Califo-Restaurant-view.jpg',
                      'https://img.restaurantguru.com/r98b-Califo-Restaurant-interior.jpg'
                    ], [
                      'alfam',
                      'shawai',
                      'Shawarma',
                      'Kizhi Biryani'
                    ], [
                      'Orange Juice',
                      'Lemon Juice',
                      'Lassi'
                    ])
                  ]);
                }),
          ),
        ],
      ),
    ));
  }
}
