import 'package:flutter/material.dart';
import 'package:morpheus/providers/events/selected_tickets.dart';
import 'package:morpheus/shared/themes/app_colors.dart';
import 'package:morpheus/shared/widgets/events/buy_ticket.dart';
import 'package:provider/provider.dart';

import '../../models/event.dart';
import '../../shared/widgets/ticket_selection/button_purchase_page.dart';

class TicketSelectionPage extends StatefulWidget {
  const TicketSelectionPage({Key? key}) : super(key: key);

  @override
  State<TicketSelectionPage> createState() => _TicketSelectionPageState();
}

class _TicketSelectionPageState extends State<TicketSelectionPage> {
  List<BuyTicket> _createCards(List<TicketOption> tickets) {
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.adaptive.arrow_back_outlined),
        ),
        title: Center(
            child: Image.asset('images/title.png', height: 100, width: 110)),
        backgroundColor: AppColors.primary,
      ),
      body: Consumer<SelectedTicketsProvider>(
        builder: (context, value, child) {
          return ListView(
            children: [
              const Center(
                child: Text(
                  'Selecionar ingressos ',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const BuyTicket(
                      type: 'Pista ',
                      lot: '3° lote',
                      price: 75.00,
                    ),
                    const BuyTicket(
                      type: 'VIP ',
                      lot: '2° lote',
                      price: 120.00,
                    ),
                    const BuyTicket(
                      type: 'Camarote ',
                      lot: '1° lote',
                      price: 200.00,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'Subtotal: R\$ ' '',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: PurchasePageButton(Textb: 'Comprar Ingressos'),
                    ),
                    Image.asset('images/pay_types.png'),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
