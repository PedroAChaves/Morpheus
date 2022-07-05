import 'package:flutter/material.dart';

class SelectedTicket extends StatelessWidget {
  const SelectedTicket({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
      // margin: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.yellow,
        border: Border.all(color: Colors.black),
      ),
      child: Column(
        children: [
          Container(
            height: 50,
            color: Colors.grey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: const [
                  Expanded(flex: 7, child: Text('Ingressos')),
                  Expanded(flex: 2, child: Icon(Icons.shopping_cart_outlined)),
                  Expanded(flex: 3, child: Text('R\$ 00,00')),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
