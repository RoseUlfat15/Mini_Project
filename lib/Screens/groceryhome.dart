import 'package:app_figma/widgets/cartcount.dart';
import 'package:app_figma/widgets/bottomNav.dart';
import 'package:app_figma/components/grocery_item_tile.dart';
import 'package:app_figma/model/cart_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../widgets/Color_Constant.dart';

class GroceryHome extends StatefulWidget {
  const GroceryHome(String s, {super.key});

  @override
  State<GroceryHome> createState() => _GroceryHomeState();
}

class _GroceryHomeState extends State<GroceryHome> {
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
      appBar: AppBar(
        titleSpacing: 17,
        backgroundColor: screenOneColor,
        titleTextStyle:
            GoogleFonts.manrope(fontSize: 28, fontWeight: FontWeight.normal),
        //  const TextStyle(fontFamily: 'Manrope', fontSize: 28),
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
              const Size.fromHeight(170.0), // Preferred size for the Column
          child: Column(
            children: [
              const SizedBox(
                height: 30,
                width: 10,
              ),
              //Image.asset('assets/Images/Searchbar.png'),
              Container(
                height: 46,
                width: 380,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(21, 48, 117, 1),
                  borderRadius: BorderRadius.circular(30),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 26, vertical: 5),
                child: const Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    Flexible(
                      flex: 4,
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: "Search Products or Store",
                            border: InputBorder.none),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ), // Image 1
              Image.asset('assets/Images/TEXT.png'), // Image 2
              const SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 14), // AppBar se spacing
          CarouselSlider(
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
              height: 100.0,
              enlargeCenterPage: true,
              autoPlay: true, // Auto-play enable
              aspectRatio: 15 / 8,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              viewportFraction: 0.8,
            ),
          ),

          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.fromLTRB(4, 0, 150, 0),
            child: Text("Deals on Fruits & Tea",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
          ),
          // const SizedBox(height: 20),
          Expanded(child: Consumer<CartModel>(builder: (context, value, child) {
            return GridView.builder(
                padding: const EdgeInsets.all(12),
                // physics: const NeverScrollableScrollPhysics(),
                itemCount: value.deals.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.2,
                ),
                itemBuilder: (context, index) {
                  Product productToAdd = Product(
                    name: value.deals[index][0],
                    price: double.parse(value.deals[index][1]),
                    imagePath: value.deals[index][2],
                    color: value.deals[index][3],
                  );
                  return GroceryItemTile(
                    itemName: productToAdd.name,
                    itemPrice: productToAdd.price.toStringAsFixed(2),
                    imagePath: productToAdd.imagePath,
                    color: productToAdd.color,
                    product: productToAdd, // Pass the Product object
                    onPressed: () {
                      Provider.of<CartModel>(context, listen: false)
                          .addItemToCart(productToAdd);
                    },
                  );
                });
          })),
        ],
      ),
      bottomNavigationBar: buildBottomNavigationBar(context),
    );
  }
}
