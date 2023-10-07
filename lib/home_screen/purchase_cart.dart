import 'package:flutter/material.dart';

class Purchase_cart extends StatefulWidget {
  String? emailId;

  Purchase_cart({super.key, this.emailId});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Purchase_cart_state(emailId!);
  }
}

class Purchase_cart_state extends State {
  String emailId;

  Purchase_cart_state(this.emailId);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView();
  }
}
