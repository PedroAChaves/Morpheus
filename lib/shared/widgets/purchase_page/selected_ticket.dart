import 'package:flutter/material.dart';

class SelectedTicket extends StatelessWidget {
  const SelectedTicket({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 155,
      width: double.maxFinite,
      // margin: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50,
            color: Colors.grey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Ingressos',
                        style: TextStyle(fontSize: 16),
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(right: 5.0),
                        child: Icon(Icons.shopping_cart_outlined),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 5.0),
                        child: Text('R\$ 00,00'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 12, right: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Pista - Lote 1',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.start,
                ),
                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(top: 12.0),
                      child: Text(
                        'R\$: 40,00',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    Spacer(),
                    Text(
                      '1',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 12.0, bottom: 12),
                  child: Text(
                    'vendas até 19/08/202',
                    style: TextStyle(fontSize: 14),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
