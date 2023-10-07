// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:ui_food_purchase/file_data/intro_details.dart';
import 'package:ui_food_purchase/splash_intro_screen/welcome_screen.dart';

class Intro_screen extends StatefulWidget {
  const Intro_screen({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Intro_screen_state();
  }
}

class Intro_screen_state extends State {
  int currentIndex = 0;
  PageController? controller;

  @override
  void initState() {
    // TODO: implement initState
    controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: mainIntro_data(),
    );
  }

  //intro counter view
  buildDot(int index, BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 10,
        width: currentIndex == index ? 25 : 10,
        margin: EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.green,
        ),
      ),
    );
  }

  //main intro page design
  Widget mainIntro_data() {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: controller,
            itemCount: introDetails.length,
            onPageChanged: (int index) {
              setState(
                () {
                  currentIndex = index;
                },
              );
            },
            itemBuilder: (context, index) {
              return introData(index, context);
            },
          ),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              introDetails.length,
              (index) => buildDot(index, context),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 10,
            bottom: 10,
          ),
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                if (currentIndex == introDetails.length - 1) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Welcome_screen(),
                    ),
                  );
                }
                controller?.nextPage(
                  duration: Duration(milliseconds: 150),
                  curve: Curves.decelerate,
                );
              });
            },
            child: Text(
                currentIndex == introDetails.length - 1 ? "Continue" : "Next"),
          ),
        ),
      ],
    );
  }

  //intro page data
  introData(int index, BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LottieBuilder.network(
              introDetails[index].imagePath!,
              //height: 400,
            ),
            SizedBox(height: 15),
            Text(
              introDetails[index].title!,
              style: GoogleFonts.abel(
                color: Colors.green,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15),
            Text(
              introDetails[index].subTitle!,
              style: GoogleFonts.abel(
                color: Colors.black38,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
