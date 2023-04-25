import 'package:flutter/material.dart';
import 'package:openhours/Widgets/customappbar.dart';

class Foodcard extends StatefulWidget {
  List food;
  Foodcard(this.food, {Key? key}) : super(key: key);

  @override
  State<Foodcard> createState() => _FoodcardState();
}

class _FoodcardState extends State<Foodcard> {
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
        child: Column(children: [
          PurpAppBar("Enter item name"),
          Expanded(
            child: ListView.builder(
              itemCount: widget.food.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  color: Color.fromARGB(34, 255, 255, 255),
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  child: ListTile(
                    title: Text(
                      widget.food[index],
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Recursive',
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ]),
      ),
    );
  }
}
