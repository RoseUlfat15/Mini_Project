import 'package:flutter/material.dart';
import '../Color_Constant.dart';

class CategoryPage extends StatefulWidget {
  final String categoryName;
  const CategoryPage(this.categoryName, {super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
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

  final List<Map<String, String>> categories = [
    {
      "Category1": 'assets/Images/Category1.png',
    },
    {
      "Category2": 'assets/Images/Category2.png',
    },
    {
      "Category3": 'assets/Images/Category3.png',
    },
    {
      "Category4": 'assets/Images/Category4.png',
    },
    // Add more categories as needed
  ];

  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          height: 230,
          child: PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: _pageController,
            itemCount: top2.length,
            onPageChanged: (int page) {
              setState(() {});
            },
            itemBuilder: (context, index) {
              return Container(
                color: screenOneColor,
                child: Column(
                  children: [
                    const Padding(padding: EdgeInsets.fromLTRB(6, 25, 5, 0)),
                    Image.asset(top2[index]['nameplate']!),
                    const SizedBox(height: 25),
                    Image.asset(top2[index]['text']!),
                  ],
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: GridView.builder(
            itemCount: 4,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.75,
            ),
            itemBuilder: (context, index) {
              return Container(
                child: Image.asset(categories[index].values.first),
              );
            },
          ),
        ),
      ]),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  Widget buildBottomNavigationBar() {
    var currentIndex = 0;
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (int index) {
        setState(() {
          currentIndex = index;
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );

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
