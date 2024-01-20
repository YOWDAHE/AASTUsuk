import 'package:aastu_suk/models/cartItem.dart';
import 'package:flutter/cupertino.dart';

class Cart extends ChangeNotifier {
  List<CartItem> cartItems = [];
  int get itemCount => cartItems.length;

  void addTOCart(CartItem newItem) {
    cartItems.add(newItem);
    notifyListeners();
  }

  void removeFromCart(CartItem cartItem) {
    cartItems.remove(cartItem);
    notifyListeners();
  }

  void removeFromCartByIndex(int index) {
    cartItems.removeAt(index);
    notifyListeners();
  }

  void removeFromCartByName(String name) {
    cartItems.removeWhere((element) => element.product.name == name);
    notifyListeners();
  }
}
