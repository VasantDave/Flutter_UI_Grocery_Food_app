// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_food_purchase/file_data/client_details.dart';
import 'package:ui_food_purchase/login_signup_screen/signin_screen.dart';
import 'package:ui_food_purchase/login_signup_screen/signup_screen.dart';

class Welcome_screen extends StatefulWidget {
  const Welcome_screen({super.key});

  //ClientDetails? clientDetails;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Welcome_screen_state();
  }
}

class Welcome_screen_state extends State {
  var imagelink =
      'https://img.freepik.com/free-vector/food-drink-hand-drawn-flat-healthy-food-logo_23-2149632256.jpg?size=626&ext=jpg&ga=GA1.2.1403581971.1689158819&semt=ais';

  //ClientDetails? clientDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: mainLoginScreen(context),
    );
  }
}

mainLoginScreen(BuildContext context) {
  return SafeArea(
    child: SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 15,
                left: 15,
              ),
              child: Text(
                'Welcome',
                style: GoogleFonts.abel(
                  color: Colors.lightGreen,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 5,
                left: 15,
              ),
              child: Text(
                'Please Login or Sign-up to continue using\nour app.',
                style: GoogleFonts.abel(
                  color: Colors.black38,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 5,
                //left: 15,
              ),
              child: Center(
                child: Image.asset(
                  'assets/images/food_veg.png',
                  height: 380,
                  width: 380,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 5,
                //left: 15,
              ),
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  'Enter via Social Networks',
                  style: GoogleFonts.abel(
                    color: Colors.lightGreen,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 5,
                //left: 15,
              ),
              child: Social_buttons(context),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Signup_screen()));
                },
                child: const Text('Sign Up'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(0),
              child: Container(
                alignment: Alignment.center,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    'You already have an Account ?',
                    style: GoogleFonts.abel(
                      color: Colors.black38,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      if (clientDetailsList.isNotEmpty) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Signin_screen(),
                          ),
                        );
                      } else {
                        Fluttertoast.showToast(
                          msg: 'Please Create Your Account first',
                          backgroundColor: Colors.lightGreen.shade50,
                          textColor: Colors.black,
                        );
                      }
                    },
                    child: Text(
                      'Login',
                      style: GoogleFonts.abel(
                        color: Colors.lightGreen,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Social_buttons(context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Card(
        color: Colors.white,
        shadowColor: Colors.lightGreen,
        shape: const CircleBorder(),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            splashColor: Colors.lightGreen,
            onPressed: () {},
            icon: const FaIcon(FontAwesomeIcons.facebookF, color: Colors.blue),
          ),
        ),
      ),
      const SizedBox(width: 10),
      Card(
        color: Colors.white,
        shadowColor: Colors.lightGreen,
        shape: const CircleBorder(),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            splashColor: Colors.lightGreen,
            onPressed: () {},
            icon: const FaIcon(FontAwesomeIcons.twitter, color: Colors.blue),
          ),
        ),
      ),
      const SizedBox(width: 10),
      Card(
        color: Colors.white,
        shadowColor: Colors.lightGreen,
        shape: const CircleBorder(),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            splashColor: Colors.lightGreen,
            onPressed: () {},
            icon: const FaIcon(
              FontAwesomeIcons.google,
              color: Colors.redAccent,
            ),
          ),
        ),
      ),
    ],
  );
}
