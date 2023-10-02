// ignore_for_file: non_constant_identifier_names

import 'package:app_figma/widgets/cartcount.dart';
import 'package:flutter/material.dart';

class BigSmallFish extends StatelessWidget {
  BigSmallFish({super.key});

  final List<Map<String, String>> BigSmallFishitem = [
    {
      "Category1": 'assets/Images/C1.png',
    },
    {
      "Category2": 'assets/Images/C2.png',
    },
    {
      "Category3": 'assets/Images/C3.png',
    },
    {
      "Category4": 'assets/Images/C4.png',
    },
    {
      "Category5": 'assets/Images/C5.png',
    },
    {
      "Category6": 'assets/Images/C6.png',
    },
    {
      "Category7": 'assets/Images/C1.png',
    },
    {
      "Category8": 'assets/Images/C2.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Big & Small Fishes"),
        actions: [
          Image.asset(
            'assets/Images/Search.png',
            color: const Color(0xff1E222B),
          ),
          const CartWidget(), // Use the CartWidget here
        ],
        // backgroundColor: Colors.white70
      ),
      // appBar: AppBar(
      //     leading: const Icon(
      //       Icons.arrow_back_ios_rounded,
      //       size: 16,
      //       color: Colors.white,
      //     ),
      //     title: const Text(
      //       "Big & Small Fishes",
      //       style: TextStyle(
      //         color: Color(0xff1E222B),
      //         fontSize: 16,
      //       ),
      //     ),
      //     actions: [
      //       Image.asset(
      //         'assets/Images/Search.png',
      //         color: const Color(0xff1E222B),
      //       ),
      //       const CartWidget(),
      //     ],
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          Image.asset('assets/Images/TABBAR.png'),
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of columns
              childAspectRatio: 1.0, // Aspect ratio of each grid item
            ),
            itemCount: BigSmallFishitem.length, // Total number of items
            shrinkWrap: true, // Ensure the grid takes only the space it needs
            physics:
                const NeverScrollableScrollPhysics(), // Disable scrolling of the grid
            itemBuilder: (BuildContext context, int index) {
              final imagePath = BigSmallFishitem[index].values.first;
              return GridTile(
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover, // Adjust the fit as needed
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
