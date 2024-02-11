import 'package:aastu_suk/features/storage_service.dart';
import 'package:flutter/material.dart';

class SingleShop extends StatelessWidget {
  static String route = '/singleShop';
  SingleShop({
    super.key,
  });

  final Storage storage = Storage();

  @override
  Widget build(BuildContext context) {
    final Map shop = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        title: Text(shop['name']),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FutureBuilder(
                future: storage.downloadURL(path: shop['image']),
                builder: (context, snapshot) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 1/4,
                    child: Image.network(
                      snapshot.data!,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
              Container(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: Text(shop['name'],
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
                child: Text(shop['location'],
                    style: TextStyle(
                        color: Theme.of(context)
                            .colorScheme
                            .inversePrimary
                            .withOpacity(1),
                        fontWeight: FontWeight.w300,
                        fontSize: 10)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
