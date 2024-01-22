import 'dart:ffi';

import 'package:aastu_suk/components/cartTile.dart';
import 'package:aastu_suk/components/myDrawer.dart';
import 'package:aastu_suk/models/appProvider.dart';
import 'package:aastu_suk/models/cartItem.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  static const route = "/cart";

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final currentUser = FirebaseAuth.instance.currentUser;

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserData() async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser?.email)
        .get();
  }

  @override
  Widget build(BuildContext context) {
    final allShops = Provider.of<AppProvider>(context);

    void removeFromCartConfirm(BuildContext context2, CartItem delete) {
      showDialog(
        context: context,
        builder: ((context) => AlertDialog(
              elevation: 5,
              content: const Text(
                "Are you sure you want to remove this item?",
                textAlign: TextAlign.center,
              ),
              actions: [
                MaterialButton(
                  onPressed: (() {
                    Navigator.pop(context);
                    allShops.removeFromCart(delete);
                  }),
                  child: const Text("Ok"),
                ),
                MaterialButton(
                  onPressed: (() => Navigator.pop(context)),
                  child: const Text("Cancel"),
                )
              ],
            )),
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Cart'),
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: FutureBuilder(
          future: getUserData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }

            if (snapshot.hasData) {
              Map<String, dynamic>? userData = snapshot.data?.data();

              if (userData!['cart'].isEmpty) {
                return const Center(
                  child: Text("There are no items to display."),
                );
              } else {
                return ListView.builder(
                  itemCount: userData['cart'].length,
                  itemBuilder: ((context, index) {
                    return CartTile(
                        count: userData['cart'][index]['count'],
                        from: userData['cart'][index]['from'],
                        name: userData['cart'][index]['name']);
                  }),
                );
              }
            }

            return const Center(
              child: Text('No data available!'),
            );
          },
        )
        // drawer: MyDrawer(),
        );
  }
}
