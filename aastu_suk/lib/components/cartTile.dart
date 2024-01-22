import 'package:flutter/material.dart';

class CartTile extends StatelessWidget {
  const CartTile(
      {super.key, required this.count, required this.from, required this.name});

  final String name;
  final String from;
  final int count;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
                    name,
                    style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).colorScheme.inversePrimary),
                  ),
                  Row(
                    children: [
                      Text(
                        "Amount: ",
                        style: TextStyle(
                            fontSize: 10,
                            color:
                                Theme.of(context).colorScheme.inversePrimary),
                      ),
                      Text(
                        count.toString(),
                        style: TextStyle(
                            // fontSize: 20,
                            color:
                                Theme.of(context).colorScheme.inversePrimary),
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
                      color: Theme.of(context).colorScheme.inversePrimary,
                      onPressed: () {
                        // removeFromCartConfirm(
                        //     context, allShops.cartItems[index]);
                      },
                      icon: const Icon(Icons.delete, size: 15)),
                ),
                Row(
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
                          color: Theme.of(context).colorScheme.inversePrimary,
                          onPressed: () {
                            // int count =
                            //     allShops.cartItems[index].count;
                            // if (count > 1) {
                            //   setState(() {
                            //     allShops.cartItems[index].count -=
                            //         1;
                            //   });
                            // } else {
                            //   removeFromCartConfirm(context,
                            //       allShops.cartItems[index]);
                            // }
                          },
                          icon: Container(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: const Icon(Icons.minimize, size: 15))),
                    ),
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
                          color: Theme.of(context).colorScheme.inversePrimary,
                          onPressed: () {
                            // setState(() {
                            //   allShops.cartItems[index].count += 1;
                            // });
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
  }
}
