import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';

class Owner extends StatefulWidget {
  String? title;
  String? image;
  bool status = true;
  Owner(this.title, this.image, {Key? key}) : super(key: key);

  @override
  State<Owner> createState() => _OwnerState();
}

class _OwnerState extends State<Owner> {
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
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 45, 0, 30),
              child: Text(
                widget.title!,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontFamily: "RobotoMono",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: const Border(
                    top: BorderSide(width: 2, color: Colors.white),
                    left: BorderSide(width: 2, color: Colors.white),
                    right: BorderSide(width: 2, color: Colors.white),
                    bottom: BorderSide(width: 2, color: Colors.white),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
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
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Your restaurant status is:",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Recursive",
                  fontSize: 18,
                ),
              ),
            ),
            Container(
              height: 60,
              width: 320,
              child: getSlideActionWidget(widget.status),
            ),
          ],
        ),
      ),
    );
  }

  Widget getSlideActionWidget(bool status) {
    return status
        ? SlideAction(
            animationDuration: Duration(milliseconds: 400),
            key: ValueKey("slide_action_open"), // add key
            submittedIcon: Icon(Icons.lock_open),
            sliderButtonIcon: Icon(Icons.lock_outline),
            sliderButtonIconSize: 10,
            elevation: 4,
            text: "Slide to Open",
            textStyle: TextStyle(fontSize: 18, color: Colors.white),
            outerColor: Color.fromARGB(255, 227, 50, 38),
            innerColor: Colors.white54,
            onSubmit: () async {
              setState(() {
                widget.status = false;
                // Update the status variable
              });
            },
          )
        : SlideAction(
            animationDuration: Duration(milliseconds: 400),
            key: ValueKey("slide_action_close"), // add key
            submittedIcon: Icon(Icons.lock_outline),
            sliderButtonIcon: Icon(Icons.lock_open),
            sliderButtonIconSize: 10,
            elevation: 4,
            text: "Slide to Close",
            textStyle: TextStyle(fontSize: 18, color: Colors.white),
            outerColor: Color.fromARGB(255, 38, 227, 38),
            innerColor: Colors.white54,
            onSubmit: () async {
              setState(() {
                widget.status = true; // Update the status variable
              });
              await Future.delayed(Duration(seconds: 3));
            },
          );
  }
}
