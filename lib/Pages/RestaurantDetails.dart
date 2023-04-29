import 'package:flutter/material.dart';
import 'package:openhours/Widgets/customappbar.dart';
import '../Widgets/menucards.dart';
import 'Foodcard.dart';
import 'Drinkscard.dart';
import 'package:palette_generator/palette_generator.dart';

class RestaurantDetails extends StatefulWidget {
  String image;
  List food;
  List drinks;
  RestaurantDetails(this.image, this.food, this.drinks, {Key? key})
      : super(key: key);

  @override
  State<RestaurantDetails> createState() => _RestaurantDetailsState();
}

class _RestaurantDetailsState extends State<RestaurantDetails> {
  late PaletteGenerator _paletteGenerator;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _generatePalette();
  }

  Future<void> _generatePalette() async {
    final provider = NetworkImage(widget.image);
    _paletteGenerator = await PaletteGenerator.fromImageProvider(provider);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    final primaryColor =
        _isLoading ? Colors.transparent : _paletteGenerator.vibrantColor?.color;
    final secondaryColor = _isLoading
        ? Colors.transparent
        : _paletteGenerator.lightMutedColor?.color;

    return Scaffold(
      body: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              primaryColor!,
              secondaryColor!,
            ],
          ),
        ),
        child: Column(
          children: [
            PurpAppBar("Enter restaurant name"),
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
                        borderRadius: BorderRadius.circular(40),
                        child: Card(
                          elevation: 16.0,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Image.network(
                                widget.image,
                              ),
                            ),
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
                          style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'Recursive'),
                        ),
                      ),
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Padding(
                          padding: const EdgeInsets.fromLTRB(16, 0, 8, 0),
                          child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Foodcard(widget.food)),
                                );
                              },
                              child: Menucards('Food'))),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 16, 0),
                          child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Drinkscard(widget.drinks)),
                                );
                              },
                              child: Menucards('Drinks')))
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
