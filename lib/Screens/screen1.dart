// ignore: file_names
// ignore_for_file: prefer_const_constructors
import 'package:app_figma/Screens/groceryhome.dart';
import 'package:app_figma/widgets/Color_Constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  // ignore: non_constant_identifier_names
  List<dynamic> ScreenData = [
    {
      "Text": 'Your holiday shopping delivered to screen One ',
      "Image": 'assets/Images/Emoji.png',
      "belowText":
          'Theres something for everyone to enjoy with Sweet shop Favourites Screen 1',
      "ImageIcon": 'assets/Images/delivery.png',
    },
    {
      "Text": 'Your holiday shopping delivered to screen Two ',
      "Image": 'assets/Images/Emoji.png',
      "belowText":
          'Theres something for everyone to enjoy with Sweet shop Favourites Screen 2',
      "ImageIcon": 'assets/Images/delivery.png',
    }
  ];
  final PageController _pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      backgroundColor: screenOneColor,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              controller: _pageController,
              itemCount: 2,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(33, 60, 50, 0),
                  child: Column(
                    children: [
                      Text(
                        ScreenData[index]['Text'],
                        style: GoogleFonts.manrope(
                          fontSize: 38,
                          color: Color.fromARGB(255, 248, 247, 247),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Image.asset(ScreenData[index]['Image']),
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        ScreenData[index]['belowText'],
                        style: const TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 248, 247, 247),
                          fontFamily: 'TulpenOne',
                        ),
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      Image.asset(
                        ScreenData[index]['ImageIcon'],
                        height: 220,
                        width: 175,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: InkWell(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => GroceryHome("Home")),
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40.0,
                  vertical: 15.0,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xffFAFBFD),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Get Started",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Color(0xff1E222B),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 20),
                    Icon(Icons.arrow_forward_sharp, color: Color(0xff1E222B)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
