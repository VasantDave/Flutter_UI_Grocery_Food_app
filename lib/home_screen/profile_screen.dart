import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ui_food_purchase/splash_intro_screen/welcome_screen.dart';

import '../file_data/client_details.dart';

File? imageFile;
ImagePicker imagePicker = ImagePicker();

class ProfileScreen extends StatefulWidget {
  String? emailId;

  ProfileScreen({super.key, this.emailId});

  @override
  State<StatefulWidget> createState() => ProfileScreenState(emailId!);
}

class ProfileScreenState extends State {
  String emailId;

  ProfileScreenState(this.emailId);

  var emailData = clientDetailsList.map((e) => e['Email Id']);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Card(
              elevation: 5,
              //color: Colors.lightGreen,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      height: 30,
                      width: double.maxFinite,
                      color: Colors.white,
                      alignment: Alignment.center,
                      child: Text(
                        'My Account',
                        style: GoogleFonts.abel(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Card(
                      elevation: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          accountDrawer(context),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Card(
                      child: Column(
                        children: [
                          accountDetails(context),
                          ListTile(
                            title: const Text('Sign Out'),
                            leading: const Icon(Icons.logout),
                            onTap: () {
                              Fluttertoast.showToast(
                                msg: 'Sign Out Sucessfully',
                                backgroundColor: Colors.lightGreen.shade50,
                                textColor: Colors.black,
                              );
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const Welcome_screen()),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  accountDrawer(BuildContext context) {
    for (var i = 0; i < clientDetailsList.length; i++) {
      if (emailId == emailData.elementAt(i)) {
        return Padding(
          padding: const EdgeInsets.only(top: 25, bottom: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: 15),
              InkWell(
                onTap: () {
                  setState(() {
                    showAboutDialog(context);
                  });
                },
                child: CircleAvatar(
                  backgroundColor: Colors.lightGreen.shade100,
                  radius: 30,
                  child: imageFile == null
                      ? Text(
                          'No Image',
                          style: GoogleFonts.abel(
                            color: Colors.black38,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : CircleAvatar(
                          radius: 28,
                          backgroundImage: Image.file(imageFile!).image),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${clientDetailsList.map((e) => e['First Name']).elementAt(i)}',
                    style: GoogleFonts.abel(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${clientDetailsList.map((e) => e['Email Id']).elementAt(i)}',
                    style: GoogleFonts.abel(
                      color: Colors.black54,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    '${clientDetailsList.map((e) => e['Mobile Number']).elementAt(i)}',
                    style: GoogleFonts.abel(
                      color: Colors.black54,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  FontAwesomeIcons.pen,
                  size: 12,
                ),
              ),
            ],
          ),
        );
      }
    }
  }

  accountDetails(BuildContext context) {
    for (var i = 0; i < clientDetailsList.length; i++) {
      if (emailId == emailData.elementAt(i)) {
        return Padding(
          padding: const EdgeInsets.only(top: 25, bottom: 25),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                RichText(
                  text: TextSpan(
                      text: 'First Name :- ',
                      style: GoogleFonts.abel(
                        color: Colors.black,
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text:
                              '${clientDetailsList.map((e) => e['First Name']).elementAt(i)}',
                          style: GoogleFonts.abel(
                            color: Colors.black45,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ]),
                ),
                const SizedBox(height: 3),
                const Divider(
                  color: Colors.lightGreen,
                ),
                const SizedBox(height: 3),
                RichText(
                  text: TextSpan(
                      text: 'Last Name :- ',
                      style: GoogleFonts.abel(
                        color: Colors.black,
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text:
                              '${clientDetailsList.map((e) => e['Last Name']).elementAt(i)}',
                          style: GoogleFonts.abel(
                            color: Colors.black45,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ]),
                ),
                const SizedBox(height: 3),
                const Divider(
                  color: Colors.lightGreen,
                ),
                const SizedBox(height: 3),
                RichText(
                  text: TextSpan(
                      text: 'Email Id :- ',
                      style: GoogleFonts.abel(
                        color: Colors.black,
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text:
                              '${clientDetailsList.map((e) => e['Email Id']).elementAt(i)}',
                          style: GoogleFonts.abel(
                            color: Colors.black45,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ]),
                ),
                const SizedBox(height: 3),
                const Divider(
                  color: Colors.lightGreen,
                ),
                const SizedBox(height: 3),
                RichText(
                  text: TextSpan(
                      text: 'Mobile Number :- ',
                      style: GoogleFonts.abel(
                        color: Colors.black,
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text:
                              '${clientDetailsList.map((e) => e['Mobile Number']).elementAt(i)}',
                          style: GoogleFonts.abel(
                            color: Colors.black45,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ]),
                ),
                const SizedBox(height: 3),
              ],
            ),
          ),
        );
      }
    }
  }

  showAboutDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Profile Photo'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                GestureDetector(
                  child: const Row(
                    children: [
                      Icon(Icons.image),
                      SizedBox(width: 10),
                      Text("From Gallery"),
                    ],
                  ),
                  onTap: () {
                    pickImageGallery();
                  },
                ),
                const Padding(padding: EdgeInsets.all(4.0)),
                const Divider(),
                const Padding(padding: EdgeInsets.all(4.0)),
                GestureDetector(
                  child: const Row(
                    children: [
                      Icon(Icons.camera),
                      SizedBox(width: 10),
                      Text("From Camera"),
                    ],
                  ),
                  onTap: () {
                    pickImageCamera();
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void pickImageCamera() async {
    XFile? pickFile = await imagePicker.pickImage(source: ImageSource.camera);
    if (pickFile != null) {
      setState(() {
        imageFile = File(pickFile.path);
      });
    }
  }

  void pickImageGallery() async {
    XFile? pickFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickFile != null) {
      setState(() {
        imageFile = File(pickFile.path);
      });
    }
  }
}
