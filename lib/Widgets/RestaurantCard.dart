import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:openhours/Pages/RestaurantDetails.dart';
import 'package:dots_indicator/dots_indicator.dart';

class RestaurantCard extends StatefulWidget {
  String title;
  double rating;
  bool color_choice;
  List images;
  List food;
  List drinks;
  RestaurantCard(this.title, this.rating, this.color_choice, this.images,
      this.food, this.drinks,
      {Key? key})
      : super(key: key);

  @override
  State<RestaurantCard> createState() => _RestaurantCardState();
}

class _RestaurantCardState extends State<RestaurantCard> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => RestaurantDetails(
                      widget.images[0], widget.food, widget.drinks)));
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.0),
          ),
          elevation: 12.0,
          child: Stack(
            children: [
              Container(
                height: 250,
                width: 180,
                child: buildImage(widget.images[0]),
              ),
              Positioned(
                bottom: 50,
                left: 0,
                right: 0,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    widget.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 18,
                left: 7,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text(
                        widget.color_choice ? "Open" : "Closed",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: widget.color_choice ? Colors.green : Colors.red),
                  ),
                ),
              ),
              Positioned(
                  bottom: 20,
                  left: 120,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      decoration: BoxDecoration(color: Colors.transparent),
                      child: Row(children: [
                        Icon(Icons.star, color: Color.fromRGBO(255, 215, 0, 1.0),),
                        Text(
                          widget.rating.toString(),
                          style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.w900),
                        ),
                      ]),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget buildImage(String urlImage) => Container(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image.network(
            urlImage,
            fit: BoxFit.cover,
          ),
        ),
      );
}
