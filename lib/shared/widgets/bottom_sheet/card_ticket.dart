import 'package:flutter/material.dart';
import 'package:morpheus/shared/widgets/bottom_sheet/card_custom_ticket.dart';

class CardTicket extends StatelessWidget {
  const CardTicket({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipPath(
          clipper: DolDurmaClipper(right: 180, holeRadius: 30),
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
              color: Colors.amber,
            ),
            width: double.infinity,
            height: 170,
            child: Row(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                    image: DecorationImage(
                      image: AssetImage(
                        'images/events/festaGlow.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                    color: Colors.amber,
                  ),
                  width: 170,
                  height: 170,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text("Show Henrique e Juliano"),
                      Text(DateTime.now().toIso8601String()),
                      const Text("Av. Imigrantes Jundiaí SP"),
                      const Text("HJ Eventos"),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
