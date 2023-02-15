import 'package:flutter/material.dart';
import 'package:testapp/pay_page.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  Container(child: Image.asset("assets/images/product1.jpeg")),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("N12000"),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const PayPage()));
                },
                child: const Text("Buy")),
          ],
        ),
      )),
    );
  }
}
