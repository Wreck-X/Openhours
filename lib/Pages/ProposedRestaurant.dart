// how to implement owner in Restaurants....but try to optimize it
import 'package:flutter/material.dart';
import 'package:openhours/Widgets/RestaurantCard.dart';
import '../Widgets/customappbar.dart';
import '../Pages/Owner.dart';

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
    Owner Casablanca = Owner("Casablanca",
        'https://lh3.googleusercontent.com/p/AF1QipNHr_KPpZ0orf3tXeuOjtChdiFhlgF66u_nUKDD=s1360-w1360-h1020');
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
          PurpAppBar("Enter restaurant name"),
          RestaurantCard("Casablanca", 3.4, Casablanca.status, [
            'https://lh3.googleusercontent.com/p/AF1QipNHr_KPpZ0orf3tXeuOjtChdiFhlgF66u_nUKDD=s1360-w1360-h1020',
            'https://img.restaurantguru.com/cfd6-Casablanca-Vallikavu-interior.jpg',
            'https://10619-2.s.cdn12.com/rests/small/w285/102_505848815.jpg',
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
          
        ]),
      ),
    ));
  }
}
