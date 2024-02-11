import 'package:aastu_suk/Pages/SignUp_page.dart';
import 'package:aastu_suk/Pages/add_shop.dart';
import 'package:aastu_suk/Pages/cart_page.dart';
import 'package:aastu_suk/Pages/personalShop.dart';
import 'package:aastu_suk/Pages/shop_page.dart';
import 'package:aastu_suk/Pages/singleShop.dart';
import 'package:aastu_suk/auth/auth.dart';
import 'package:aastu_suk/firebase_options.dart';
import 'package:aastu_suk/models/appProvider.dart';
import 'package:aastu_suk/models/cart.dart';
import 'package:aastu_suk/themes/light_mode.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Pages/intro_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const AuthPage(),
      theme: lightMode,
      routes: {
        IntroPage.route: (context) => const IntroPage(),
        SignUpPage.route: (context) => const SignUpPage(),
        ShopPage.route: (context) => const ShopPage(),
        CartPage.route: (context) => const CartPage(),
        AddShop.route: (context) =>  AddShop(),
        SingleShop.route:(context) => SingleShop(),
        PersonalShop.route:(context) => const PersonalShop(),
      },
    );
  }
}
