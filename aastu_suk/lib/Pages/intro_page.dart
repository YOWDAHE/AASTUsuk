import 'package:aastu_suk/Pages/shop_page.dart';
import 'package:aastu_suk/components/myButton.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  static const route = '/into_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.shopping_bag_outlined,
                  size: 92,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                const SizedBox(height: 30),
                const Text("AASTU SHOP",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    )),
                const SizedBox(height: 10),
                Text("At the comfort of your dorm.",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      // fontWeight: FontWeight.extraLight,
                      fontSize: 10,
                    )),
                const SizedBox(height: 30),
                MyButton(
                    onTap: () => Navigator.pushNamed(context, ShopPage.route),
                    child: Icon(
                      Icons.arrow_circle_right_outlined,
                      size: 50,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ))
              ]),
        ));
  }
}
