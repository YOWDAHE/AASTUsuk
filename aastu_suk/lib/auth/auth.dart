import 'package:aastu_suk/Pages/intro_page.dart';
import 'package:aastu_suk/Pages/shop_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return const ShopPage();
          } else {
            return const IntroPage();
          }
        }),
      ),
    );
  }
}
