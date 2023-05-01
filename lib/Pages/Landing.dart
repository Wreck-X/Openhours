import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:openhours/Pages/Login.dart';
import 'package:openhours/Pages/Signup.dart';
import 'package:openhours/Pages/RestaurantDetails.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
          color: Color(0xffF8FAF9),
        ),
        child: Column(
          children: [
            SizedBox(
              height: height * 0.5,
              width: width,
            ),
            SizedBox(
              width: width * 0.8,
              height: height * 0.06,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff209653),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                child: const Text('Login',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20)), //Navigate to Login page),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: width * 0.8,
              height: height * 0.06,
              child: ElevatedButton(
                style: TextButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    side:
                        const BorderSide(width: 1.0, color: Color(0xff209653))),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignupPage()));
                }, // Navigate to Sign up Page
                child: const Text('Sign up',
                    style: TextStyle(color: Color(0xff209653), fontSize: 20)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
