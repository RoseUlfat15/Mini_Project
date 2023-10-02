// ignore_for_file: file_names

import 'package:app_figma/components/beverages_item_tile.dart';
import 'package:app_figma/components/bigsmallfish.dart';

import 'package:app_figma/components/category_item_tile.dart';
import 'package:app_figma/components/dairy_item_tile.dart';
import 'package:app_figma/components/fruits_tile.dart';
import 'package:app_figma/components/vegetables_item_tile.dart';
import 'package:app_figma/model/cart_model.dart';

import 'package:app_figma/widgets/cartcount.dart';
import 'package:app_figma/widgets/bottomNav.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../widgets/Color_Constant.dart';

class CategoryPage extends StatefulWidget {
  final String categoryName;
  const CategoryPage(this.categoryName, {super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  // List cartItems = [];
  List<dynamic> top2 = [
    {
      "nameplate": 'assets/Images/bag.png',
      "text": 'assets/Images/Bigtitle.png'
    },
    {
      "nameplate": 'assets/Images/bag.png',
      "text": 'assets/Images/Bigtitle.png'
    },
  ];

  final List<String> categoriesText = [
    "Meats & Fishes",
    "Vegetables",
    "Fruits",
    "Dairy",
    "Beverages",
  ];
  int current = 0;
  final List<Map<String, String>> items = [
    {
      "item1": 'assets/Images/item1.png',
    },
    {
      "item2": 'assets/Images/item2.png',
    },
    {
      "item3": 'assets/Images/item1.png',
    },
    {
      "item4": 'assets/Images/item2.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 17,
        backgroundColor: screenOneColor,
        titleTextStyle: const TextStyle(fontFamily: 'Manrope', fontSize: 28),
        title: Container(
          margin: const EdgeInsets.only(top: 25.0),
          child: const Text(
            "Hey, Halal",
            style: TextStyle(fontSize: 28),
          ),
        ),
        actions: const [
          CartWidget(), // Use the CartWidget here
        ],
        bottom: PreferredSize(
          preferredSize:
              const Size.fromHeight(180.0), // Preferred size for the Column
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              Image.asset('assets/Images/Bigtitle.png'),
              const SizedBox(
                height: 25,
              ),
            ],
          ),
        ), // Blue app bar
      ),
      body: PageView.builder(
        itemCount:
            2, // Two pages: GridView, Horizontal ListView + Vertical ListView
        itemBuilder: (context, index) {
          if (index == 0) {
            // First Page: GridView
            return Expanded(
                child: Consumer<CartModel>(builder: (context, value, child) {
              return GridView.builder(
                padding: const EdgeInsets.all(12),
                // physics: const NeverScrollableScrollPhysics(),
                itemCount: value.categoryitems.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.4,
                ),
                itemBuilder: (context, index) {
                  return CategoryItemTile(
                    itemName: value.categoryitems[index][0],
                    subtext: value.categoryitems[index][1],
                    imagePath: value.categoryitems[index][2],
                    color: value.categoryitems[index][3],
                  );
                },
              );
            }));
          } else {
            return SingleChildScrollView(
              child: Column(children: [
                SizedBox(
                  height: 57,
                  width: double.infinity,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: categoriesText.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            current = index;
                            if (current == 0) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BigSmallFish(),
                                ),
                              );
                            } else if (current == 1) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const VegetablesPage(),
                                ),
                              );
                            } else if (current == 2) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const FruitsPage(),
                                ),
                              );
                            } else if (current == 3) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const DairyPage(),
                                ),
                              );
                            } else if (current == 4) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const BeveragesPage(),
                                ),
                              );
                            }
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.all(5),
                          width: 155,
                          height: 38,
                          decoration: BoxDecoration(
                            color: current == index
                                ? Colors.orange
                                : Colors.white54,
                            borderRadius: BorderRadius.circular(
                              current == index ? 25 : 9,
                            ),
                            border: current == index
                                ? Border.all(color: Colors.orange, width: 3)
                                : null,
                          ),
                          child: Center(
                            child: Text(
                              categoriesText[index],
                              style: GoogleFonts.manrope(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: current == index
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Visibility(
                    visible: current == index,
                    child: Container(
                      width: 5,
                      height: 5,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.amber),
                    )),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              // Navigate to the next page when the image is tapped
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => BigSmallFish(),
                              ));
                            },
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 6, 76, 10),
                              child: Image.asset(
                                'assets/Images/item1.png',
                                height: 180,
                                width: 292,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 98, 0),
                            child: Image.asset(
                              'assets/Images/item2.png',
                              height: 161,
                              width: 280,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 76, 10),
                            child: Image.asset(
                              'assets/Images/item1.png',
                              height: 180,
                              width: 292,
                            ),
                          ),
                          // const SizedBox(
                          //   height: 20,
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ]

                  // Expanded(
                  //   child: Padding(
                  //     padding: const EdgeInsets.fromLTRB(5, 10, 10, 0),
                  //     child: ListView.builder(
                  //       scrollDirection: Axis.vertical, // Vertical scrolling
                  //       itemCount: items.length,
                  //       /* Total number of images */
                  //       itemBuilder: (context, index) {
                  //         return Image.asset(items[index].values.first);
                  //       },
                  //     ),
                  //   ),
                  // ),

                  ),
            );
          }
        },
      ),
      bottomNavigationBar: buildBottomNavigationBar(context),
    );
  }
}
