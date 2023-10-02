// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:app_figma/model/cart_model.dart';
import 'package:app_figma/widgets/Color_Constant.dart';
import 'package:flutter/material.dart';

class ItemTile extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String imagePath;
  final color;
  final Product product;
  final void Function()? onPressed;

  ItemTile({
    Key? key,
    required this.itemName,
    required this.itemPrice,
    required this.imagePath,
    required this.color,
    required this.product,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //item image
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Image.asset(
                imagePath,
                height: 64,
              ),
            ),
            //item name
            Text(
              itemName,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),

            //price+button

            MaterialButton(
              onPressed: onPressed,
              color: Colors.amber,
              child: Text(
                '\$$itemPrice',
                style: const TextStyle(
                    color: screenOneColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
