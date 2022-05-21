import 'package:flutter/material.dart';
import 'package:morpheus/shared/widgets/events/buy_ticket.dart';

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
            children: [
              IconButton(
                onPressed: () => {},
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
              ),
              const Text(
                'Selecionar ingressos ',
                style: TextStyle(fontSize: 17),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                BuyTicket(
                  type: 'Pista ',
                  lot: '3° lote',
                  price: 75.00,
                ),
                BuyTicket(
                  type: 'VIP ',
                  lot: '2° lote',
                  price: 120.00,
                ),
                BuyTicket(
                  type: 'Camarote ',
                  lot: '1° lote',
                  price: 200.00,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    'Subtotal: R\$ ',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
