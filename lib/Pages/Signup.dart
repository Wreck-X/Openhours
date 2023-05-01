import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:openhours/Pages/Login.dart';
import 'package:openhours/Widgets/Textfields.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  var func = (value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  };
  TextEditingController _usernamecontroller = TextEditingController();
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
        decoration: const BoxDecoration(color: Color(0xffF8FAF9)),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Align(
              alignment: Alignment.center,
              child: Text(
                'Get Started now!',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              )),
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 2, 0, 30),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'Create account',
                style: TextStyle(
                    fontSize: 28,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: width * 0.8,
            height: height * 0.06,
            child:
                PurpTextField('Email address', false, _emailcontroller, func),
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
              style: TextButton.styleFrom(
                backgroundColor: Color(0xff209653),
                elevation: 0,
              ),
              onPressed: () {
                FirebaseAuth.instance
                    .createUserWithEmailAndPassword(
                        email: _emailcontroller.text,
                        password: _passwordcontroller.text)
                    .then((value) {
                  print("New account created");
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                }).onError((error, stackTrace) {
                  print("Error ${error.toString()}");
                });
              }, //signup
              child: const Text('Sign up',
                  style: TextStyle(
                      color: Colors.white, fontFamily: "Inter", fontSize: 20)),
            ),
          ),
        ]),
      ),
    );
  }
}
