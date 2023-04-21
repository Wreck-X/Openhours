import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class PurpTextField extends StatefulWidget {
  const PurpTextField({super.key});

  @override
  State<PurpTextField> createState() => _PurpTextFieldState();
}

class _PurpTextFieldState extends State<PurpTextField> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: null,
      width: null,
      child: const TextField(
        decoration: InputDecoration(),
      ),
    );
  }
}
