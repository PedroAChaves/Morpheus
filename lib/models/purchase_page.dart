import 'package:flutter/material.dart';
import 'package:morpheus/shared/widgets/purchase_page/ticket_informations.dart';

import '../shared/themes/app_colors.dart';

class PurchasePage extends StatefulWidget {
  const PurchasePage({Key? key}) : super(key: key);

  @override
  State<PurchasePage> createState() => _PurchasePageState();
}

class _PurchasePageState extends State<PurchasePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.adaptive.arrow_back_outlined),
        ),
        title: Center(
          child: Image.asset('images/title.png', height: 100, width: 110),
        ),
        backgroundColor: AppColors.primary,
      ),
      body: ListView(
        children: const [
          Padding(
            padding: EdgeInsets.all(20),
            child: TicketInformations(),
          ),
        ],
      ),
    );
  }
}
