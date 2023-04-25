import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:openhours/Pages/RestaurantDetails.dart';
import 'package:dots_indicator/dots_indicator.dart';

class RestaurantCard extends StatefulWidget {
  String title;
  double rating;
  List images;
  List food;
  List drinks;
  RestaurantCard(this.title, this.rating, this.images, this.food, this.drinks, {Key? key})
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
                  builder: (context) =>
                      RestaurantDetails(widget.images[0], widget.food, widget.drinks)));
        },
        child: Card(
          color: Color(0xffE01313),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.0),
          ),
          elevation: 16.0,
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 150,
                        width: 400,
                        child: PageView.builder(
                          onPageChanged: (index) {
                            setState(() {
                              _currentIndex = index;
                            });
                          },
                          itemCount: widget.images.length,
                          itemBuilder: (context, index) {
                            final urlImage = widget.images[index];
                            return buildImage(urlImage, index);
                          },
                        ),
                      ),
                      SizedBox(height: 8),
                      DotsIndicator(
                        dotsCount: widget.images.length,
                        position: _currentIndex.toDouble(),
                        decorator: DotsDecorator(
                          color: Colors.grey[300]!,
                          activeColor: Colors.white,
                          spacing: EdgeInsets.all(3),
                          activeSize: Size(10, 10),
                          size: Size(6, 6),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(22, 0, 0, 0),
                  child: Text(
                    widget.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(17, 0, 0, 8),
                  child: RatingBar.builder(
                    initialRating: widget.rating,
                    minRating: 1,
                    direction: Axis.horizontal,
                    itemCount: 5,
                    itemSize: 22.5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildImage(String urlImage, int index) => Container(
        padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
        margin: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image.network(
            urlImage,
          ),
        ),
      );
}
