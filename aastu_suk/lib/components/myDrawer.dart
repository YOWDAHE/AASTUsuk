import 'dart:ffi';

import 'package:aastu_suk/Pages/cart_page.dart';
import 'package:aastu_suk/Pages/intro_page.dart';
import 'package:aastu_suk/components/myDrawerListTile.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.primary,
      elevation: 0,
      child: Container(
        padding: const EdgeInsets.only(bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const DrawerHeader(child: Icon(Icons.shopping_bag_outlined)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        MyDrawerListTile(
                            icon: Icons.home_filled,
                            title: "Shop",
                            onTap: () {
                              Navigator.pop(context);
                            }),
                        MyDrawerListTile(
                            icon: Icons.shopping_cart,
                            title: "Cart",
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.pushNamed(context, CartPage.route);
                            }),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            MyDrawerListTile(
                icon: Icons.exit_to_app, title: "Exit", onTap: ()=>Navigator.pushNamedAndRemoveUntil(context, IntroPage.route, (route) => false))
          ],
        ),
      ),
    );
  }
}
