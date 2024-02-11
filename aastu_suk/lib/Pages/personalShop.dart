import 'package:aastu_suk/models/appProvider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PersonalShop extends StatelessWidget {
  static const String route = "/personal_shop";

  const PersonalShop({super.key});

  Future<DocumentSnapshot<Map<String, dynamic>>> getShop(String name) async {
    return await FirebaseFirestore.instance.collection('Shops').doc(name).get();
  }

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Shop'),
      ),
      body: Container(
        child: FutureBuilder(
          future: getShop(appProvider.myShop),
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
              Map<String, dynamic>? shop = snapshot.data?.data();
              return Center(
                child: Text(shop!['name']),
              );
            }

            return const Center(
              child: Text("No data"),
            );
          },
        ),
      ),
    );
  }
}
