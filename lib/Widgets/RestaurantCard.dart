import 'package:flutter/material.dart';

class RestaurantCard extends StatefulWidget {
  String entry;
  RestaurantCard(this.entry, {Key? key}) : super(key: key);

  @override
  State<RestaurantCard> createState() => _RestaurantCardState();
}

class _RestaurantCardState extends State<RestaurantCard> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: height * 0.22,
          width: width,
          child: Placeholder(),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
        ));
  }
}
