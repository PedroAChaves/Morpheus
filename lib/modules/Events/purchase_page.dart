import 'package:flutter/material.dart';

class PurchasePage extends StatefulWidget {
  const PurchasePage({Key? key}) : super(key: key);

  @override
  State<PurchasePage> createState() => _PurchasePageState();
}

class _PurchasePageState extends State<PurchasePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () => {},
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
              ),
              Center(
                child: Image.asset(
                  'images/black_title.png',
                  width: 170,
                  height: 80,
                  scale: 1,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
