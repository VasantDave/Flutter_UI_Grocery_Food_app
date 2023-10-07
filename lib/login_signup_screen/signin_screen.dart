// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:ui_food_purchase/file_data/client_details.dart';
import 'package:ui_food_purchase/home_screen/home_screen_main.dart';
import 'package:ui_food_purchase/login_signup_screen/signup_screen.dart';

class Signin_screen extends StatefulWidget {
  //List clientDetailsList;

  const Signin_screen({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Signin_screen_state();
  }
}

class Signin_screen_state extends State {
  //List clientDetailsList;
  String emailId = '', password = '';
  final TextEditingController? emailController = TextEditingController();
  final TextEditingController? passwordController = TextEditingController();

  //ClientDetails? _clientDetails;
  var indexData = clientDetailsList.map((e) => e['Id']);
  var emailData = clientDetailsList.map((e) => e['Email Id']);
  var passwordData = clientDetailsList.map((e) => e['Password']);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: signInScreenDesign(context),
    );
  }

  //signin screen design
  signInScreenDesign(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 15,
                  left: 15,
                ),
                child: Text(
                  'Login Now',
                  style: GoogleFonts.abel(
                    color: Colors.lightGreen,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 0,
                  left: 15,
                ),
                child: Text(
                  'Please Login to continue using our app.',
                  style: GoogleFonts.abel(
                    color: Colors.black38,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              signInScreen(context),
              Container(
                alignment: Alignment.center,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    'Don\'t have an Account ?',
                    style: GoogleFonts.abel(
                      color: Colors.black38,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Signup_screen(),
                        ),
                      );
                    },
                    child: Text(
                      'Sign-up',
                      style: GoogleFonts.abel(
                        color: Colors.lightGreen,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //signin database screen
  signInScreen(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Card(
        shadowColor: Colors.lightGreen,
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              LottieBuilder.network(
                'https://lottie.host/bd641e2d-f88f-4316-ad7b-35a7165a371c/yhgL8J4OdR.json',
                height: 230,
              ),
              Padding(
                padding: const EdgeInsets.only(),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.email_outlined,
                      color: Colors.lightGreen,
                    ),
                    hintText: 'Email Id',
                    hintStyle: GoogleFonts.abel(
                        fontWeight: FontWeight.w400, fontSize: 15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 15,
                ),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.lock_outline,
                      color: Colors.lightGreen,
                    ),
                    hintText: 'Password',
                    hintStyle: GoogleFonts.abel(
                        fontWeight: FontWeight.w400, fontSize: 15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 200),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forgot password ?',
                    style: GoogleFonts.abel(
                      color: Colors.black38,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                ),
                child: Card(
                  elevation: 0,
                  child: ElevatedButton(
                    onPressed: () {
                      emailId = '';
                      password = '';
                      emailId = emailController!.text;
                      password = passwordController!.text;
                      for (var i = 0; i < clientDetailsList.length; i++) {
                        if (emailId == emailData.elementAt(i)) {
                          if (password == passwordData.elementAt(i)) {
                            print(
                                '${emailData.elementAt(i)}\n${passwordData.elementAt(i)}\n$emailId\t$password\n\n$clientDetailsList');
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    Home_screen_main(emailId: emailId),
                              ),
                            );
                            emailController!.clear();
                            passwordController!.clear();
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Password Not Match'),
                              ),
                            );
                            emailController!.clear();
                            passwordController!.clear();
                          }
                          //print(emailId);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Invalid Credentials'),
                            ),
                          );
                          emailController!.clear();
                          passwordController!.clear();
                        }
                      }
                      emailController!.clear();
                      passwordController!.clear();
                    },
                    child: const Text('Login in'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
