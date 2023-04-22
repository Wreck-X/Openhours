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
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
        elevation: 10,
        child: Container(
          width: 300,
          height: 190,
          child: Center(
            child: Text('This is a card'),
          ),
        ),
      ),
    );
  }
}
