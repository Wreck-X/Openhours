import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RestaurantCard extends StatefulWidget {
  String entry;
  RestaurantCard(this.entry, {Key? key}) : super(key: key);

  @override
  State<RestaurantCard> createState() => _RestaurantCardState();
}

class _RestaurantCardState extends State<RestaurantCard> {
  final urlImages = [
    'https://lh3.googleusercontent.com/p/AF1QipNHr_KPpZ0orf3tXeuOjtChdiFhlgF66u_nUKDD=s1360-w1360-h1020',
    'https://img.restaurantguru.com/cfd6-Casablanca-Vallikavu-interior.jpg',
    'https://10619-2.s.cdn12.com/rests/small/w285/102_505848815.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(13.0),
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
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 3),
                child: SizedBox(
                  height: 150,
                  width: 400,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: urlImages.length.isFinite && urlImages.length > 0
                        ? urlImages.length.toInt()
                        : 0,
                    itemBuilder: (context, index) {
                      final urlImage = urlImages[index];
                      return buildImage(urlImage, index);
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(22, 0, 0, 0),
                child: Text(
                  'Casablanca',
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
    );
  }

  Widget buildImage(String urlImage, int index) => Container(
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image.network(
            urlImage,
          ),
        ),
      );
}
