// import 'package:flutter/material.dart';

// class MapScreen extends StatelessWidget {
//   const MapScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         iconTheme: const IconThemeData(color: Colors.black),
//         titleSpacing: 17,
//         backgroundColor: Colors.transparent,
//         title: const Text(
//           "Track Order",
//           style: TextStyle(
//             color: Color(0xff1E222B),
//             fontSize: 20,
//           ),
//         ),
//       ),
//       body: Column(
//         children: [
//           // Background images
//           Image.asset(
//             'assets/Images/bgmap.png',
//             height: 500,
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           // Image.asset(
//           //   'assets/Images/bg3.png',
//           //   height: 80,
//           //   width: double.infinity,
//           // ),

//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Container(
//               color: Colors.white, // Background color of the box
//               width: double.infinity, // Full width of the screen
//               padding: const EdgeInsets.all(16.0),
//               child: const Text(
//                 "Order Details (ID: #765433)",
//                 style: TextStyle(
//                   fontSize: 15,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ),
//           // Other widgets on top of the images (e.g., tracking details)
//           // You can add your tracking details widgets here
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        titleSpacing: 17,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Track Order",
          style: TextStyle(
            color: Color(0xff1E222B),
            fontSize: 20,
          ),
        ),
      ),
      body: Stack(
        children: [
          // Background image covering the entire screen
          Positioned.fill(
            child: Image.asset(
              'assets/Images/bgmap.png',
              height: 320,
              width: 660, // Replace with your image path
              // fit: BoxFit.cover, // Cover the entire screen
            ),
          ),
          // Rectangular box with order number at the bottom
          Expanded(
            child: Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(16),
                color: Colors.white
                    .withOpacity(0.7), // Semi-transparent black background
                child: const Text(
                  'Order Number: 123456',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
