// ignore: file_names
//import 'package:app_figma/Category/Category.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../Category/Category.dart';
import '../Color_Constant.dart';

class GroceryHome extends StatefulWidget {
  const GroceryHome({super.key});

  @override
  State<GroceryHome> createState() => _GroceryHomeState();
}

class _GroceryHomeState extends State<GroceryHome> {
  int _currentIndex = 0;
  List<dynamic> top = [
    {
      "nameplate": 'assets/Images/bag.png',
      "searchbar": 'assets/Images/Searchbar.png',
      "text": 'assets/Images/TEXT.png',
      "Recommeded": 'Recommended',
    },
    {
      "nameplate": 'assets/Images/bag.png',
      "searchbar": 'assets/Images/Searchbar.png',
      "text": 'assets/Images/TEXT.png',
      "Deals": 'Deals on Fruits & Tea'
    },
  ];
  final PageController _pageController = PageController(initialPage: 0);
  bool showBanner = true;
  bool recomendedText = true;
  bool productImage = true;
  bool horizontalcontainers = true;
  bool dealsText = true;
  bool dealsContainer = true;
// Initially, show the banner on the first screen.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 220,
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              controller: _pageController,
              itemCount: top.length,
              onPageChanged: (int page) {
                // Update the showBanner variable based on the current page.
                setState(() {
                  recomendedText = page == 0;
                  productImage = page == 0;
                  showBanner = page == 0;
                });
              },
              itemBuilder: (context, index) {
                return Container(
                  height: 2000,
                  width: 1000,
                  color: screenOneColor,
                  child: Column(
                    children: [
                      const Padding(padding: EdgeInsets.fromLTRB(7, 26, 5, 0)),
                      Image.asset(top[index]['nameplate']),
                      const SizedBox(
                        height: 25,
                      ),
                      Image.asset(top[index]['searchbar']),
                      const SizedBox(
                        height: 25,
                      ),
                      Image.asset(top[index]['text']),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          // savings(),
          if (showBanner) bannerCard(),
          const SizedBox(
            height: 20,
          ),
          if (recomendedText)
            const Padding(
              padding: EdgeInsets.fromLTRB(2, 0, 150, 0),
              child: Text("Recommended",
                  style: TextStyle(
                    fontSize: 30,
                  )),
            ),
          const SizedBox(
            height: 20,
          ),
          if (productImage) Image.asset('assets/Images/Products.png'),

          if (horizontalcontainers)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 170,
                  height: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset('assets/Images/savings.png'),
                ),
                const SizedBox(
                    width: 0), // Adjust the space between the containers here
                Container(
                  width: 170,
                  height: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset('assets/Images/savings2.png'),
                ),
              ],
            ),
          if (dealsText)
            const Padding(
              padding: EdgeInsets.fromLTRB(2, 0, 150, 0),
              child: Text("Deals on Fruits & Tea",
                  style: TextStyle(
                    fontSize: 25,
                  )),
            ),
          const SizedBox(
            height: 10,
          ),
          if (dealsContainer)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 120,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset('assets/Images/PRICE1.png'),
                ),
                Container(
                  width: 120,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset('assets/Images/PRICE2.png'),
                ),
              ],
            ),
        ],
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  Widget bannerCard() {
    return CarouselSlider(
      items: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            image: const DecorationImage(
              image: AssetImage('assets/Images/DiscountCard.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
      options: CarouselOptions(
        height: 110.0,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 15 / 8,
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        viewportFraction: 0.8,
      ),
    );
  }

// Function to build the BottomNavigationBar
  Widget buildBottomNavigationBar() {
    return BottomNavigationBar(
      // currentIndex: _currentIndex,
      // onTap: (int index) {
      //   setState(() {
      //     _currentIndex = index;
      //     _pageController.animateToPage(
      //       index,
      //       duration: const Duration(milliseconds: 500),
      //       curve: Curves.easeInOut,
      //     );
      //   });
      // },
      currentIndex: _currentIndex,
      onTap: (int index) {
        setState(() {
          _currentIndex = index;
          switch (index) {
            case 0:
              // Handle Home tab
              break;
            case 1:
              // Navigate to the Category page when Category tab is tapped
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const CategoryPage(
                      "Category"), // Pass the title if needed
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
        });
      },
      items: [
        BottomNavigationBarItem(
            icon: Image.asset('assets/Images/home.png'), label: "Home"),
        BottomNavigationBarItem(
            icon: Image.asset('assets/Images/Category.png'), label: "Category"),
        BottomNavigationBarItem(
          icon: Image.asset('assets/Images/Heart.png'),
          label: "Heart",
        ),
        BottomNavigationBarItem(
            icon: Image.asset('assets/Images/more_vertical.png'),
            label: "More"),
      ],
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black,
      showSelectedLabels: true,
      showUnselectedLabels: true,
    );
  }
}
