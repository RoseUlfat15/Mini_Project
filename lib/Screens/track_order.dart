import 'package:app_figma/Screens/order_tracking_map.dart';
import 'package:app_figma/widgets/Color_Constant.dart';
import 'package:flutter/material.dart';

class TrackOrderScreen extends StatelessWidget {
  const TrackOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        titleSpacing: 17,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Track Your Order",
          style: TextStyle(
            color: Color(0xff1E222B),
            fontSize: 20,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                // Rider image goes here
                Image.asset(
                  "assets/Images/delivery.png", // Replace with the actual image path
                  width: 48, // Adjust the width as needed
                  height: 48, // Adjust the height as needed
                ),
                const SizedBox(
                    width: 16), // Add spacing between the image and text
                const Text(
                  'Enter Order Tracking Details',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Enter order number',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MapScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                // maximumSize:,
                backgroundColor: screenOneColor,
                minimumSize: const Size(
                    380, 60), // Set the button's background color to blue
              ),
              child: const Text(
                'Track Order',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 20),
            // Display order tracking status here.
          ],
        ),
      ),
    );
  }
}
