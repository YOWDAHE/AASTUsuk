import 'package:aastu_suk/models/cartItem.dart';
import 'package:aastu_suk/models/product.dart';
import 'package:aastu_suk/models/shop.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AppProvider extends ChangeNotifier {
  String myShop = "";

  void changeMyShop(String name) {
    myShop = name;
    notifyListeners();
  }

  List<Shop> shops = [
    Shop(
        name: "AASTU",
        location: "infron of kk",
        expireTime: 30,
        orders: [],
        products: [],
        owner: "unknown"),
    Shop(
        name: "KK",
        location: "infron of AASTU",
        expireTime: 90,
        orders: [],
        products: [],
        owner: "unknown"),
  ];

  List<CartItem> cartItems = [];

  int get cartItemCount => cartItems.length;
  int get shopsCount => shops.length;

  // UserCredential appUserCredential;

  void addTOCart(Product newProduct) {
    final newCartItem = CartItem(product: newProduct, count: 1);
    cartItems.add(newCartItem);
    notifyListeners();
  }

  void removeFromCart(CartItem cartItem) {
    cartItems.remove(cartItem);
    notifyListeners();
  }
}
