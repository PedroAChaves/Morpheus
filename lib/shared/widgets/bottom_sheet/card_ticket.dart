import 'package:flutter/material.dart';
import 'package:morpheus/shared/widgets/bottom_sheet/card_custom_ticket.dart';
import 'package:morpheus/shared/widgets/tickets/clippings.dart';

class CardTicket extends StatelessWidget {
  const CardTicket({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipPath(
          clipper: DolDurmaClipper(right: 173, holeRadius: 30),
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                  color: Color(0xffe5e5e5),
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
                        color: Color(0xffe5e5e5),
                      ),
                      width: 187,
                      // height: 170,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "Show Henrique e Juliano",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.clip,
                            textAlign: TextAlign.center,
                          ),
                          const Text(
                            "HJ Eventos",
                            style: TextStyle(
                              color: Color.fromARGB(255, 100, 100, 100),
                            ),
                          ),
                          Text(
                            DateTime.now().toIso8601String(),
                            style: const TextStyle(
                              color: Colors.red,
                            ),
                          ),
                          const Text(
                            "Av. Imigrantes Jundiaí SP",
                            style: TextStyle(
                              color: Color.fromARGB(255, 100, 100, 100),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const ClippingsColumn(),
            ],
          ),
        ),
      ],
    );
  }
}
