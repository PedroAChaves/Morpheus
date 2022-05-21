import 'package:flutter/material.dart';

import '../../themes/app_colors.dart';

class BuyTicket extends StatefulWidget {
  final String type;
  final String lot;
  final double price;
  // int qde = 0;

  const BuyTicket({
    Key? key,
    required this.type,
    required this.lot,
    required this.price,
  }) : super(key: key);

  @override
  State<BuyTicket> createState() => _BuyTicketState();
}

class _BuyTicketState extends State<BuyTicket> {
  int qde = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromARGB(255, 189, 188, 188),
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      height: 70,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.type + '- ' + widget.lot),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text('R\$ ' + widget.price.toString()),
                ),
              ],
            ),
          ),
          const Spacer(),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  if (qde > 0) {
                    setState(() {
                      qde--;
                      widget.price * qde;
                    });
                  } else {
                    setState(() {
                      qde = qde;
                      widget.price * qde;
                    });
                  }
                },
                icon: const Icon(Icons.remove_circle_outline_rounded),
                color: AppColors.accent,
              ),
              Text(qde.toString()),
              IconButton(
                onPressed: () {
                  setState(() {
                    qde++;
                    widget.price * qde;
                  });
                },
                icon: const Icon(Icons.add_circle_outline_rounded),
                color: AppColors.accent,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
