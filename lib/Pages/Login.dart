import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:openhours/Pages/RestaurantDetails.dart';
import 'package:openhours/Pages/Restaurants.dart';
import 'package:openhours/Pages/Owner.dart';
import 'package:openhours/Widgets/Textfields.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var func = (value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  };
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
          color: Color(0xffF8FAF9),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Login',
                style: TextStyle(
                    fontSize: 31,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Welcome back!',
                style: TextStyle(
                    fontSize: 28,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: width * 0.8,
              height: height * 0.06,
              child: PurpTextField('Email', false, _emailcontroller, func),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: width * 0.8,
              height: height * 0.06,
              child: PurpTextField('Password', true, _passwordcontroller, func),
            ),
            const SizedBox(height: 60),
            SizedBox(
              width: width * 0.6,
              height: height * 0.06,
              child: ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: _emailcontroller.text,
                          password: _passwordcontroller.text)
                      .then((value) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Restaurants()));
                  }).onError((error, stackTrace) {
                    print('Error ${error.toString()}');
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff209653),
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(
                      color: Colors.white, fontFamily: "Inter", fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
