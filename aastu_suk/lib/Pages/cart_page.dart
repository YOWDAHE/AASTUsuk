import 'package:aastu_suk/components/myDrawer.dart';
import 'package:aastu_suk/models/appProvider.dart';
import 'package:aastu_suk/models/cartItem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  static const route = "/cart";

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
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
      body: Container(
          child: ListView.builder(
              itemCount: allShops.cartItemCount,
              itemBuilder: ((context, index) {
                // return Text("data");
                return SizedBox(
                  height: 150,
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                allShops.cartItems[index].product.name,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Amount: ",
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .inversePrimary),
                                  ),
                                  Text(
                                    allShops.cartItems[index].count.toString(),
                                    style: TextStyle(
                                        // fontSize: 20,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .inversePrimary),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.primary,
                                border: Border.all(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background
                                        .withOpacity(.9)),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: IconButton(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary,
                                  onPressed: () {
                                    removeFromCartConfirm(
                                        context, allShops.cartItems[index]);
                                  },
                                  icon: const Icon(Icons.delete, size: 15)),
                            ),
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    border: Border.all(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .background
                                            .withOpacity(.9)),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: IconButton(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .inversePrimary,
                                      onPressed: () {
                                        int count =
                                            allShops.cartItems[index].count;
                                        if (count > 1) {
                                          setState(() {
                                            allShops.cartItems[index].count -= 1;
                                          });
                                        } else {
                                          removeFromCartConfirm(context,
                                              allShops.cartItems[index]);
                                        }
                                      },
                                      icon: Container(
                                          padding:
                                              const EdgeInsets.only(bottom: 10),
                                          child: const Icon(Icons.minimize,
                                              size: 15))),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    border: Border.all(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .background
                                            .withOpacity(.9)),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: IconButton(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .inversePrimary,
                                      onPressed: () {
                                        setState(() {
                                          allShops.cartItems[index].count += 1;
                                        });
                                      },
                                      icon: const Icon(Icons.add, size: 15)),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }))),
      // drawer: MyDrawer(),
    );
  }
}
