import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:openhours/Pages/RestaurantDetails.dart';
import 'package:openhours/Pages/Restaurants.dart';
import 'package:openhours/Pages/Owner.dart';
import 'package:openhours/Widgets/Textfields.dart';

class Loggedin {
  static var id;
  static var owner;
  static var email;
  static var resid;
}

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
                onPressed: () async {
                  FirebaseFirestore firestore = FirebaseFirestore.instance;
                  final auth = FirebaseAuth.instance;

                  await auth
                      .signInWithEmailAndPassword(
                          email: _emailcontroller.text,
                          password: _passwordcontroller.text)
                      .then((UserCredential) async {
                    Loggedin.id = UserCredential.user?.uid;
                    DocumentSnapshot snapshot = await firestore
                        .collection('users')
                        .doc(Loggedin.id)
                        .get();
                    Loggedin.owner =
                        (snapshot.data() as Map<String, dynamic>)['owner'];
                    Loggedin.email =
                        (snapshot.data() as Map<String, dynamic>)['email'];
                    Loggedin.resid =
                        (snapshot.data() as Map<String, dynamic>)['id'];
                    DocumentSnapshot secsnapshot = await firestore
                        .collection('Restaurant')
                        .doc("c6sf3ZpxLVkxksUSd236")
                        .get();
                    var data = secsnapshot.data();
                    var datalist =
                        (data as Map<String, dynamic>).values.toList();
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
