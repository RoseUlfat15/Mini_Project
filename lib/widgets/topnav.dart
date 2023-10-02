import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// Import your CartModel class.

class TopNavWidget extends StatelessWidget {
  const TopNavWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
            appBar: AppBar(
              bottom: TabBar(
                  indicator: ShapeDecoration(
                      color: Colors.amber,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      )),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  tabs: const [
                    Tab(text: "Meats & Fishes"),
                    Tab(text: "Vegetables"),
                    Tab(text: "Fruits"),
                    Tab(text: "Beverages"),
                    Tab(text: "Dairy"),
                    Tab(text: "Others"),
                  ]),
            ),
            body: TabBarView(children: [
              Center(
                  child: Text(
                "Meats & Fishes",
                style: GoogleFonts.manrope(
                    fontSize: 14, fontWeight: FontWeight.w500),
              )),
              Center(
                  child: Text(
                "Vegetables",
                style: GoogleFonts.manrope(
                    fontSize: 14, fontWeight: FontWeight.w500),
              )),
              Center(
                  child: Text(
                "Fruits",
                style: GoogleFonts.manrope(
                    fontSize: 14, fontWeight: FontWeight.w500),
              )),
              Center(
                  child: Text(
                "Beverages",
                style: GoogleFonts.manrope(
                    fontSize: 14, fontWeight: FontWeight.w500),
              )),
              Center(
                  child: Text(
                "Dairy",
                style: GoogleFonts.manrope(
                    fontSize: 14, fontWeight: FontWeight.w500),
              )),
              Center(
                  child: Text(
                "Others",
                style: GoogleFonts.manrope(
                    fontSize: 14, fontWeight: FontWeight.w500),
              )),
            ])));
  }
}
