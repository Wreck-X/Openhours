import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:openhours/Pages/Landing.dart';
import 'package:openhours/Pages/Login.dart';
import 'package:openhours/Pages/ProductDetailsPage.dart';
import 'package:openhours/Widgets/RestaurantCard.dart';
import 'package:openhours/Widgets/appdrawer.dart';
import '../Widgets/customappbar.dart';

class Datalist {
  static var data;
  static List<RestaurantCard> restaurantcards = [];
}

class Restaurants extends StatefulWidget {
  Restaurants({super.key});
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<List<RestaurantCard>> getRestaurantCards() async {
    var doc = await firestore
        .collection('Restaurant')
        .doc("c6sf3ZpxLVkxksUSd236")
        .get();
    var data = doc.data();
    var datalist = (data as Map<String, dynamic>).values.toList();
    Datalist.data = datalist[0];
    return Datalist.data.map<RestaurantCard>((item) {
      return RestaurantCard(item['title'], item['rating'], item['status'],
          item['image'], item['avail'], item['desc']);
    }).toList();
  }

  @override
  State<Restaurants> createState() => _RestaurantsState();
}

class _RestaurantsState extends State<Restaurants> {
  TextEditingController editingController = TextEditingController();

  var newvaryingcards;
  var popvaryingcards;
  var varyingcards;

  final newrestaurants = [
    RestaurantCard(
        "Cafe Monarch",
        3.7,
        true,
        'https://10619-2.s.cdn12.com/rests/original/109_504980439.jpg',
        ['N/A'],
        'Many people come to order perfectly cooked shawarma. Coffee that you can try is good. Its always a good idea to try something new, enjoying the charming atmosphere. As for the Google rating, this restaurant earned 4.3.')
  ];
  final poprestaurants = [
    RestaurantCard(
        "Spicy Villa family restaurant",
        4.2,
        false,
        'https://10619-2.s.cdn12.com/rests/original/106_509754993.jpg',
        ['Swiggy'],
        'This restaurant offers food delivery for the convenience of its customers. Most visitors mark that the service is decent. The exotic atmosphere will be exactly just what you need after a long working day. But google users rated Spicy villa family Restaurant and it didnt earn a high rating.'),
    RestaurantCard(
        "Califo",
        4.3,
        false,
        'https://content3.jdmagicbox.com/comp/kollam/r8/9999px474.x474.220920205800.m4r8/catalogue/califo-restaurant-amrithapuri-kollam-restaurants-3o7lrr85w2.jpg',
        ['Zomato'],
        'In accordance with the guests opinions, waiters serve nicely cooked chicken biryani and good fried chicken here. When visiting this restaurant, it is a must to try delicious juice. Visitors say that the service is prompt here. But Califo Restaurant has been rated below average by Google.'),
  ];

  void filtersearch(String query) {
    setState(() {
      if (selectedIndex == 0) {
        varyingcards = Datalist.restaurantcards
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
    CollectionReference reference =
        FirebaseFirestore.instance.collection('Restaurant');
    return Scaffold(
        resizeToAvoidBottomInset: false,
        key: _scaffoldKey,
        drawer: SideDrawer(width: width),
        body: Container(
          height: height,
          width: width,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 30, 0, 20),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        _scaffoldKey.currentState?.openDrawer();
                      },
                      child: const Icon(Icons.menu),
                    ),
                    SizedBox(
                      width: width * 0.15,
                    ),
                    const Text(
                      "OPEN HOURS",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Inter"),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 14.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
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
                        ],
                      )),
                    ]),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
                child: Wrap(
                  spacing: 50,
                  children: [
                    GestureDetector(
                      onTap: () {
                        print(Datalist.data);
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
              SizedBox(height: 35),
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
                    child: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection("Restaurant")
                            .doc('c6sf3ZpxLVkxksUSd236')
                            .snapshots(),
                        builder: (context, snapshot) {
                          final docs = snapshot.data?.data();
                          print('something $docs');
                          // var datalist = (data as Map<String, dynamic>).values.toList();

                          return ListView.builder(
                              itemCount: 4,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                var document = snapshot.data;
                                if (selectedIndex == 0) {
                                  return Row(children: []);
                                } else if (selectedIndex == 1) {
                                  return Row(children: newvaryingcards);
                                } else {
                                  return Row(children: popvaryingcards);
                                }
                              });
                        })),
              ),
            ],
          ),
        ));
  }
}

class SideDrawer extends StatelessWidget {
  const SideDrawer({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xfff5f5f5),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: 60,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 10, 15),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.black,
                    width: 2.5,
                  ),
                ),
                child: CircleAvatar(
                  backgroundColor: Color(0xfff5f5f5),
                  radius: 30,
                  backgroundImage: NetworkImage(
                      'https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png'),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  "Hello 👋",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: "Inter",
                      fontSize: 26),
                ),
                FittedBox(
                    child: Text(
                  "satvmishi@gmail.com",
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontFamily: "Inter",
                      fontSize: 16),
                ))
              ]),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
          child: Container(
            height: 1.0,
            width: width,
            color: Colors.black,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () async {
                  var logged = Loggedin();
                  FirebaseFirestore firestore = FirebaseFirestore.instance;
                  DocumentSnapshot snapshot = await firestore
                      .collection('users')
                      .doc(Loggedin.id)
                      .get();
                  if (snapshot.exists) {
                    var owner =
                        (snapshot.data() as Map<String, dynamic>)['owner'];
                    var title = (snapshot.data()
                        as Map<String, dynamic>)['restauranttitle'];
                    var status =
                        (snapshot.data() as Map<String, dynamic>)['status'];
                    var image =
                        (snapshot.data() as Map<String, dynamic>)['image'];
                    var avail = (snapshot.data()
                        as Map<String, dynamic>)['availableon'];
                    var desc =
                        (snapshot.data() as Map<String, dynamic>)['desc'];
                    var rating =
                        (snapshot.data() as Map<String, dynamic>)['rating'];

                    if (owner) ;
                    {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => productdetailspage(
                                  title, desc, rating, avail, image)));
                    }
                  }
                },
                child: const Text(
                  "Status",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: "Ubuntu",
                      fontSize: 20,
                      color: Color(0xff9C9C9C)),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
                child: Container(
                  height: 2.0,
                  width: width,
                  color: Colors.grey,
                ),
              ),
              GestureDetector(
                onTap: () {
                  FirebaseAuth.instance.signOut().then((value) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LandingPage()));
                  });
                },
                child: Text(
                  "Logout",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: "Ubuntu",
                      fontSize: 20,
                      color: Color(0xff9C9C9C)),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
                child: Container(
                  height: 2.0,
                  width: width,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
