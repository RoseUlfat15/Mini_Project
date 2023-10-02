import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final List _deals = [
    //[itemName, itemPrice, itemPath, color]
    [
      "Fresh Lemon",
      "12.00",
      "assets/Images/lemon.png",
      Colors.grey[100],
    ],
    [
      "Green Tea",
      "06.00",
      "assets/Images/greentea.png",
      Colors.grey[100],
    ],
    [
      "Fresh Mangoes",
      "15.00",
      "assets/Images/Mango.png",
      Colors.grey[100],
    ],
    [
      "Bananas",
      "10.00",
      "assets/Images/banana.png",
      Colors.grey[100],
    ],
  ];

  final List _categoryitem = [
    //[itemName, subtext, itempath, color]
    [
      "Fishes",
      "From Sea",
      'assets/Images/fishes.png',
      Colors.grey[100],
    ],
    [
      "Meats",
      "Organic",
      'assets/Images/meat.png',
      Colors.grey[100],
    ],
    [
      "Vegetables",
      "Organic",
      'assets/Images/vegetables.png',
      Colors.grey[100],
    ],
    [
      "Fruits",
      "Fresh & Organic",
      'assets/Images/fruits.png',
      Colors.grey[100],
    ],
    [
      "Dairy",
      "Organic",
      'assets/Images/dairy.png',
      Colors.grey[100],
    ],
    [
      "Beverages",
      "Top Quality",
      'assets/Images/beverages.png',
      Colors.grey[100],
    ],
  ];

  final List _fruits = [
    //[itemName, itemPrice, itemPath, color]
    [
      "Apples",
      "5.00",
      "assets/Images/apple.png",
      Colors.grey[100],
    ],
    [
      "Mango",
      "06.00",
      "assets/Images/Mango.png",
      Colors.grey[100],
    ],
    [
      "Bananas",
      "3.00",
      "assets/Images/banana.png",
      Colors.grey[100],
    ],
    [
      "Oranges",
      "8.00",
      "assets/Images/Oranges.png",
      Colors.grey[100],
    ],
    [
      "Cherry",
      "5.00",
      "assets/Images/Cherry.png",
      Colors.grey[100],
    ],
    [
      "Peaches",
      "9.00",
      "assets/Images/Peaches.png",
      Colors.grey[100],
    ],
    [
      "Grapes",
      "9.00",
      "assets/Images/Grapes.png",
      Colors.grey[100],
    ],
    [
      "Pineapple",
      "9.00",
      "assets/Images/Pineapple.png",
      Colors.grey[100],
    ],
  ];

  final List _vegetables = [
    //[itemName, itemPrice, itemPath, color]
    [
      "Potatos",
      "5.00",
      "assets/Images/potato.png",
      Colors.grey[100],
    ],
    [
      "Tomatoes",
      "06.00",
      "assets/Images/tomatos.jpg",
      Colors.grey[100],
    ],
    [
      "Onions",
      "3.00",
      "assets/Images/onions.png",
      Colors.grey[100],
    ],
    [
      "Lemons",
      "8.00",
      "assets/Images/lemon.png",
      Colors.grey[100],
    ],
    [
      "Egg Plant",
      "5.00",
      "assets/Images/eggplant.png",
      Colors.grey[100],
    ],
    [
      "Broccoli",
      "9.00",
      "assets/Images/broccoli.png",
      Colors.grey[100],
    ],
    [
      "Carrots",
      "9.00",
      "assets/Images/carrot.png",
      Colors.grey[100],
    ],
  ];

  final List _dairy = [
    //[itemName, itemPrice, itemPath, color]
    [
      "Milk",
      "5.00",
      "assets/Images/milk.jpeg",
      Colors.grey[100],
    ],
    [
      "Egg",
      "06.00",
      "assets/Images/egg.png",
      Colors.grey[100],
    ],
    [
      "Bread",
      "3.00",
      "assets/Images/bread.png",
      Colors.grey[100],
    ],
    [
      "Butter",
      "8.00",
      "assets/Images/butter.png",
      Colors.grey[100],
    ],
  ];
  final List _beverages = [
    //[itemName, itemPrice, itemPath, color]
    [
      "Water",
      "5.00",
      "assets/Images/water.png",
      Colors.grey[100],
    ],
    [
      "Cold Drinks",
      "06.00",
      "assets/Images/colddrink.png",
      Colors.grey[100],
    ],
    [
      "Juice",
      "3.00",
      "assets/Images/juice1.png",
      Colors.grey[100],
    ],
    [
      "Fresh Juice",
      "8.00",
      "assets/Images/juice.png",
      Colors.grey[100],
    ],
  ];
//list of cart items
  final List<Product> _cartItems = [];

  get cartItems => _cartItems;

  get deals => _deals;
  get categoryitems => _categoryitem;

  get vegetables => _vegetables;
  get fruits => _fruits;
  get dairy => _dairy;
  get beverages => _beverages;

  //add items to the cart
  void addItemToCart(Product product) {
    _cartItems.add(product);
    notifyListeners();
  }

  // void addfishmeatItemToCart(int index) {
  //   _cartItems.add(_vegetables[index]);
  //   notifyListeners();
  // }

  void addfruitItemToCart(int index) {
    _cartItems.add(_fruits[index]);
    notifyListeners();
  }

  void addVegItemToCart(int index) {
    _cartItems.add(_vegetables[index]);
    notifyListeners();
  }

  void addDairyItemToCart(int index) {
    _cartItems.add(_dairy[index]);
    notifyListeners();
  }

  void addBevItemToCart(int index) {
    _cartItems.add(_beverages[index]);
    notifyListeners();
  }

  // Add methods to increase and decrease item quantity
  void increaseItemQuantity(Product product) {
    final index = _cartItems.indexWhere((item) => item.name == product.name);
    if (index != -1) {
      _cartItems[index].quantity++;
      notifyListeners();
    }
  }

  void decreaseItemQuantity(Product product) {
    final index = _cartItems.indexWhere((item) => item.name == product.name);
    if (index != -1 && _cartItems[index].quantity > 1) {
      _cartItems[index].quantity--;
      notifyListeners();
    }
  }

  //removing items to the cart
  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  //calculate total price
  double calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      totalPrice += (_cartItems[i].quantity * _cartItems[i].price);
    }
    return totalPrice;
  }
}

class Product {
  String name;
  double price;
  String imagePath;
  Color color;
  int quantity; // Quantity of the product in the cart

  Product({
    required this.name,
    required this.price,
    required this.imagePath,
    required this.color,
    this.quantity =
        1, // Default quantity ek hoti hai jab item cart mein add hota hai
  });
}
