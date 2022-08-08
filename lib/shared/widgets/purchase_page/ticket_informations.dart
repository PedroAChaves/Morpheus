import 'package:flutter/material.dart';
import 'package:morpheus/shared/widgets/purchase_page/participant_information.dart';
import 'package:morpheus/shared/widgets/purchase_page/selected_ticket.dart';

import 'editable_text_field.dart';

class TicketInformations extends StatefulWidget {
  const TicketInformations({Key? key}) : super(key: key);

  @override
  State<TicketInformations> createState() => _TicketInformationsState();
}

class _TicketInformationsState extends State<TicketInformations> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 15.0),
          child: SelectedTicket(),
        ),
        const ParticipantInformation(),
        const Padding(
          padding: EdgeInsets.only(top: 15.0),
          child: Center(
            child: Text(
              'Informações do ingresso',
              style: TextStyle(fontSize: 24),
              // textAlign: TextAlign.center,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 15.0, bottom: 8),
          child: Text(
            'Nome:',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.start,
          ),
        ),
        const EditableTextField(
          labelText: 'Nome',
        ),
        const Padding(
          padding: EdgeInsets.only(top: 15.0, bottom: 8),
          child: Text(
            'Email:',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.start,
          ),
        ),
        const EditableTextField(
          labelText: 'Email',
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Container(
            height: 50,
            width: double.maxFinite,
            color: const Color(0xffc4c4c4),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Os ingressos estarão disponiveis nesse aplicativo e serão enviados por email.',
              ),
            ),
          ),
        )
      ],
    );
  }
}
