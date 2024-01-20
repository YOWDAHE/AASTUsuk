import 'package:aastu_suk/components/myDrawer.dart';
import 'package:aastu_suk/models/appProvider.dart';
import 'package:aastu_suk/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  static const route = '/shop_page';

  @override
  Widget build(BuildContext context) {
    final allShops = Provider.of<AppProvider>(context);

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
                    allShops.addTOCart(product);
                  }),
                  child: const Text("Ok"),
                ),
                MaterialButton(
                  onPressed: (()=> Navigator.pop(context)),
                  child: const Text("Cancel"),
                )
              ],
            )),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Container(
        child: ListView.builder(
            itemCount: allShops.shopsCount,
            itemBuilder: ((context, index) {
              final oneShop = allShops.shops[index];

              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 20, top: 20),
                      child: Text(oneShop.name,
                          style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .inversePrimary
                                  .withOpacity(.9),
                              fontWeight: FontWeight.w500,
                              fontSize: 18)),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(oneShop.location,
                          style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .inversePrimary
                                  .withOpacity(1),
                              fontWeight: FontWeight.w300,
                              fontSize: 10)),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.height / 1.7),
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: oneShop.productCount,
                          itemBuilder: ((context, index) {
                            final oneProduct = oneShop.products[index];

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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AspectRatio(
                                          aspectRatio: 1,
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                                bottom: 10),
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                                border: Border.all(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .background
                                                        .withOpacity(.3))),
                                            child: const Icon(Icons.favorite),
                                          ),
                                        ),
                                        Text(
                                          oneProduct.name,
                                          style: TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          oneProduct.description,
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .inversePrimary),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("${oneProduct.price}Birr"),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            border: Border.all(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .background
                                                    .withOpacity(.9)),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: IconButton(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .inversePrimary,
                                              onPressed: () => addTOCartConfirm(
                                                  context, oneProduct),
                                              icon: const Icon(Icons.add)),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          })),
                    )
                  ]);
            })),
      ),
      drawer: MyDrawer(),
    );
  }
}
