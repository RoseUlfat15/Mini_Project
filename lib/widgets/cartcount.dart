import 'package:app_figma/Screens/cartPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_figma/model/cart_model.dart'; // Import your CartModel class.

class CartWidget extends StatelessWidget {
  const CartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartModel>(context);

    return Stack(
      alignment: Alignment.topRight,
      children: [
        IconButton(
          onPressed: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CartView(),
              ),
            );
          },
          icon: const Icon(Icons.shopping_bag),
        ),
        if (cart.cartItems.length > 0)
          Positioned(
            right: 8,
            top: 8,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
              ),
              child: Text(
                cart.cartItems.length.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
