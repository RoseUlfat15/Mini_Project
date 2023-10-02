// ignore_for_file: must_be_immutable, file_names, prefer_interpolation_to_compose_strings

import 'package:app_figma/Screens/Address_Entry.dart';
import 'package:app_figma/model/cart_model.dart';
import 'package:app_figma/widgets/Color_Constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Consumer<CartModel>(
        builder: (context, value, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  "Shopping Cart",
                  style: GoogleFonts.notoSerif(
                      fontSize: 36, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: ListView.builder(
                    itemCount: value.cartItems.length,
                    padding: const EdgeInsets.all(7.0),
                    itemBuilder: (context, index) {
                      final cartItem = value.cartItems[index];
                      return Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8)),
                          child: ListTile(
                            leading: Image.asset(
                              value.cartItems[index].imagePath,
                              height: 35,
                            ),
                            title: Text(
                              value.cartItems[index].name,
                              style: const TextStyle(fontSize: 14),
                            ),
                            subtitle: Text(
                              '\$' + value.cartItems[index].price.toString(),
                              style: const TextStyle(fontSize: 11),
                            ),
                            trailing: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.remove),
                                    onPressed: () {
                                      // Decrease the quantity when "-" button is pressed
                                      Provider.of<CartModel>(context,
                                              listen: false)
                                          .decreaseItemQuantity(cartItem);
                                    },
                                  ),
                                  Text(
                                    cartItem.quantity.toString(),
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.add),
                                    onPressed: () {
                                      // Increase the quantity when "+" button is pressed
                                      Provider.of<CartModel>(context,
                                              listen: false)
                                          .increaseItemQuantity(cartItem);
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(
                                        Icons.delete_outline_rounded),
                                    onPressed: () => Provider.of<CartModel>(
                                            context,
                                            listen: false)
                                        .removeItemFromCart(index),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              // Total price + "Pay Now" button
              Padding(
                  padding: const EdgeInsets.all(36.0),
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
                              // Navigate to the address entry screen
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const AddressEntryScreen(),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(14)),
                              padding: const EdgeInsets.all(12),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Proceed To Checkout",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.amber,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    size: 16,
                                    color: Colors.blue,
                                  )
                                ],
                              ),
                            )),
                      ],
                    ),
                  )),
            ],
          );
        },
      ),
    );
  }
}


              //total + pay now
//               Padding(
//                 padding: const EdgeInsets.all(36.0),
//                 child: Container(
//                   decoration: BoxDecoration(
//                       color: screenOneColor,
//                       borderRadius: BorderRadius.circular(8)),
//                   padding: const EdgeInsets.all(24),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       //price
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Text(
//                             "Total Price",
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
//                         ],
//                       ),
//                       //pay now button
//                       Container(
//                         decoration: BoxDecoration(
//                             border: Border.all(color: Colors.blue),
//                             borderRadius: BorderRadius.circular(14)),
//                         padding: const EdgeInsets.all(12),
//                         child: const Row(
//                           children: [
//                             Text(
//                               "Proceed To Checkout",
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                 color: Colors.amber,
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             Icon(
//                               Icons.arrow_forward_ios_outlined,
//                               size: 16,
//                               color: Colors.blue,
//                             )
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               )
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
