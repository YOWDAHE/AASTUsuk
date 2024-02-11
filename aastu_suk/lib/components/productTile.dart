import 'package:aastu_suk/models/product.dart';
import 'package:aastu_suk/models/shop.dart';
import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  const ProductTile(
      {super.key,
      required this.name,
      required this.desc,
      required this.price,});

  final String name;
  final String price;
  final String desc;
  // final Shop singleShop;
  // final String desc;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      child: Container(
        padding: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width / 1.3,
        // height: MediaQuery.of(context).size.height / 2,
        margin: const EdgeInsets.only(left: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Theme.of(context).cardColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        border: Border.all(
                            color: Theme.of(context)
                                .colorScheme
                                .background
                                .withOpacity(.3))),
                    child: const Icon(Icons.favorite),
                  ),
                ),
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  desc,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${price}Birr"),
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
                      onPressed: () =>
                          // addTOCartConfirm(context, oneProduct),
                          print("object"),
                      icon: const Icon(Icons.add)),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
