import 'package:aastu_suk/Pages/personalShop.dart';
import 'package:aastu_suk/Pages/singleShop.dart';
import 'package:aastu_suk/components/myDrawer.dart';
import 'package:aastu_suk/components/productTile.dart';
import 'package:aastu_suk/models/appProvider.dart';
import 'package:aastu_suk/models/product.dart';
import 'package:aastu_suk/models/shop.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  static const route = '/shop_page';

  @override
  Widget build(BuildContext context) {
    final myShop = Provider.of<AppProvider>(context);

    void addTOCartConfirm(BuildContext context2, Product product) {
      showDialog(
        context: context,
        builder: ((context) => AlertDialog(
              elevation: 5,
              content: const Text(
                "Are you sure you want to add this to the waitlist?",
                textAlign: TextAlign.center,
              ),
              actions: [
                MaterialButton(
                  onPressed: (() {
                    Navigator.pop(context);
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
        title: const Text('AASTU Shop'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
              onPressed: (() {
                Navigator.pushNamed(context, PersonalShop.route);
              }),
              icon: const Icon(
                Icons.shopify_outlined,
                size: 40,
                color: Colors.deepPurple,
              ))
        ],
      ),
      body: Container(
          child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Shops").snapshots(
            includeMetadataChanges:
                true), //to update realtime when data is changed in firestore
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }

          final shops = snapshot.data!.docs;

          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: shops.length,
                itemBuilder: ((context, index) {
                  final products = shops[index]['Products'];
                  if (shops[index]['creatorID'] ==
                      FirebaseAuth.instance.currentUser!.email) {
                    myShop.changeMyShop(shops[index].id);
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, SingleShop.route,
                              arguments: {
                                'name': shops[index]['name'],
                                'location': shops[index]['location'],
                                'image': shops[index]['image'],
                                'creatorID': shops[index]['creatorID'],
                                'Orders': shops[index]['Orders'],
                                'Products': shops[index]['Products'],
                                'Owner': shops[index]['Owner'],
                              });
                        },
                        child: Container(
                          padding: const EdgeInsets.only(left: 20, top: 20),
                          child: Text(shops[index]['name'],
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary
                                      .withOpacity(.9),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18)),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(shops[index]['location'],
                            style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary
                                    .withOpacity(1),
                                fontWeight: FontWeight.w300,
                                fontSize: 10)),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      shops[index]['Products'].isEmpty
                          ? ConstrainedBox(
                              constraints: BoxConstraints(
                                  maxHeight:
                                      MediaQuery.of(context).size.height / 8),
                              child: const Center(
                                  child: Text("No Products yet!!")),
                            )
                          : ConstrainedBox(
                              constraints: BoxConstraints(
                                  maxHeight:
                                      MediaQuery.of(context).size.height / 1.7),
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 1,
                                  itemBuilder: ((context, indextwo) {
                                    return ProductTile(
                                        name: products[indextwo]['name'],
                                        desc: products[indextwo]['desc'],
                                        price: products[indextwo]['price']);
                                  })),
                            )
                    ],
                  );
                }));
          }

          return const Center(
            child: Text("othing to show!!"),
          );
        },
      )),
      drawer: MyDrawer(),
    );
  }
}

// ListView.builder(
//             itemCount: allShops.shopsCount,
//             itemBuilder: ((context, index) {
//               final oneShop = allShops.shops[index];

//               return Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       padding: const EdgeInsets.only(left: 20, top: 20),
//                       child: Text(oneShop.name,
//                           style: TextStyle(
//                               color: Theme.of(context)
//                                   .colorScheme
//                                   .inversePrimary
//                                   .withOpacity(.9),
//                               fontWeight: FontWeight.w500,
//                               fontSize: 18)),
//                     ),
//                     const SizedBox(
//                       height: 5,
//                     ),
//                     Container(
//                       padding: const EdgeInsets.only(left: 20),
//                       child: Text(oneShop.location,
//                           style: TextStyle(
//                               color: Theme.of(context)
//                                   .colorScheme
//                                   .inversePrimary
//                                   .withOpacity(1),
//                               fontWeight: FontWeight.w300,
//                               fontSize: 10)),
//                     ),
//                     const SizedBox(
//                       height: 15,
//                     ),
//                     ConstrainedBox(
//                       constraints: BoxConstraints(
//                           maxHeight: MediaQuery.of(context).size.height / 1.7),
//                       child: ListView.builder(
//                           scrollDirection: Axis.horizontal,
//                           itemCount: oneShop.productCount,
//                           itemBuilder: ((context, index) {
//                             final oneProduct = oneShop.products[index];

//                             return Material(
//                               elevation: 1,
//                               child: Container(
//                                 padding: const EdgeInsets.all(10),
//                                 width: MediaQuery.of(context).size.width / 1.3,
//                                 // height: MediaQuery.of(context).size.height / 2,
//                                 margin: const EdgeInsets.only(left: 20),
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(5),
//                                   color: Theme.of(context).cardColor,
//                                 ),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         AspectRatio(
//                                           aspectRatio: 1,
//                                           child: Container(
//                                             margin: const EdgeInsets.only(
//                                                 bottom: 10),
//                                             width: double.infinity,
//                                             decoration: BoxDecoration(
//                                                 color: Theme.of(context)
//                                                     .colorScheme
//                                                     .primary,
//                                                 border: Border.all(
//                                                     color: Theme.of(context)
//                                                         .colorScheme
//                                                         .background
//                                                         .withOpacity(.3))),
//                                             child: const Icon(Icons.favorite),
//                                           ),
//                                         ),
//                                         Text(
//                                           oneProduct.name,
//                                           style: TextStyle(
//                                             fontSize: 20,
//                                           ),
//                                         ),
//                                         const SizedBox(
//                                           height: 10,
//                                         ),
//                                         Text(
//                                           oneProduct.description,
//                                           style: TextStyle(
//                                               color: Theme.of(context)
//                                                   .colorScheme
//                                                   .inversePrimary),
//                                         ),
//                                       ],
//                                     ),
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Text("${oneProduct.price}Birr"),
//                                         Container(
//                                           decoration: BoxDecoration(
//                                             color: Theme.of(context)
//                                                 .colorScheme
//                                                 .primary,
//                                             border: Border.all(
//                                                 color: Theme.of(context)
//                                                     .colorScheme
//                                                     .background
//                                                     .withOpacity(.9)),
//                                             borderRadius:
//                                                 BorderRadius.circular(5),
//                                           ),
//                                           child: IconButton(
//                                               color: Theme.of(context)
//                                                   .colorScheme
//                                                   .inversePrimary,
//                                               onPressed: () => addTOCartConfirm(
//                                                   context, oneProduct),
//                                               icon: const Icon(Icons.add)),
//                                         )
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             );
//                           })),
//                     )
//                   ]);
//             })),
      