import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class PurpTextField extends StatefulWidget {
  String entry;
  bool ispassword;
  PurpTextField(this.entry, this.ispassword, {super.key});

  @override
  State<PurpTextField> createState() => _PurpTextFieldState();
}

class _PurpTextFieldState extends State<PurpTextField> {
  bool _isObscure = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height * 0.8,
      width: width * 0.06,
      child: TextField(
        obscureText: widget.ispassword ? _isObscure : false,
        decoration: InputDecoration(
          suffixIconColor: MaterialStateColor.resolveWith((states) =>
              states.contains(MaterialState.focused)
                  ? Colors.black
                  : Colors.black),
          suffixIcon: widget.ispassword
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                  icon: Icon(
                      _isObscure ? Icons.visibility_off : Icons.visibility))
              : null,
          filled: true,
          fillColor: const Color.fromARGB(255, 196, 185, 252),
          hintText: widget.entry,
          hintStyle: const TextStyle(color: Colors.white),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(6)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(6)),
          ),
        ),
        cursorColor: Colors.white,
      ),
    );
  }
}
