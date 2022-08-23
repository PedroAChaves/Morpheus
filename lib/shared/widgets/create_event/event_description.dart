import 'package:flutter/material.dart';

import 'enchanted_text_editor.dart';

class CreateEventDescription extends StatefulWidget {
  const CreateEventDescription({Key? key}) : super(key: key);

  @override
  State<CreateEventDescription> createState() => _CreateEventDescriptionState();
}

class _CreateEventDescriptionState extends State<CreateEventDescription> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: const [
        Text(
          '3. Descrição do evento',
          style: TextStyle(
            fontSize: 18,
            color: Color.fromARGB(255, 145, 87, 0),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 15.0, bottom: 8),
          child: Text(
            'Conte todos os detalhes do seu evento, como a programação e os diferenciais da sua produção!',
            style: TextStyle(
              fontSize: 14,
              color: Color.fromARGB(255, 87, 87, 87),
            ),
            textAlign: TextAlign.start,
          ),
        ),
        EnchantedTextEditor(),
      ],
    );
  }
}
