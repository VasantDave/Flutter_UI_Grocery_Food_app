// ignore_for_file: camel_case_types, no_logic_in_create_state, must_be_immutable

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_food_purchase/file_data/cart_data_details.dart';
import 'package:ui_food_purchase/file_data/client_details.dart';
import 'package:ui_food_purchase/file_data/side_drawer_details.dart';
import 'package:ui_food_purchase/home_screen/cart_screen.dart';
import 'package:ui_food_purchase/home_screen/favourite_page.dart';
import 'package:ui_food_purchase/home_screen/home_page.dart';
import 'package:ui_food_purchase/home_screen/profile_screen.dart';

import '../splash_intro_screen/welcome_screen.dart';

class Home_screen_main extends StatefulWidget {
  // List clientDetailsList;
  // int index;
  String? emailId;

  Home_screen_main({super.key, this.emailId});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Home_screen_main_state(emailId!);
  }
}

class Home_screen_main_state extends State {
  String emailId;

  Home_screen_main_state(this.emailId);

  SideDrawerDetails? drawerDetails;
  var items = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home, color: Colors.lightGreen),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.favorite, color: Colors.lightGreen),
      label: 'Favorite',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart, color: Colors.lightGreen),
      label: 'Cart',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.person_outline, color: Colors.lightGreen),
      label: 'Profile',
    ),
  ];
  int selectIndex = 0;
  var emailData = clientDetailsList.map((e) => e['Email Id']);
  Iterable iconData = sideDrawerDetailsMap.map((e) => e['Icon']);
  var textData = sideDrawerDetailsMap.map((e) => e['Title']);
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
    List<Widget> fileList = [
      Home_page(
        emailId: emailId,
      ),
      Favourite_page(
        emailId: emailId,
      ),
      CartScreen(
        cartDataList: cartDataDetails,
        emailId: emailId,
      ),
      ProfileScreen(
        emailId: emailId,
      ),
    ];
    // TODO: implement build
    return Scaffold(
      appBar: mainAppBar(context),
      drawer: mainDrawer(context),
      body: fileList[selectIndex],
      bottomNavigationBar: bottomNavigationBar(context),
    );
  }

  bottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.black87,
      selectedLabelStyle: GoogleFonts.abel(),
      landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
      unselectedIconTheme: const IconThemeData(
        color: Colors.black38,
        opacity: 0.5,
      ),
      unselectedLabelStyle: GoogleFonts.abel(
        color: Colors.black12,
      ),
      selectedIconTheme: const IconThemeData(
        fill: 0.5,
        opacity: 1.0,
        shadows: [
          Shadow(
            color: Colors.black,
            blurRadius: 0.3,
            offset: Offset(0.5, 0.5),
          )
        ],
      ),
      items: items,
      elevation: 5,
      backgroundColor: Colors.black,
      onTap: (index) {
        setState(() {
          selectIndex = index;
        });
      },
      type: BottomNavigationBarType.shifting,
      currentIndex: selectIndex,
    );
  }

  mainDrawer(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            accountDrawer(context),
            listViewDrawer(context),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Card(
                  child: ElevatedButton(
                onPressed: () {
                  Fluttertoast.showToast(
                    msg: 'Sign Out Sucessfully',
                    backgroundColor: Colors.lightGreen.shade50,
                    textColor: Colors.black,
                  );
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Welcome_screen()),
                  );
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.lightGreen[300])),
                child: Text('Log Out',
                    style: GoogleFonts.abel(color: Colors.black87)),
              )),
            )
          ],
        ),
      ),
    );
  }

  accountDrawer(BuildContext context) {
    for (var i = 0; i < clientDetailsList.length; i++) {
      if (emailId == emailData.elementAt(i)) {
        return UserAccountsDrawerHeader(
          currentAccountPictureSize: const Size(80, 80),
          decoration: const BoxDecoration(
            color: Colors.lightGreen,
          ),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: Image.asset(
                'assets/images/food_veg.png',
              ),
            ),
          ),
          accountName: Text(
            '${clientDetailsList.map((e) => e['First Name']).elementAt(i)}',
            style: GoogleFonts.abel(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          accountEmail: Text(
            '${clientDetailsList.map((e) => e['Email Id']).elementAt(i)}',
            style: GoogleFonts.abel(
              color: Colors.black87,
              fontSize: 15,
            ),
          ),
        );
      }
    }
  }

  listViewDrawer(BuildContext context) {
    return Flexible(
      child: ListView.builder(
          itemCount: sideDrawerDetailsMap.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                children: [
                  Container(
                    child: ListTile(
                      leading: iconData.elementAt(index),
                      title: textData.elementAt(index),
                      onTap: () {
                        setState(() {
                          if (index == 0) {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => Home_screen_main(
                                  emailId: emailId,
                                ),
                              ),
                            );
                          } else if (index == 1) {}
                        });
                      },
                      trailing: const Icon(
                        Icons.arrow_right,
                        color: Colors.lightGreen,
                        size: 15,
                      ),
                    ),
                  ),
                  const Divider(color: Colors.lightGreen, height: 5),
                ],
              ),
            );
          }),
    );
  }
}

mainAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    //surfaceTintColor: Colors.lightGreen,
    foregroundColor: Colors.lightGreen,
    title: Text(
      'Healthy Food',
      style: GoogleFonts.abel(
          fontSize: 25, color: Colors.lightGreen, fontWeight: FontWeight.bold),
    ),
  );
}
// for (var i = 0; i < clientDetailsList.length; i++)
//   if (emailId == emailData.elementAt(i))
//     Text(
//         '\n\n\nId :- ${clientDetailsList.map((e) => e['Id']).elementAt(i)}'
//         '\n\nFirst Name :- ${clientDetailsList.map((e) => e['First Name']).elementAt(i)}'
//         '\n\nLast Name :- ${clientDetailsList.map((e) => e['Last Name']).elementAt(i)}'
//         '\n\nEmail Id :- ${clientDetailsList.map((e) => e['Email Id']).elementAt(i)}'
//         '\n\nMobile Number :- ${clientDetailsList.map((e) => e['Mobile Number']).elementAt(i)}'
//         '\n\nPassword :- ${clientDetailsList.map((e) => e['Password']).elementAt(i)}'
//         '\n\nStatus :- ${clientDetailsList.map((e) => e['Status']).elementAt(i).toString()}'),
