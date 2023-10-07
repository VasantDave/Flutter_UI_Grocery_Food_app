import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_food_purchase/file_data/client_details.dart';
import 'package:ui_food_purchase/home_screen/home_screen_main.dart';

import '../file_data/address_details.dart';

class AddressScreen extends StatefulWidget {
  String? emailId;

  AddressScreen({super.key, this.emailId});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AddressScreenState(emailId!);
  }
}

class AddressScreenState extends State {
  String emailId;

  AddressScreenState(this.emailId);

  var indexData = clientDetailsList.map((e) => e['Id']);
  var emailData = clientDetailsList.map((e) => e['Email Id']);
  var i;

  TextEditingController houseNoController = TextEditingController();
  TextEditingController floorNoController = TextEditingController();
  TextEditingController towerNoController = TextEditingController();
  TextEditingController buildingNameController = TextEditingController();
  TextEditingController landMarkController = TextEditingController();
  TextEditingController cityNameController = TextEditingController();
  TextEditingController stateNameController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  String saveAs = 'Home';
  bool? checkValue = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: mainAppBar(context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Card(
              elevation: 5,
              child: Container(
                width: double.maxFinite,
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Address Details',
                        style: GoogleFonts.abel(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      addressDetails(context),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  addressDetails(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(),
            child: TextField(
              controller: houseNoController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.house,
                  color: Colors.lightGreen,
                ),
                hintText: 'House No',
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
              controller: floorNoController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.holiday_village_outlined,
                  color: Colors.lightGreen,
                ),
                hintText: 'Floor No',
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
              controller: towerNoController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.apartment,
                  color: Colors.lightGreen,
                ),
                hintText: 'Tower No',
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
              controller: buildingNameController,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.apartment_outlined,
                  color: Colors.lightGreen,
                ),
                hintText: 'Building / Apartment Name',
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
              controller: landMarkController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.area_chart,
                  color: Colors.lightGreen,
                ),
                hintText: 'Landmark / Area',
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
              controller: cityNameController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.area_chart,
                  color: Colors.lightGreen,
                ),
                hintText: 'City Name',
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
              controller: stateNameController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.area_chart,
                  color: Colors.lightGreen,
                ),
                hintText: 'State Name',
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
              controller: pinCodeController,
              keyboardType: TextInputType.number,
              maxLength: 6,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.onetwothree,
                  color: Colors.lightGreen,
                ),
                hintText: 'Pin Code',
                hintStyle:
                    GoogleFonts.abel(fontWeight: FontWeight.w400, fontSize: 15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Radio(
                      value: 'Home',
                      groupValue: saveAs,
                      onChanged: (value) {
                        setState(
                          () {
                            saveAs = value.toString();
                            print(saveAs);
                          },
                        );
                      },
                    ),
                    Text('Home'),
                  ],
                ),
                Row(children: [
                  Radio(
                    value: 'Work',
                    groupValue: saveAs,
                    onChanged: (value) {
                      setState(
                        () {
                          saveAs = value.toString();
                          print(saveAs);
                        },
                      );
                    },
                  ),
                  Text('Work'),
                ]),
                Row(children: [
                  Radio(
                    value: 'Office',
                    groupValue: saveAs,
                    onChanged: (value) {
                      setState(
                        () {
                          saveAs = value.toString();
                          print(saveAs);
                        },
                      );
                    },
                  ),
                  Text('Office'),
                ]),
              ],
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
                title: Text('Confirm our Address Details is correct',
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
                  for (i = 0; i < clientDetailsList.length; i++) {
                    if (clientDetailsMap[indexData.elementAt(i)]
                        .containsKey('Address Details')) {
                      setState(() {
                        print(indexData.elementAt(i));
                        ScaffoldMessenger.of(context).clearSnackBars();
                        addressDetailsMap = {
                          'House No': houseNoController.text,
                          'Floor No': floorNoController.text,
                          'Tower No': towerNoController.text,
                          'Building Name': buildingNameController.text,
                          'Landmark': landMarkController.text,
                          'City Name': cityNameController.text,
                          'State Name': stateNameController.text,
                          'Pin Code': pinCodeController.text,
                          'Save As': saveAs,
                        };
                        clientDetailsMap[indexData.elementAt(i)].update(
                            'Address Details', (value) => addressDetailsMap);
                        print(clientDetailsList);
                        Fluttertoast.showToast(
                          msg: 'Your Address data save successfully..',
                          backgroundColor: Colors.lightGreen.shade50,
                          textColor: Colors.black,
                        );
                      });
                      checkValue = false;
                      houseNoController.clear();
                      floorNoController.clear();
                      towerNoController.clear();
                      buildingNameController.clear();
                      landMarkController.clear();
                      cityNameController.clear();
                      stateNameController.clear();
                      pinCodeController.clear();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Home_screen_main(
                            emailId: emailId,
                          ),
                        ),
                      );
                      break;
                    }
                  }
                },
                // setState(() {
                //   for (i = 0; i < clientDetailsList.length; i++) {
                //     if (clientDetailsMap[indexData.elementAt(i)]
                //             .containsKey('Address Details') ==
                //         null) {
                //       print(
                //           '${clientDetailsMap[indexData.elementAt(i)].containsKey('Address Details')}\n\n${emailData.elementAt(i)}');
                //       // if (checkValue == false) {
                //       //   ScaffoldMessenger.of(context).clearSnackBars();
                //       //   ScaffoldMessenger.of(context).showSnackBar(
                //       //     const SnackBar(
                //       //       content: Text('Please accept condition box'),
                //       //     ),
                //       //   );
                //       // } else {
                //       //   print(indexData.elementAt(i));
                //       //   ScaffoldMessenger.of(context).clearSnackBars();
                //       //   addressDetailsMap = {
                //       //     'House No': houseNoController.text,
                //       //     'Floor No': floorNoController.text,
                //       //     'Tower No': towerNoController.text,
                //       //     'Building Name': buildingNameController.text,
                //       //     'Landmark': landMarkController.text,
                //       //     'City Name': cityNameController.text,
                //       //     'State Name': stateNameController.text,
                //       //     'Pin Code': pinCodeController.text,
                //       //     'Save As': saveAs,
                //       //   };
                //       //   clientDetailsMap[indexData.elementAt(i)].update(
                //       //       'Address Details', (value) => addressDetailsMap);
                //       //   print(clientDetailsList);
                //       //   Fluttertoast.showToast(
                //       //     msg: 'Your Address data save successfully..',
                //       //     backgroundColor: Colors.lightGreen.shade50,
                //       //     textColor: Colors.black,
                //       //   );
                //       //   checkValue = false;
                //       //   houseNoController.clear();
                //       //   floorNoController.clear();
                //       //   towerNoController.clear();
                //       //   buildingNameController.clear();
                //       //   landMarkController.clear();
                //       //   cityNameController.clear();
                //       //   stateNameController.clear();
                //       //   pinCodeController.clear();
                //       //   Navigator.push(
                //       //     context,
                //       //     MaterialPageRoute(
                //       //       builder: (context) => Home_screen_main(
                //       //         emailId: emailId,
                //       //       ),
                //       //     ),
                //       //   );
                //       // }
                //     }
                //     // } else if (clientDetailsMap[indexData.elementAt(i)]
                //     //         .containsKey('Address Details') !=
                //     //     null) {
                //     //   print(clientDetailsList);
                //     // }
                //     // if (checkValue == false) {
                //     //   ScaffoldMessenger.of(context).clearSnackBars();
                //     //   ScaffoldMessenger.of(context).showSnackBar(
                //     //     const SnackBar(
                //     //       content: Text('Please accept condition box'),
                //     //     ),
                //     //   );
                //     // } else {
                //     //   print(indexData.elementAt(i));
                //     //   ScaffoldMessenger.of(context).clearSnackBars();
                //     //   addressDetailsMap = {
                //     //     'House No': houseNoController.text,
                //     //     'Floor No': floorNoController.text,
                //     //     'Tower No': towerNoController.text,
                //     //     'Building Name': buildingNameController.text,
                //     //     'Landmark': landMarkController.text,
                //     //     'City Name': cityNameController.text,
                //     //     'State Name': stateNameController.text,
                //     //     'Pin Code': pinCodeController.text,
                //     //   };
                //     //   clientDetailsMap[indexData.elementAt(i)].update(
                //     //       'Address Details', (value) => addressDetailsMap);
                //     //   print(clientDetailsList);
                //     //   Fluttertoast.showToast(
                //     //     msg: 'Your Address data save successfully..',
                //     //     backgroundColor: Colors.lightGreen.shade50,
                //     //     textColor: Colors.black,
                //     //   );
                //     //   break;
                //     // }
                //   }
                // });
                child: const Text('Save & proceed'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
