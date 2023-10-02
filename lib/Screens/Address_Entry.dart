// ignore_for_file: file_names

import 'package:app_figma/Screens/cardScreen.dart';
import 'package:app_figma/widgets/Color_Constant.dart';
import 'package:flutter/material.dart';

class AddressEntryScreen extends StatelessWidget {
  const AddressEntryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Define a TextEditingController to manage the text input.

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        titleSpacing: 17,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Shopping Cart",
          style: TextStyle(
            color: Color(0xff1E222B),
            fontSize: 20,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 40,
              ),
              const Text(
                "Delivery Address",
                style: TextStyle(
                    color: Color(0xff1E222B),
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 15,
              ),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Home',
                  border: OutlineInputBorder(),
                ),
                // You can handle the entered address using the onChanged or onSubmitted callback
                // onChanged: (address) {
                //   // Handle the address entered by the user
                // },
              ),
              const SizedBox(height: 20),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Office',
                  border: OutlineInputBorder(),
                ),
                // You can handle the entered address using the onChanged or onSubmitted callback
                // onChanged: (address) {
                //   // Handle the address entered by the user
                // },
              ),
              const SizedBox(height: 20),
              Image.asset("assets/Images/Add Button.png"),
              const SizedBox(height: 20),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CardDetailsScreen(),
                    ),
                  );
                  // Handle the "Add Card" button tap
                  // You can navigate to another screen or perform any desired action here.
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: screenOneColor,
                  minimumSize: const Size(
                      400, 60), // Set the button's background color to blue
                ),
                child: const Text(
                  'Add Card',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
              // Add some spacing
              // TextField(
              //   decoration: InputDecoration(
              //     labelText: 'Enter your address',
              //     labelStyle: const TextStyle(
              //       color: Colors.black,
              //     ),
              //     border: const OutlineInputBorder(),
              //     prefixIcon: GestureDetector(
              //       onTap: () {
              //         // Handle address confirmation here.
              //         final enteredAddress = addressController.text;
              //         // You can do something with the entered address, e.g., save it or perform an action.
              //         // For now, let's print it.
              //         print("Home: $enteredAddress");
              //       },
              //     ),
              //   ),
              // ),
              // TextField(
              //   decoration: InputDecoration(
              //     labelText: 'Enter your address',
              //     labelStyle: const TextStyle(
              //       color: Colors.black,
              //     ),
              //     border: const OutlineInputBorder(),
              //     prefixIcon: GestureDetector(
              //       onTap: () {
              //         // Handle address confirmation here.
              //         final enteredAddress = addressController.text;
              //         // You can do something with the entered address, e.g., save it or perform an action.
              //         // For now, let's print it.
              //         print("Office: $enteredAddress");
              //       },
              //     ),
              //   ),
              // ),

              // You can handle the entered address using the onChanged or onSubmitted callback
              // onChanged: (address) {
              //   // Handle the address entered by the user
              // },

              // Your address entry form fields (TextFormField widgets) here
              // Submit button to process address details and navigate back
              // Row(
              //   children: [
              //     ElevatedButton(
              //       onPressed: () {
              //         // Process address details here (e.g., save to database)
              //         // Then navigate back to CartView or another screen
              //         Navigator.pop(context);
              //       },
              //       child: const Text('Add Card'),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
