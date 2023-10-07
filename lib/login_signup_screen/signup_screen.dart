// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_food_purchase/file_data/client_details.dart';
import 'package:ui_food_purchase/login_signup_screen/signin_screen.dart';

var index = 0;

class Signup_screen extends StatefulWidget {
  const Signup_screen({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Signup_screen_state();
  }
}

class Signup_screen_state extends State {
  ClientDetails? clientDetails;
  String firstName = '',
      lastName = '',
      emailId = '',
      mobile = '',
      password = '',
      confirmPassword = '';
  bool? checkValue = false, status = false;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailIdController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                  'Sign up Now',
                  style: GoogleFonts.abel(
                    color: Colors.lightGreen,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 15,
                ),
                child: Text(
                  'Please registration with data to continue \n'
                  'using our app.',
                  style: GoogleFonts.abel(
                    color: Colors.black38,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              //Text filed of form
              Padding(
                padding: const EdgeInsets.all(10),
                child: Card(
                  shadowColor: Colors.lightGreen,
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: signupScreen(context),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    'You have already have an Account ?',
                    style: GoogleFonts.abel(
                      color: Colors.black38,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      if (clientDetailsList.isNotEmpty) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Signin_screen(),
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
                        fontSize: 15,
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

  //signup database screen
  signupScreen(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(),
          child: TextField(
            controller: firstNameController,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.person,
                color: Colors.lightGreen,
              ),
              hintText: 'First Name',
              hintStyle:
                  GoogleFonts.abel(fontWeight: FontWeight.w400, fontSize: 15),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 10,
          ),
          child: TextField(
            controller: lastNameController,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.person,
                color: Colors.lightGreen,
              ),
              hintText: 'Last Name',
              hintStyle:
                  GoogleFonts.abel(fontWeight: FontWeight.w400, fontSize: 15),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 10,
          ),
          child: TextField(
            controller: emailIdController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.email_outlined,
                color: Colors.lightGreen,
              ),
              hintText: 'Email Id',
              hintStyle:
                  GoogleFonts.abel(fontWeight: FontWeight.w400, fontSize: 15),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 10,
          ),
          child: TextField(
            controller: mobileController,
            keyboardType: TextInputType.number,
            maxLength: 10,
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.email_outlined,
                color: Colors.lightGreen,
              ),
              hintText: 'Mobile number',
              hintStyle:
                  GoogleFonts.abel(fontWeight: FontWeight.w400, fontSize: 15),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 10,
          ),
          child: TextField(
            controller: passwordController,
            keyboardType: TextInputType.text,
            obscureText: true,
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.lock_outline,
                color: Colors.lightGreen,
              ),
              hintText: 'Password',
              suffixIcon: const Icon(Icons.remove_red_eye_outlined,
                  color: Colors.lightGreen),
              hintStyle:
                  GoogleFonts.abel(fontWeight: FontWeight.w400, fontSize: 15),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 10,
          ),
          child: TextField(
            controller: confirmPasswordController,
            keyboardType: TextInputType.text,
            obscureText: true,
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.lock_outline,
                color: Colors.lightGreen,
              ),
              hintText: 'Confirm Password',
              suffixIcon: const Icon(Icons.remove_red_eye_outlined,
                  color: Colors.lightGreen),
              hintStyle:
                  GoogleFonts.abel(fontWeight: FontWeight.w400, fontSize: 15),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 10,
          ),
          child: Center(
            child: CheckboxListTile(
              checkColor: Colors.white,
              activeColor: Colors.lightGreen,
              value: checkValue,
              onChanged: (bool? value) {
                setState(() {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  checkValue = value;
                });
              },
              title: Text(
                  'By creating an account, you agree to our \nConditions of Use and Privacy Notice',
                  style: GoogleFonts.abel(
                      fontSize: 13,
                      color: Colors.black38,
                      fontWeight: FontWeight.bold)),
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
                if (passwordController.text != confirmPasswordController.text) {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Password and confirm Password Not match'),
                    ),
                  );
                } else if (checkValue == false) {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please accept condition box'),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  firstName = firstNameController.text;
                  lastName = lastNameController.text;
                  emailId = emailIdController.text;
                  mobile = mobileController.text;
                  password = passwordController.text;
                  confirmPassword = confirmPasswordController.text;
                  status = status;
                  clientDetailsMap[index] = {
                    'Id': index,
                    'First Name': firstName,
                    'Last Name': lastName,
                    'Email Id': emailId,
                    'Mobile Number': mobile,
                    'Password': password,
                    'Confirm Password': confirmPassword,
                    'Status': status,
                    'Address Details': {},
                  };
                  setState(() {
                    clientDetailsList.add(
                      clientDetailsMap[index]!,
                    );
                    Fluttertoast.showToast(
                      msg:
                          '${firstName.toUpperCase()} your account create successfully.. \ngo to login',
                      backgroundColor: Colors.lightGreen.shade50,
                      textColor: Colors.black,
                    );
                    print(clientDetailsList);
                    firstNameController.clear();
                    lastNameController.clear();
                    emailIdController.clear();
                    mobileController.clear();
                    passwordController.clear();
                    confirmPasswordController.clear();
                    status = false;
                    checkValue = false;
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Signin_screen(),
                      ),
                    );
                    index++;
                  });
                }
              },
              child: const Text('Register'),
            ),
          ),
        ),
      ],
    );
  }
}
