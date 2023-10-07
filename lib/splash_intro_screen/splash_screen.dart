// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:ui_food_purchase/splash_intro_screen/intro_screen.dart';

class Splash_screen extends StatefulWidget {
  const Splash_screen({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Splash_screen_state();
  }
}

class Splash_screen_state extends State {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //splash screen function call
    splash_screen(context);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: mainSplash_screen(),
    );
  }
}

splash_screen(context) {
  Future.delayed(
      const Duration(
        seconds: 3,
      ), () {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => Intro_screen()),
    );
  });
}

Widget mainSplash_screen() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(
          'https://img.freepik.com/free-vector/food-drink-hand-drawn-flat-healthy-food-logo_23-2149632256.jpg?size=626&ext=jpg&ga=GA1.2.1403581971.1689158819&semt=ais',
        ),
        const SizedBox(
          height: 15,
        ),
        const CircularProgressIndicator(),
      ],
    ),
  );
}
