import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:ui_food_purchase/home_screen/home_screen_main.dart';

class MakePayment extends StatefulWidget {
  String? emailId;
  int? paidAmount;

  MakePayment({this.emailId, this.paidAmount, super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MakePayemtnState(emailId!, paidAmount!);
  }
}

class MakePayemtnState extends State {
  String emailId;
  int paidAmount;

  MakePayemtnState(this.emailId, this.paidAmount);

  int i = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: mainAppBar(context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                LottieBuilder.network(
                  'https://lottie.host/44b7ff26-7f92-4ddc-9503-3b04028e41ff/V4BALsEDZ9.json',
                  height: 400,
                ),
                Card(
                  elevation: 10,
                  shadowColor: Colors.lightGreen.shade300,
                  child: Container(
                    height: 250,
                    width: 550,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.lightGreen.shade50,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.paypal, size: 35),
                              Text(
                                '**** **** **** 2535',
                                style: GoogleFonts.abel(
                                  color: Colors.black38,
                                  fontSize: 18,
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '₹. $paidAmount',
                                style: GoogleFonts.abel(
                                  color: Colors.black,
                                  fontSize: 35,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.paypal, size: 35),
                              Text(
                                '**** **** **** 2535',
                                style: GoogleFonts.abel(
                                  color: Colors.black38,
                                  fontSize: 18,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
