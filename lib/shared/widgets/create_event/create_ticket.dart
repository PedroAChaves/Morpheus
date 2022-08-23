import 'package:flutter/material.dart';

class CreateEventTicket extends StatefulWidget {
  const CreateEventTicket({Key? key}) : super(key: key);

  @override
  State<CreateEventTicket> createState() => _CreateEventTicketState();
}

class _CreateEventTicketState extends State<CreateEventTicket> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: const [
        Text(
          '5. Ingressos',
          style: TextStyle(
            fontSize: 18,
            color: Color.fromARGB(255, 145, 87, 0),
          ),
        ),
      ],
    );
  }
}
