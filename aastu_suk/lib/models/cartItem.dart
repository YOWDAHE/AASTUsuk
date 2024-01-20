import 'package:aastu_suk/models/product.dart';

class CartItem {

  final Product product;
  int count;

  CartItem({required this.count, required this.product});
}
