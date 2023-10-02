import 'package:app_figma/widgets/cartcount.dart';
import 'package:app_figma/widgets/item_tile.dart';
import 'package:app_figma/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VegetablesPage extends StatelessWidget {
  const VegetablesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartModel>(
      builder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Vegetables"),
            actions: const [
              CartWidget(), // Use the CartWidget here
            ],
          ),
          body: GridView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: value.vegetables.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1 / 1.2,
            ),
            itemBuilder: (context, index) {
              Product productToAdd = Product(
                name: value.vegetables[index][0],
                price: double.parse(value.vegetables[index][1]),
                imagePath: value.vegetables[index][2],
                color: value.vegetables[index][3],
              );
              return ItemTile(
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
            },
          ),
        );
      },
    );
  }
}
