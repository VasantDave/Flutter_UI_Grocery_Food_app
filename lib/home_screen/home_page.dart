// ignore_for_file: must_be_immutable, camel_case_types

import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_food_purchase/category/categories_screen.dart';
import 'package:ui_food_purchase/file_data/cart_data_details.dart';
import 'package:ui_food_purchase/file_data/categories_data_details.dart';
import 'package:ui_food_purchase/file_data/client_details.dart';
import 'package:ui_food_purchase/file_data/grid_home.dart';
import 'package:ui_food_purchase/file_data/sales_items_data.dart';

var cartQuantity = 0;
int currentIndex = 0, _currentIndex = 0;
var amount = 0;
var qty = 1;

class Home_page extends StatefulWidget {
  String? emailId;

  Home_page({this.emailId, super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Home_page_state(emailId!);
  }
}

class Home_page_state extends State {
  String emailId;

  Home_page_state(this.emailId);

  var emailData = clientDetailsList.map((e) => e['Email Id']);

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
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //first Grid Offer
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              child: firstGridOffer(context),
            ),
            //Categorie Grid offers
            Padding(
              padding: EdgeInsets.zero,
              child: secondGridCategories(context),
            ),
            //third Grid bank Offer
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              child: thirdGridBank(context),
            ),
            //top Deals List
            Padding(
              padding: EdgeInsets.only(top: 2, bottom: 2, right: 10, left: 10),
              child: Text(
                'Top Deals',
                style: GoogleFonts.abel(
                  color: Colors.black87,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              child: topDeals(context),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              child: productDeals(context),
            ),
            Padding(
              padding: EdgeInsets.only(top: 2, bottom: 2, right: 10, left: 10),
              child: Text(
                'Top Picks',
                style: GoogleFonts.abel(
                  color: Colors.black87,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              child: topPicks(context),
            ),
          ],
        ),
      ),
    );
  }

  //first Grid View of offers
  firstGridOffer(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          width: double.maxFinite,
          //color: Colors.lightGreen,
          child: PageView.builder(
            itemBuilder: (context, index) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Image.network(
                    gridHome[index].imagePath,
                  ),
                ),
              );
            },
            onPageChanged: (int index) {
              setState(
                () {
                  currentIndex = index;
                },
              );
            },
            controller: controller,
            itemCount: gridHome.length,
            allowImplicitScrolling: true,
            pageSnapping: true,
          ),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              gridHome.length,
              (index) => SingleChildScrollView(
                child: Container(
                  height: 5,
                  width: currentIndex == index ? 10 : 5,
                  margin: const EdgeInsets.only(right: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.green,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  //categories grid data
  secondGridCategories(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 3),
            child: Row(
              children: [
                Text(
                  'Shop By Category',
                  style: GoogleFonts.abel(
                    color: Colors.black87,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Categories(
                            emailId: emailId,
                          ),
                        ),
                      );
                    });
                  },
                  splashColor: Colors.lightGreen,
                  child: Row(
                    children: [
                      Text(
                        'See All',
                        style: GoogleFonts.abel(
                            color: Colors.black87,
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      ),
                      const Icon(
                        Icons.arrow_right,
                        color: Colors.lightGreen,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 3,
              mainAxisSpacing: 3,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  decoration: BoxDecoration(
                    color: _currentIndex == index
                        ? Colors.lightGreen.shade100
                        : Colors.lightGreen.shade50,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.network(
                          "${categorieList.elementAt(index)['Categorie Image']}",
                          height: 80,
                          width: 80,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      Text(
                        '${categorieList.elementAt(index)['Categorie Name']}',
                        style: GoogleFonts.abel(fontSize: 13),
                      )
                    ],
                  ),
                ),
              );
            },
            itemCount: categorieList.length,
          )
        ],
      ),
    );
  }

  //bank offer grid data
  thirdGridBank(BuildContext context) {
    return Container(
      height: 95,
      color: Colors.lightGreen[50],
      width: double.maxFinite,
      child: CarouselSlider.builder(
        itemCount: gridHomeBank.length,
        itemBuilder: (context, index, rlIndex) {
          return Image.network(
            gridHomeBank[index].imagePath,
            //fit: BoxFit.scaleDown,
            height: double.infinity,
            width: double.maxFinite,
          );
        },
        options: CarouselOptions(
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          // Set auto-scroll interval
          enlargeCenterPage: true,
          onPageChanged: (index, reason) {
            setState(
              () {
                _currentIndex = index;
              },
            );
          },
        ),
      ),
    );
  }

  //top deals data
  topDeals(BuildContext context) {
    return SizedBox(
      height: 270,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Card(
            elevation: 3,
            shadowColor: Colors.lightGreen.shade100,
            child: InkWell(
              onTap: () {},
              splashColor: Colors.lightGreen.shade100,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 0.1, color: Colors.black38)),
                width: 150,
                child: Padding(
                  padding: const EdgeInsets.all(3),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 100,
                        width: 150,
                        child: Image.network(
                          "${salesItemsTopDeals.elementAt(index)['Item Image Path']}",
                          height: 100,
                          width: 140,
                        ),
                      ),
                      SizedBox(
                        height: 40,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 5, left: 1, right: 1, bottom: 5),
                          child: Center(
                            child: AutoSizeText(
                              "${salesItemsTopDeals.elementAt(index)['Item Name']}",
                              minFontSize: 13,
                              maxFontSize: 13,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              softWrap: true,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 5, left: 10, right: 0, bottom: 5),
                          child: AutoSizeText(
                            "₹ ${salesItemsTopDeals.elementAt(index)['Item Rate']}.00",
                            style: GoogleFonts.abel(
                                fontWeight: FontWeight.bold, fontSize: 16),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            softWrap: true,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 45,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 5, left: 10, right: 1, bottom: 5),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              AutoSizeText(
                                "₹ ${salesItemsTopDeals.elementAt(index)['Item Actual Rate']}.00",
                                style: GoogleFonts.abel(
                                    fontSize: 10,
                                    decoration: TextDecoration.lineThrough),
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Card(
                                color: Colors.lightGreen.shade100,
                                child: Container(
                                  height: 25,
                                  width: 45,
                                  child: Center(
                                    child: AutoSizeText(
                                      "${salesItemsTopDeals.elementAt(index)['Item Offer']}",
                                      style: GoogleFonts.abel(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green),
                                      minFontSize: 11,
                                      maxFontSize: 11,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: Card(
                            color: Colors.lightGreen.shade100,
                            child: SizedBox(
                              height: 35,
                              width: double.maxFinite,
                              child: GestureDetector(
                                behavior: HitTestBehavior.translucent,
                                onTap: () {
                                  setState(() {
                                    cartDetailsMap[cartQuantity] = {
                                      'Cart Id': cartQuantity,
                                      'Cart Product Name': salesItemsTopDeals
                                          .elementAt(index)['Item Name'],
                                      'Cart Product rate': salesItemsTopDeals
                                          .elementAt(index)['Item Rate'],
                                      'Cart Product Actual rate':
                                          salesItemsTopDeals.elementAt(
                                              index)['Item Actual Rate'],
                                      'Cart Product Image Path':
                                          salesItemsTopDeals.elementAt(
                                              index)['Item Image Path'],
                                      'Cart Product qty': qty,
                                      'Cart Product amount': salesItemsTopDeals
                                          .elementAt(index)['Item Rate'],
                                    };
                                    cartDataDetails
                                        .add(cartDetailsMap[cartQuantity]);
                                    print(cartDataDetails);
                                    Fluttertoast.showToast(
                                      msg: 'Added to Cart Successfully',
                                    );
                                    cartQuantity++;
                                  });
                                },
                                child: Center(
                                  child: AutoSizeText(
                                    'Add',
                                    style: GoogleFonts.abel(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    minFontSize: 10,
                                    maxFontSize: 13,
                                  ),
                                ),
                              ),
                              // : Row(
                              //     mainAxisAlignment:
                              //         MainAxisAlignment.spaceEvenly,
                              //     children: [
                              //       InkWell(
                              //         onTap: () {
                              //           setState(() {
                              //             quantity--;
                              //           });
                              //         },
                              //         child: const Center(
                              //           child: Icon(
                              //             Icons.remove,
                              //             size: 18,
                              //             color: Colors.black38,
                              //           ),
                              //         ),
                              //       ),
                              //       Text(
                              //         quantity.toString(),
                              //         style: GoogleFonts.abel(
                              //           color: Colors.black,
                              //           fontWeight: FontWeight.bold,
                              //         ),
                              //       ),
                              //       InkWell(
                              //         onTap: () {
                              //           setState(() {
                              //             quantity++;
                              //           });
                              //         },
                              //         child: const Center(
                              //           child: Icon(
                              //             Icons.add,
                              //             size: 18,
                              //             color: Colors.black38,
                              //           ),
                              //         ),
                              //       ),
                              //     ],
                              //   ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            width: 3,
          );
        },
        itemCount: salesItemsTopDeals.length,
      ),
    );
  }

  //product offer data
  productDeals(BuildContext context) {
    return SizedBox(
      height: 110,
      width: double.maxFinite,
      child: CarouselSlider.builder(
        itemCount: gridHomeOffer.length,
        itemBuilder: (context, index, rlIndex) {
          return Image.network(
            gridHomeOffer[index].imagePath,
            //fit: BoxFit.scaleDown,
            height: double.maxFinite,
            width: double.maxFinite,
          );
        },
        options: CarouselOptions(
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          // Set auto-scroll interval
          enlargeCenterPage: true,
          onPageChanged: (index, reason) {
            setState(
              () {
                _currentIndex = index;
              },
            );
          },
        ),
      ),
    );
  }

  //top picks data
  topPicks(BuildContext context) {
    return SizedBox(
      height: 270,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Card(
            elevation: 3,
            shadowColor: Colors.lightGreen.shade100,
            child: InkWell(
              onTap: () {},
              splashColor: Colors.lightGreen.shade100,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 0.1, color: Colors.black38)),
                width: 150,
                child: Padding(
                  padding: const EdgeInsets.all(3),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 100,
                        width: 150,
                        child: Image.network(
                          "${salesItemsTopPicks.elementAt(index)['Item Image Path']}",
                          height: 100,
                          width: 140,
                        ),
                      ),
                      SizedBox(
                        height: 40,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 5, left: 1, right: 1, bottom: 5),
                          child: Center(
                            child: AutoSizeText(
                              "${salesItemsTopPicks.elementAt(index)['Item Name']}",
                              minFontSize: 13,
                              maxFontSize: 13,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              softWrap: true,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 5, left: 10, right: 0, bottom: 5),
                          child: AutoSizeText(
                            "₹ ${salesItemsTopPicks.elementAt(index)['Item Rate']}.00",
                            style: GoogleFonts.abel(
                                fontWeight: FontWeight.bold, fontSize: 16),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            softWrap: true,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 45,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 5, left: 10, right: 1, bottom: 5),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              AutoSizeText(
                                "₹ ${salesItemsTopPicks.elementAt(index)['Item Actual Rate']}.00",
                                style: GoogleFonts.abel(
                                    fontSize: 10,
                                    decoration: TextDecoration.lineThrough),
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Card(
                                color: Colors.lightGreen.shade100,
                                child: Container(
                                  height: 25,
                                  width: 45,
                                  child: Center(
                                    child: AutoSizeText(
                                      "${salesItemsTopPicks.elementAt(index)['Item Offer']}",
                                      style: GoogleFonts.abel(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green),
                                      minFontSize: 11,
                                      maxFontSize: 11,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: Card(
                            color: Colors.lightGreen.shade100,
                            child: SizedBox(
                              height: 35,
                              width: double.maxFinite,
                              child: GestureDetector(
                                behavior: HitTestBehavior.translucent,
                                onTap: () {
                                  setState(() {
                                    cartDetailsMap[cartQuantity] = {
                                      'Cart Id': cartQuantity,
                                      'Cart Product Name': salesItemsTopPicks
                                          .elementAt(index)['Item Name'],
                                      'Cart Product rate': salesItemsTopPicks
                                          .elementAt(index)['Item Rate'],
                                      'Cart Product Actual rate':
                                          salesItemsTopPicks.elementAt(
                                              index)['Item Actual Rate'],
                                      'Cart Product Image Path':
                                          salesItemsTopPicks.elementAt(
                                              index)['Item Image Path'],
                                      'Cart Product qty': qty,
                                      'Cart Product amount': salesItemsTopPicks
                                          .elementAt(index)['Item Rate'],
                                    };
                                    cartDataDetails
                                        .add(cartDetailsMap[cartQuantity]);
                                    print(cartDataDetails);
                                    Fluttertoast.showToast(
                                      msg: 'Added to Cart Successfully',
                                    );
                                    cartQuantity++;
                                  });
                                },
                                child: Center(
                                  child: AutoSizeText(
                                    'Add',
                                    style: GoogleFonts.abel(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    minFontSize: 10,
                                    maxFontSize: 13,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            width: 3,
          );
        },
        itemCount: salesItemsTopDeals.length,
      ),
    );
  }
}
