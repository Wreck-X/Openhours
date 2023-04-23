import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class PurpAppBar extends StatefulWidget {
  const PurpAppBar({super.key});

  @override
  State<PurpAppBar> createState() => _PurpAppBarState();
}

class _PurpAppBarState extends State<PurpAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: TextField(
          cursorColor: Colors.white,
          cursorHeight: 20,
          decoration: InputDecoration(
            suffixIconColor: MaterialStateColor.resolveWith((states) =>
                states.contains(MaterialState.focused)
                    ? Colors.white
                    : Colors.white),
            suffixIcon: const Icon(Icons.search),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
          ),
        ));
  }
}
