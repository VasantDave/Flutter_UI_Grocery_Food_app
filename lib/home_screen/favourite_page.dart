import 'package:flutter/material.dart';

class Favourite_page extends StatefulWidget {
  String? emailId;

  Favourite_page({this.emailId, super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Favourite_page_state(emailId!);
  }
}

class Favourite_page_state extends State {
  String emailId;

  Favourite_page_state(this.emailId);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView();
  }
}
