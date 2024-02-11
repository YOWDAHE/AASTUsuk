import 'dart:ffi';

import 'package:aastu_suk/models/product.dart';
import 'package:flutter/cupertino.dart';

class Shop {
  final String name;
  final String location;
  final int expireTime;
  final List orders;
  final List products;
  final String owner;

  // List<Product> products = [
  //   Product(
  //     name: "Apple",
  //     price: 1.2,
  //     description: "its an apple",
  //   ),
  //   Product(name: "Orange", price: 1.2, description: "its an orange"),
  //   Product(name: "bannana", price: 1.2, description: "its an bannana"),
  //   Product(name: "Water", price: 1.2, description: "its an Water"),
  //   Product(name: "Juice", price: 1.2, description: "its an Juice"),
  // ];

  // int get productCount => products.length;

  Shop(
      {required this.name,
      required this.location,
      required this.expireTime,
      required this.orders,
      required this.owner,
      required this.products});
}
