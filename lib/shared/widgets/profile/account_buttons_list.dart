import 'package:flutter/material.dart';
import 'package:morpheus/shared/widgets/profile/account_button.dart';
import 'package:provider/provider.dart';

import '../../../modules/Events/ticket_selection.dart';
import '../../../modules/Home/start_page.dart';
import '../../../providers/events/selected_tickets.dart';

class AccountsButtonList extends StatelessWidget {
  const AccountsButtonList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Wrap(
        runSpacing: 8,
        children: [
          AccountButton(
            icon: const Icon(Icons.add_to_photos_outlined),
            text: const Text("Criar um evento"),
            route: MaterialPageRoute(
              builder: (context) =>
                  ChangeNotifierProvider<SelectedTicketsProvider>(
                create: (_) => SelectedTicketsProvider(),
                child: const TicketSelectionPage(),
              ),
            ),
          ),
          AccountButton(
            icon: const Icon(Icons.format_align_left_outlined),
            text: const Text("Listar meus eventos"),
            route: MaterialPageRoute(
              builder: (context) =>
                  ChangeNotifierProvider<SelectedTicketsProvider>(
                create: (_) => SelectedTicketsProvider(),
                child: const StartPage(),
              ),
            ),
          ),
          AccountButton(
            icon: const Icon(Icons.check_circle_outlined),
            text: const Text("Verificar ingressos"),
            route: MaterialPageRoute(
              builder: (context) =>
                  ChangeNotifierProvider<SelectedTicketsProvider>(
                create: (_) => SelectedTicketsProvider(),
                child: const StartPage(),
              ),
            ),
          ),
          AccountButton(
            icon: const Icon(Icons.info_outline),
            text: const Text("Sobre o app"),
            route: MaterialPageRoute(
              builder: (context) =>
                  ChangeNotifierProvider<SelectedTicketsProvider>(
                create: (_) => SelectedTicketsProvider(),
                child: const StartPage(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
