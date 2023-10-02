// import 'package:app_figma/model/cart_model.dart';
// import 'package:app_figma/widgets/Color_Constant.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class CardDetailsScreen extends StatelessWidget {
//   const CardDetailsScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Enter Card Details'),
//       ),
//       body: Consumer<CartModel>(builder: (context, value, child) {
//         Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 'Card Number',
//                 style: TextStyle(fontSize: 16),
//               ),
//               TextFormField(
//                 decoration: const InputDecoration(
//                   hintText: 'Enter card number',
//                 ),
//               ),
//               const SizedBox(height: 16),
//               const Text(
//                 'Expiration Date',
//                 style: TextStyle(fontSize: 16),
//               ),
//               TextFormField(
//                 decoration: const InputDecoration(
//                   hintText: 'MM/YY',
//                 ),
//               ),
//               const SizedBox(height: 16),
//               const Text(
//                 'CVV',
//                 style: TextStyle(fontSize: 16),
//               ),
//               TextFormField(
//                 decoration: const InputDecoration(
//                   hintText: 'Enter CVV',
//                 ),
//               ),
//               const SizedBox(height: 32),
//               ElevatedButton(
//                 onPressed: () {
//                   // Handle the button press to submit card details.
//                 },
//                 child: Padding(
//                     padding: const EdgeInsets.all(36.0),
//                     child: Container(
//                       decoration: BoxDecoration(
//                           color: screenOneColor,
//                           borderRadius: BorderRadius.circular(8)),
//                       padding: const EdgeInsets.all(24),
//                       child: Column(
//                         children: [
//                           // Price
//                           const Text(
//                             "Total Price",
//                             textAlign: TextAlign.start,
//                             style: TextStyle(color: Colors.amberAccent),
//                           ),
//                           const SizedBox(height: 4),
//                           Text(
//                             '\$${value.calculateTotal()}',
//                             style: const TextStyle(
//                               color: Colors.amber,
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           const SizedBox(height: 24), // Add some spacing

//                           // "Proceed To Checkout" button
//                           GestureDetector(
//                               onTap: () {
//                                 // Navigate to the address entry screen
//                                 // Navigator.push(
//                                 //   context,
//                                 //   MaterialPageRoute(
//                                 //     builder: (context) =>
//                                 //         const AddressEntryScreen(),
//                                 //   ),
//                                 // );
//                               },
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                     border: Border.all(color: Colors.blue),
//                                     borderRadius: BorderRadius.circular(14)),
//                                 padding: const EdgeInsets.all(12),
//                                 child: const Row(
//                                   children: [
//                                     Text(
//                                       "Proceed To Checkout",
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                         color: Colors.amber,
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                     Icon(
//                                       Icons.arrow_forward_ios_outlined,
//                                       size: 16,
//                                       color: Colors.blue,
//                                     )
//                                   ],
//                                 ),
//                               )),
//                         ],
//                       ),
//                     )),
//               ),
//             ],
//           ),
//         );
//       }),
//     );
//   }
// }

import 'package:app_figma/Screens/track_order.dart';
import 'package:app_figma/model/cart_model.dart';
import 'package:app_figma/widgets/Color_Constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardDetailsScreen extends StatelessWidget {
  const CardDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        titleSpacing: 17,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Add Cart Details",
          style: TextStyle(
            color: Color(0xff1E222B),
            fontSize: 20,
          ),
        ),
      ),
      body: Consumer<CartModel>(
        builder: (context, value, child) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'CARD HOLDER NAME',
                  style: TextStyle(fontSize: 16),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Enter card holder name',
                  ),
                ),
                const SizedBox(
                  height: 10,
                  width: 15,
                ),
                const Text(
                  'CARD NUMBER',
                  style: TextStyle(fontSize: 16),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Enter card number',
                  ),
                ),
                const SizedBox(height: 10), // Add spacing
                Row(
                  children: [
                    Expanded(
                      flex: 2, // Adjust the flex value as needed
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Expiration Date',
                            style: TextStyle(fontSize: 16),
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'MM/YY',
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16), // Add spacing between fields
                    Expanded(
                      flex: 1, // Adjust the flex value as needed
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'CVV',
                            style: TextStyle(fontSize: 16),
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Enter CVV',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // ElevatedButton(
                //   onPressed: () {
                //     // Handle the button press to submit card details.
                //   },
                //   child:
                const Spacer(),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: screenOneColor,
                          borderRadius: BorderRadius.circular(8)),
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        children: [
                          // Price
                          const Text(
                            "Total Price",
                            textAlign: TextAlign.start,
                            style: TextStyle(color: Colors.amberAccent),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '\$${value.calculateTotal()}',
                            style: const TextStyle(
                              color: Colors.amber,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 24), // Add some spacing

                          // "Proceed To Checkout" button
                          GestureDetector(
                              onTap: () {
                                //Navigate to the track order screen
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const TrackOrderScreen(),
                                  ),
                                );
                              },
                              child: Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.blue),
                                      borderRadius: BorderRadius.circular(15)),
                                  padding: const EdgeInsets.all(15),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Make Payment",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.amber,
                                          fontSize: 18,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        size: 16,
                                        color: Colors.blue,
                                      )
                                    ],
                                  ),
                                ),
                              )),
                        ],
                      ),
                    )),
              ],
            ),
          );
        },
      ),
    );
  }
}
