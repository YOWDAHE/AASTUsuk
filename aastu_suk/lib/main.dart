import 'package:aastu_suk/Pages/cart_page.dart';
import 'package:aastu_suk/Pages/shop_page.dart';
import 'package:aastu_suk/themes/light_mode.dart';
import 'package:flutter/material.dart';

import 'Pages/intro_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: IntroPage(),
      theme: lightMode,

      routes: {
        IntroPage.route:(context) => const IntroPage(),
        ShopPage.route:(context) => const ShopPage(),
        CartPage.route:(context) => const CartPage(),
      },
    );
  }
}