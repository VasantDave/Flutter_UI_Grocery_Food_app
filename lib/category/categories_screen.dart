import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_food_purchase/file_data/categories_data_details.dart';
import 'package:ui_food_purchase/home_screen/home_screen_main.dart';

class Categories extends StatefulWidget {
  String? emailId;

  Categories({super.key, this.emailId});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CategoriesState(emailId!);
  }
}

class CategoriesState extends State {
  String emailId;

  CategoriesState(this.emailId);

  var _currentIndex = -1;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: mainAppBar(context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: GridView.builder(
              itemCount: categorieListPage.length,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
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
                          : Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network(
                            "${categorieListPage.elementAt(index)['Categorie Image']}",
                            height: 130,
                            width: 130,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '${categorieListPage.elementAt(index)['Categorie Name']}',
                          style: GoogleFonts.abel(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.green),
                        )
                      ],
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
