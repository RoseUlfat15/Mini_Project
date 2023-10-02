// ignore_for_file: file_names

import 'package:app_figma/Screens/Category.dart';
import 'package:app_figma/Screens/groceryhome.dart';
import 'package:flutter/material.dart';

Widget buildBottomNavigationBar(BuildContext context) {
  var currentIndex = 0;
  return BottomNavigationBar(
    currentIndex: currentIndex,
    onTap: (int index) {
      currentIndex = index;
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );

      switch (index) {
        case 0:
          // Handle Home tab
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const GroceryHome("Home"),
            ),
          );
          break;
        case 1:
          // Navigate to the Category page when Category tab is tapped
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) =>
                  const CategoryPage("Category"), // Pass the title if needed
            ),
          );
          break;
        case 2:
          // Handle Heart tab
          break;
        case 3:
          // Handle More tab
          break;
      }
    },
    items: [
      BottomNavigationBarItem(
        icon: Image.asset('assets/Images/home.png'),
        label: "Home",
      ),
      BottomNavigationBarItem(
        icon: Image.asset('assets/Images/Category.png'),
        label: "Category",
      ),
      BottomNavigationBarItem(
        icon: Image.asset('assets/Images/Heart.png'),
        label: "Heart",
      ),
      BottomNavigationBarItem(
        icon: Image.asset('assets/Images/more_vertical.png'),
        label: "More",
      ),
    ],
    selectedItemColor: Colors.black,
    unselectedItemColor: Colors.black,
    showSelectedLabels: true,
    showUnselectedLabels: true,
  );
}

// ignore: camel_case_types
class _pageController {
  static void animateToPage(int index,
      {required Duration duration, required Cubic curve}) {}
}
