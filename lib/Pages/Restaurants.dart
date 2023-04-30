import 'package:flutter/material.dart';
import 'package:openhours/Widgets/RestaurantCard.dart';
import '../Widgets/customappbar.dart';

class Restaurants extends StatefulWidget {
  const Restaurants({super.key});

  @override
  State<Restaurants> createState() => _RestaurantsState();
}

class _RestaurantsState extends State<Restaurants> {
  int selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(),
      body: Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 40, 0, 30),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      _scaffoldKey.currentState?.openDrawer();
                    },
                    child: Icon(Icons.menu),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      "OPEN HOURS",
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Inter"),
                    ),
                  ),
                ],
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(left: 14.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("Make sure your",
                  style: TextStyle(
                      fontSize: 32,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.bold)),
              Text("restaurant is",
                  style: TextStyle(
                      fontSize: 32,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.bold)),
              Text(
                "Open!",
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 32,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.bold),
              ),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(75, 30, 50, 25),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = 0;
                    });
                  },
                  child: Text(
                    "All",
                    style: TextStyle(
                        fontSize: 17,
                        fontFamily: "Inter",
                        color:
                            selectedIndex == 0 ? Colors.green : Colors.black),
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = 1;
                    });
                  },
                  child: Text(
                    "New",
                    style: TextStyle(
                        fontSize: 17,
                        fontFamily: "Inter",
                        color:
                            selectedIndex == 1 ? Colors.green : Colors.black),
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = 2;
                    });
                  },
                  child: Text(
                    "Popular",
                    style: TextStyle(
                        fontSize: 17,
                        fontFamily: "Inter",
                        color:
                            selectedIndex == 2 ? Colors.green : Colors.black),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: Container(
              height: 300,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 1,
                  itemBuilder: (BuildContext context, int index) {
                    if (selectedIndex == 0) {
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
                        ]),
                        RestaurantCard("Cafe Monarch", 3.7, true, [
                          'https://lh3.googleusercontent.com/p/AF1QipPrP4w5kwv8FxjBVYTO12Ef3FQj2-sTKeEJbzg7=s1360-w1360-h1020'
                        ], [], [])
                      ]);
                    } else if (selectedIndex == 1) {
                      return Row(children: [
                        RestaurantCard("Cafe Monarch", 3.7, true, [
                          'https://lh3.googleusercontent.com/p/AF1QipPrP4w5kwv8FxjBVYTO12Ef3FQj2-sTKeEJbzg7=s1360-w1360-h1020'
                        ], [], [])
                      ]);
                    } else {
                      return Row(children: [
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
                        ]),
                      ]);
                    }
                  }),
            ),
          ),
          Expanded(
            child: Container(
            decoration: BoxDecoration(
              color: Color(0xFF209653),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
          ),
          )

        ],
      ),
    ));
  }
}
