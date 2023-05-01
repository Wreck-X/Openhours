import 'package:flutter/material.dart';
import 'package:openhours/Widgets/RestaurantCard.dart';
import '../Widgets/customappbar.dart';

class Restaurants extends StatefulWidget {
  const Restaurants({super.key});

  @override
  State<Restaurants> createState() => _RestaurantsState();
}

class _RestaurantsState extends State<Restaurants> {
  TextEditingController editingController = TextEditingController();
  final restaurantcards = [
    RestaurantCard("Casablanca", 3.4, true, const [
      'https://lh3.googleusercontent.com/p/AF1QipNHr_KPpZ0orf3tXeuOjtChdiFhlgF66u_nUKDD=s1360-w1360-h1020',
      'https://img.restaurantguru.com/cfd6-Casablanca-Vallikavu-interior.jpg',
      'https://10619-2.s.cdn12.com/rests/small/w285/102_505848815.jpg'
    ], const [
      'alfam',
      'shawai',
      'Shawarma',
      'Kizhi Biryani'
    ], const [
      'Orange Juice',
      'Lemon Juice',
      'Lassi'
    ]),
    RestaurantCard("Spicy Villa family restaurant", 4.2, false, const [
      'https://10619-2.s.cdn12.com/rests/original/106_509754993.jpg',
      'https://img.restaurantguru.com/c48a-Spicy-villa-family-Restaurant-Vallikavu-design.jpg',
      'https://img.restaurantguru.com/re84-Spicy-villa-family-Restaurant-interior.jpg'
    ], const [
      'alfam',
      'shawai',
      'Shawarma',
      'Kizhi Biryani'
    ], const [
      'Orange Juice',
      'Lemon Juice',
      'Lassi'
    ]),
    RestaurantCard("Califo", 4.3, false, const [
      'https://img.restaurantguru.com/w550/h367/rfc1-Califo-Restaurant-logo.jpg',
      'https://img.restaurantguru.com/c9cb-Califo-Restaurant-view.jpg',
      'https://img.restaurantguru.com/r98b-Califo-Restaurant-interior.jpg'
    ], const [
      'alfam',
      'shawai',
      'Shawarma',
      'Kizhi Biryani'
    ], const [
      'Orange Juice',
      'Lemon Juice',
      'Lassi'
    ]),
    RestaurantCard("Cafe Monarch", 3.7, true, const [
      'https://lh3.googleusercontent.com/p/AF1QipPrP4w5kwv8FxjBVYTO12Ef3FQj2-sTKeEJbzg7=s1360-w1360-h1020'
    ], const [], const [])
  ];
  final newrestaurants = [
    RestaurantCard("Cafe Monarch", 3.7, true, const [
      'https://lh3.googleusercontent.com/p/AF1QipPrP4w5kwv8FxjBVYTO12Ef3FQj2-sTKeEJbzg7=s1360-w1360-h1020'
    ], const [], const [])
  ];
  final poprestaurants = [
    RestaurantCard("Spicy Villa family restaurant", 4.2, false, const [
      'https://10619-2.s.cdn12.com/rests/original/106_509754993.jpg',
      'https://img.restaurantguru.com/c48a-Spicy-villa-family-Restaurant-Vallikavu-design.jpg',
      'https://img.restaurantguru.com/re84-Spicy-villa-family-Restaurant-interior.jpg'
    ], const [
      'alfam',
      'shawai',
      'Shawarma',
      'Kizhi Biryani'
    ], const [
      'Orange Juice',
      'Lemon Juice',
      'Lassi'
    ]),
    RestaurantCard("Califo", 4.3, false, const [
      'https://img.restaurantguru.com/w550/h367/rfc1-Califo-Restaurant-logo.jpg',
      'https://img.restaurantguru.com/c9cb-Califo-Restaurant-view.jpg',
      'https://img.restaurantguru.com/r98b-Califo-Restaurant-interior.jpg'
    ], const [
      'alfam',
      'shawai',
      'Shawarma',
      'Kizhi Biryani'
    ], const [
      'Orange Juice',
      'Lemon Juice',
      'Lassi'
    ]),
  ];
  var varyingcards;
  var newvaryingcards;
  var popvaryingcards;
  @override
  void initState() {
    varyingcards = restaurantcards;
    newvaryingcards = newrestaurants;
    popvaryingcards = poprestaurants;
    super.initState();
  }

  void filtersearch(String query) {
    setState(() {
      if (selectedIndex == 0) {
        varyingcards = restaurantcards
            .where((item) =>
                item.title.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
      if (selectedIndex == 1) {
        newvaryingcards = newrestaurants
            .where((item) =>
                item.title.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
      if (selectedIndex == 2) {
        popvaryingcards = poprestaurants
            .where((item) =>
                item.title.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  int selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        key: _scaffoldKey,
        drawer: const Drawer(),
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
                      child: const Icon(Icons.menu),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20),
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
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
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
                            color: selectedIndex == 0
                                ? Colors.green
                                : Colors.black),
                      ),
                    ),
                    const SizedBox(
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
                            color: selectedIndex == 1
                                ? Colors.green
                                : Colors.black),
                      ),
                    ),
                    const SizedBox(
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
                            color: selectedIndex == 2
                                ? Colors.green
                                : Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 45,
                  width: width * 0.9,
                  child: TextField(
                    onChanged: (value) {
                      filtersearch(value);
                      print(varyingcards);
                    },
                    controller: editingController,
                    textAlignVertical: const TextAlignVertical(y: 1.0),
                    decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.search),
                      hintText: 'Search your location',
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(0, 156, 148, 148)),
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(0, 156, 148, 148)),
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: SizedBox(
                  height: 350,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 1,
                      itemBuilder: (BuildContext context, int index) {
                        if (selectedIndex == 0) {
                          return Row(children: varyingcards);
                        } else if (selectedIndex == 1) {
                          return Row(children: newvaryingcards);
                        } else {
                          return Row(children: popvaryingcards);
                        }
                      }),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
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
