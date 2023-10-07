// ignore_for_file: no_logic_in_create_state

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:ui_food_purchase/file_data/order_place_data.dart';
import 'package:ui_food_purchase/home_screen/address_screen.dart';
import 'package:ui_food_purchase/home_screen/home_screen_main.dart';
import 'package:ui_food_purchase/home_screen/make_payment.dart';

import '../file_data/client_details.dart';

int? paidAmount;
int? actualAmount;
int? offerAmount;
int orderId = 0;
int proId = 0;
int deliveryFee = 40;
Map orderDataAdd = {};
List orderDataAddList = [];

class CartScreen extends StatefulWidget {
  String? emailId;
  List cartDataList;

  CartScreen({super.key, required this.cartDataList, this.emailId});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CartScreenState(cartDataList!, emailId!);
  }
}

class CartScreenState extends State {
  String emailId;
  List cartDataList;

  CartScreenState(this.cartDataList, this.emailId);

  String? productTitle;
  int i = 0, j = 0, k = 0;
  num? rate;
  int qty = 1;
  var emailData = clientDetailsList.map((e) => e['Email Id']);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      // appBar: mainAppBar(context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: cartDataList.isEmpty
              ? emptyCart(context)
              : SizedBox(
                  width: double.maxFinite,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'My Cart',
                          style: GoogleFonts.abel(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        cartProducts(context),
                        const SizedBox(height: 10),
                        cartPayment(context),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }

  emptyCart(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        height: 550,
        child: Card(
          color: Colors.lightGreen.shade50,
          elevation: 17,
          shadowColor: Colors.lightGreen,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              LottieBuilder.network(
                'https://lottie.host/82b694a2-10a7-4a32-81b6-2dea533d9b9c/PxbbMl9PgI.json',
                height: 350,
              ),
              Text(
                'Your Cart is empty',
                style: GoogleFonts.abel(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'You have  no items in your shopping Cart. \n Lets go buy something! ',
                style: GoogleFonts.abel(
                    color: Colors.black38,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 70,
                  left: 70,
                  top: 20,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Home_screen_main(
                                  emailId: emailId,
                                )));
                  },
                  style: const ButtonStyle(
                    shape: MaterialStatePropertyAll(
                      StadiumBorder(
                        side: BorderSide(color: Colors.white, width: 1.5),
                      ),
                    ),
                  ),
                  child: const Text('Shop Now'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  cartProducts(BuildContext context) {
    return Card(
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            for (i = 0; i < cartDataList.length; i++)
              Card(
                elevation: 5,
                child: Row(
                  children: [
                    //image
                    Image.network(
                        '${cartDataList.elementAt(i)['Cart Product Image Path']}',
                        height: 100,
                        width: 80),
                    //title & other details
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AutoSizeText(
                            '${cartDataList.elementAt(i)['Cart Product Name']}',
                            overflow: TextOverflow.fade,
                            maxLines: 5,
                            minFontSize: 13,
                            maxFontSize: 13,
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Row(
                            children: [
                              AutoSizeText(
                                '₹ ${cartDataList.elementAt(i)['Cart Product rate']}',
                                overflow: TextOverflow.fade,
                                style: GoogleFonts.abel(
                                    fontWeight: FontWeight.bold),
                                maxLines: 5,
                                minFontSize: 13,
                                maxFontSize: 13,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              AutoSizeText(
                                '₹ ${cartDataList.elementAt(i)['Cart Product Actual rate']}',
                                overflow: TextOverflow.fade,
                                style: GoogleFonts.abel(
                                    decoration: TextDecoration.lineThrough,
                                    color: Colors.black54),
                                maxLines: 5,
                                minFontSize: 10,
                                maxFontSize: 10,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          SizedBox(
                            height: 30,
                            width: 100,
                            child: Padding(
                              padding: const EdgeInsets.all(2),
                              child: Card(
                                color: Colors.lightGreen.shade50,
                                child: Center(
                                  child: AutoSizeText(
                                    'You Saved ${int.parse(cartDataList.elementAt(i)['Cart Product Actual rate']) - int.parse(cartDataList.elementAt(i)['Cart Product rate'])}',
                                    style: GoogleFonts.abel(
                                      color: Colors.green.shade800,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.start,
                                    minFontSize: 8,
                                    maxFontSize: 10,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Container(
                        width: 55,
                        height: 25,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {});
                              },
                              splashColor: Colors.black,
                              child: const Icon(
                                Icons.add,
                                size: 18,
                                color: Colors.lightGreen,
                              ),
                            ),
                            Text(
                              '${cartDataList.elementAt(i)['Cart Product qty']}',
                            ),
                            InkWell(
                              onTap: () {},
                              splashColor: Colors.black,
                              child: const Icon(
                                Icons.remove,
                                size: 18,
                                color: Colors.lightGreen,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }

  cartPayment(BuildContext context) {
    offerAmount = 0;
    paidAmount = 0;
    actualAmount = 0;
    for (i = 0; i < cartDataList.length; i++) {
      paidAmount = paidAmount! +
          int.parse(cartDataList.elementAt(i)['Cart Product rate']);
      actualAmount = actualAmount! +
          int.parse(cartDataList.elementAt(i)['Cart Product Actual rate']);
      offerAmount = actualAmount! - paidAmount!;
    }
    for (i = 0; i < cartDataList.length; i++) {
      for (j = 0; j < clientDetailsList.length; i++) {
        if (emailId == emailData.elementAt(j)) {
          return Card(
            elevation: 10,
            margin: const EdgeInsets.all(5),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 0.1, strokeAlign: 0.1),
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(18),
                        bottomRight: Radius.circular(18))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        'Payment Details',
                        style: GoogleFonts.abel(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'MRP Total',
                            style: GoogleFonts.abel(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            '₹ $actualAmount.00',
                            style: GoogleFonts.abel(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 10, left: 10),
                      child: Divider(
                        color: Colors.lightGreen,
                        height: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Product Discount',
                            style: GoogleFonts.abel(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            '- ₹ $offerAmount.00',
                            style: GoogleFonts.abel(
                              color: Colors.green,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 10, left: 10),
                      child: Divider(
                        color: Colors.lightGreen,
                        height: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Delivery Fee',
                            style: GoogleFonts.abel(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                          const Spacer(),
                          RichText(
                            text: TextSpan(
                              text: 'Free ',
                              style: GoogleFonts.abel(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                              children: [
                                TextSpan(
                                  text: ' ₹$deliveryFee.00',
                                  style: GoogleFonts.abel(
                                    color: Colors.black26,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 10, left: 10),
                      child: Divider(
                        color: Colors.lightGreen,
                        height: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Total',
                            style: GoogleFonts.abel(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                          const Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '₹ $paidAmount',
                                style: GoogleFonts.abel(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Text(
                                'You Saved ₹ $offerAmount.00',
                                style: GoogleFonts.abel(
                                  color: Colors.green,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 20,
                        left: 20,
                        top: 25,
                        bottom: 25,
                      ),
                      child: clientDetailsList.elementAt(j)['Address Details']
                                  ['House No'] ==
                              null
                          ? ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        AddressScreen(emailId: emailId),
                                  ),
                                );
                              },
                              style: const ButtonStyle(
                                shape: MaterialStatePropertyAll(
                                  StadiumBorder(
                                    side: BorderSide(
                                      color: Colors.white,
                                      width: 1.5,
                                    ),
                                  ),
                                ),
                              ),
                              child: const Text('Place Order'),
                            )
                          : ElevatedButton(
                              onPressed: () {
                                for (k = 0; k < cartDataList.length; k++) {
                                  orderDataAdd[k] = {
                                    'Order Product name': cartDataList
                                        .elementAt(k)['Cart Product Name'],
                                    'Order Product rate': cartDataList
                                        .elementAt(k)['Cart Product rate'],
                                    'Order Product Actual rate':
                                        cartDataList.elementAt(
                                            k)['Cart Product Actual rate'],
                                    'Order Product Image Path':
                                        cartDataList.elementAt(
                                            k)['Cart Product Image Path'],
                                    'Order Product qty': cartDataList
                                        .elementAt(k)['Cart Product qty'],
                                    'Order Product amount': cartDataList
                                        .elementAt(k)['Cart Product amount'],
                                  };
                                  orderDataAddList.add(orderDataAdd[k]);
                                }
                                orderDetailsMap[orderId] = {
                                  'Order Id': orderId,
                                  'Order Data': orderDataAddList,
                                  'Order Product Total Mrp': actualAmount,
                                  'Order Product Discount': offerAmount,
                                  'Order Delivery Fee': deliveryFee,
                                  'Order Final Payment': paidAmount,
                                };
                                setState(() {
                                  orderDetailsList
                                      .add(orderDetailsMap[orderId]);
                                  print(orderDetailsList);
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MakePayment(
                                        emailId: emailId,
                                        paidAmount: paidAmount,
                                      ),
                                    ),
                                  );
                                });
                                orderId++;
                                proId++;
                              },
                              style: const ButtonStyle(
                                shape: MaterialStatePropertyAll(
                                  StadiumBorder(
                                    side: BorderSide(
                                      color: Colors.white,
                                      width: 1.5,
                                    ),
                                  ),
                                ),
                              ),
                              child: const Text('Make Payment'),
                            ),
                    )
                  ],
                ),
              ),
            ),
          );
        }
      }
    }
  }
}
