import 'package:flutter/material.dart';

class productdetailspage extends StatefulWidget {
  String title;
  String desc;
  double rating;
  List avail;
  String image;

  productdetailspage(this.title, this.desc, this.rating, this.avail, this.image,
      {Key? key})
      : super(key: key);

  @override
  State<productdetailspage> createState() => _productdetailspageState();
}

class _productdetailspageState extends State<productdetailspage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(widget.image), fit: BoxFit.fitHeight),
        ),
        child: Stack(children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.transparent,
                    Colors.transparent,
                    Colors.black,
                    Colors.black
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text(widget.title,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 26)),
                ),
                Text(widget.desc,
                    style: TextStyle(color: Colors.white, fontSize: 16)),
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Align(
                      alignment: Alignment.bottomLeft,
                      child: IntrinsicWidth(
                        child: Container(
                          constraints: BoxConstraints.tightFor(),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            color: Colors.transparent,
                            border: Border.all(
                              color: Colors.white,
                              width: 3.0,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.white,
                                  size: 20.0,
                                ),
                                Text(
                                  widget.rating.toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )),
                ),
                SizedBox(
                  height: 12.5,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.transparent,
                        ),
                        child: Column(children: [
                          Text(
                            'Available at:',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          ...widget.avail
                              .map((item) => Text(
                                    item,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ))
                              .toList()
                        ]),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.05)
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
