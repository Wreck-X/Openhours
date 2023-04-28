import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class Owner extends StatefulWidget {
  final String? title;
  final String? image;
  const Owner(this.title, this.image, {Key? key}) : super(key: key);

  @override
  State<Owner> createState() => _OwnerState();
}

class _OwnerState extends State<Owner> {
  late PaletteGenerator _paletteGenerator;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _generatePalette();
  }

  Future<void> _generatePalette() async {
    final provider = NetworkImage(widget.image!);
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
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 45, 0, 30),
              child: Text(
                widget.title!,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontFamily: "Roboto Mono",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38.withOpacity(0.6),
                      spreadRadius: 8,
                      blurRadius: 10,
                      offset: Offset(0, 3),
                    ),
                  ],
                  border: Border(
                    top: BorderSide(width: 2, color: Colors.white),
                    left: BorderSide(width: 2, color: Colors.white),
                    right: BorderSide(width: 2, color: Colors.white),
                    bottom: BorderSide(width: 2, color: Colors.white),
                  ),
                ),
                child: Padding(
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
                            widget.image!,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
