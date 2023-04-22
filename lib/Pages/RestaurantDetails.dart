import 'package:flutter/material.dart';

class RestaurantDetails extends StatefulWidget {
  const RestaurantDetails({Key? key}) : super(key: key);

  @override
  State<RestaurantDetails> createState() => _RestaurantDetailsState();
}

class _RestaurantDetailsState extends State<RestaurantDetails> {
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
        child: Column(
          children: [
            PreferredSize(
              preferredSize: Size.fromHeight(kToolbarHeight),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                      Color.fromARGB(255, 199, 152, 255),
                      Color.fromARGB(255, 140, 173, 255),
                    ],
                  ),
                ),
                child: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  title: Text('My App'),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 8.0,
                ),
              ),
              child: Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  'Images/casablanca.jpg',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
            Row(children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 8, 0),
                child: ElevatedButton(
                  onPressed: () {
                    // Handle button press
                  },
                  child: Text('Food',
                      style: TextStyle(
                        fontSize: 20,
                      )),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Color(0xC7F5FF).withOpacity(0.24), // background color
                    foregroundColor: Colors.white, // text color
                    padding: EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10), // button padding
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10), // button border radius
                    ),
                    minimumSize: Size(150, 300),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 16, 0),
                child: ElevatedButton(
                  onPressed: () {
                    // Handle button press
                  },
                  child: Text('Drinks',
                      style: TextStyle(
                        fontSize: 20,
                      )),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Color(0xC7F5FF).withOpacity(0.24), // background color
                    foregroundColor: Colors.white, // text color
                    padding: EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10), // button padding
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10), // button border radius
                    ),
                    minimumSize: Size(150, 300),
                  ),
                ),
              )
            ])
          ],
        ),
      ),
    );
  }
}
