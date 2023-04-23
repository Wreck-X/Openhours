import 'package:flutter/material.dart';

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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
        elevation: 16.0,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
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
            Text('Casablanca'),
          ],
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
