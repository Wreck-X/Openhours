import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Menucards extends StatefulWidget {
  String prompt = '';
  Menucards(this.prompt, {super.key});
  @override
  State<Menucards> createState() => _MenucardsState();
}

class _MenucardsState extends State<Menucards> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height * 0.23,
      width: width * 0.43,
      child: Container( //signup
        child: Text(widget.prompt, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
