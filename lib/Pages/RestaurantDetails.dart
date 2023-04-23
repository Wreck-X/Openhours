import 'package:flutter/material.dart';
import 'package:openhours/Widgets/customappbar.dart';
import '../Widgets/menucards.dart';

class RestaurantDetails extends StatefulWidget {
  const RestaurantDetails({Key? key}) : super(key: key);

  @override
  State<RestaurantDetails> createState() => _RestaurantDetailsState();
}

class _RestaurantDetailsState extends State<RestaurantDetails> {
  @override
  Widget build(BuildContext context) {
    final appbarheight = AppBar().preferredSize.height;
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
        child: Column(
          children: [
            PurpAppBar(),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1, color: Colors.white)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Image.asset(
                            'Images/casablanca.jpg',
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: height * 0.07,
                      decoration: const BoxDecoration(
                          border: Border(
                        top: BorderSide(width: 1, color: Colors.white),
                      )),
                      child: const Align(
                        child: Text(
                          'Menu',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Padding(
                          padding: const EdgeInsets.fromLTRB(16, 0, 8, 0),
                          child: Menucards('Food')),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 16, 0),
                          child: Menucards('Drinks'))
                    ])
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
