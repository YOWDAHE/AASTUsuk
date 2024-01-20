import 'package:aastu_suk/models/cartItem.dart';
import 'package:aastu_suk/models/product.dart';
import 'package:aastu_suk/models/shop.dart';
import 'package:flutter/cupertino.dart';

class AppProvider extends ChangeNotifier {
  List<Shop> shops = [
    Shop(name: "AASTU", location: "infron of kk", expireTime: 30),
    Shop(name: "KK", location: "infron of AASTU", expireTime: 90),
  ];
  List<CartItem> cartItems = [];

  int get cartItemCount => cartItems.length;
  int get shopsCount => shops.length;

  void addTOCart(Product newProduct) {
    final newCartItem = CartItem(product: newProduct, count: 1);
    cartItems.add(newCartItem);
    notifyListeners();
  }

  void removeFromCart(CartItem cartItem) {
    cartItems.remove(cartItem);
    notifyListeners();
  }

  // void removeFromCartByIndex(int index) {
  //   cartItems.removeAt(index);
  //   notifyListeners();
  // }

  // void removeFromCartByName(String name) {
  //   cartItems.removeWhere((element) => element.product.name == name);
  //   notifyListeners();
  // }
}
