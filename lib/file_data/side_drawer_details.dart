import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SideDrawerDetails {
  Icon icon;
  Text title;

  SideDrawerDetails(this.icon, this.title);
}

List<Map<String, dynamic>> sideDrawerDetailsMap = [
  {
    'Icon': Icon(Icons.home, color: Colors.black38, size: 20),
    'Title': Text('Home', style: GoogleFonts.abel(fontSize: 13)),
  },
  {
    'Icon': Icon(Icons.backpack, color: Colors.black38, size: 20),
    'Title': Text('My Orders', style: GoogleFonts.abel(fontSize: 13)),
  },
  {
    'Icon': Icon(Icons.location_on_outlined, color: Colors.black38, size: 20),
    'Title': Text('Delivery Address', style: GoogleFonts.abel(fontSize: 13)),
  },
  {
    'Icon': Icon(Icons.payment_outlined, color: Colors.black38, size: 20),
    'Title': Text('Payment Methods', style: GoogleFonts.abel(fontSize: 13)),
  },
  {
    'Icon': Icon(Icons.local_offer_outlined, color: Colors.black38, size: 20),
    'Title': Text('Offers', style: GoogleFonts.abel(fontSize: 13)),
  },
  {
    'Icon': Icon(Icons.notifications, color: Colors.black38, size: 20),
    'Title': Text('Notification', style: GoogleFonts.abel(fontSize: 13)),
  },
  {
    'Icon': Icon(Icons.help_outline, color: Colors.black38, size: 20),
    'Title': Text('Help', style: GoogleFonts.abel(fontSize: 13)),
  },
  {
    'Icon': Icon(Icons.info_outline_rounded, color: Colors.black38, size: 20),
    'Title': Text('About', style: GoogleFonts.abel(fontSize: 13)),
  }
];
