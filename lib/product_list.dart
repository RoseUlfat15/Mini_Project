import 'package:flutter/material.dart';

class Product {
  final String itemName;
  final String itemPrice;
  final String imagePath;
  final color;

  Product({
    required this.itemName,
    required this.itemPrice,
    required this.imagePath,
    required this.color,
  });
}

final List<Product> products = [
  Product(
    itemName: "Fresh Lemon",
    itemPrice: "12.00",
    imagePath: "assets/Images/lemon.png",
    color: Colors.grey[100],
  ),
  Product(
    itemName: "Green Tea",
    itemPrice: "06.00",
    imagePath: "assets/Images/greentea.png",
    color: Colors.grey[100],
  ),
  Product(
    itemName: "Fresh Mangoes",
    itemPrice: "15.00",
    imagePath: "assets/Images/Mango.png",
    color: Colors.grey[100],
  ),
  Product(
    itemName: "Bananas",
    itemPrice: "10.00",
    imagePath: "assets/Images/banana.png",
    color: Colors.grey[100],
  ),
];
