import 'package:aastu_suk/Pages/SignUp_page.dart';
import 'package:aastu_suk/Pages/shop_page.dart';
import 'package:aastu_suk/components/myButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  static const route = '/into_page';

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void loginUser() async {
    showDialog(
        context: context,
        builder: ((context) => const Center(
              child: CircularProgressIndicator(),
            )));
    if (emailController.value.text != "" &&
        passwordController.value.text != "") {
      try {
        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailController.value.text,
            password: passwordController.value.text);
            
            Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        Navigator.pop(context);
         showDialog(
            context: context,
            builder: ((context) => Center(
                  child: Text(e.message as String),
                )));
      }
    }
  }

  Widget build(BuildContext context) {
    UserCredential userCredential;

    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 60),
                child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
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
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                                // fontWeight: FontWeight.extraLight,
                                fontSize: 10,
                              )),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            TextField(
                              controller: emailController,
                              decoration: InputDecoration(
                                hintText: "Email",
                                focusColor: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100)),
                              ),
                            ),
                            const SizedBox(height: 10),
                            TextField(
                              controller: passwordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: "Password",
                                focusColor: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100)),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Container(
                                width: double.infinity,
                                height: 60,
                                child: ElevatedButton(
                                  child: Text("Login"),
                                  onPressed: (() {
                                    loginUser();
                                  }),
                                  style: ButtonStyle(foregroundColor:
                                      MaterialStateProperty.resolveWith<Color?>(
                                    (Set<MaterialState> states) {
                                      if (states
                                          .contains(MaterialState.pressed)) {
                                        return Theme.of(context)
                                            .colorScheme
                                            .primary
                                            .withOpacity(0.5);
                                      }
                                      return Theme.of(context)
                                          .colorScheme
                                          .inversePrimary; // Use the component's default.
                                    },
                                  )),
                                )),
                            Container(
                              margin: const EdgeInsets.only(top: 15, right: 30),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  MyButton(
                                      onTap: (() {
                                        Navigator.pushNamed(
                                            context, SignUpPage.route);
                                      }),
                                      child: Text(
                                        "Register",
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .inversePrimary,
                                        ),
                                      )),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      MyButton(
                          onTap: () =>
                              Navigator.pushNamed(context, ShopPage.route),
                          child: Icon(
                            Icons.arrow_circle_right_outlined,
                            size: 50,
                            color: Theme.of(context).colorScheme.inversePrimary,
                          ))
                    ]),
              ),
            ),
          ),
        ));
  }
}
