import 'package:flutter/material.dart';

import 'not_editable_text_field.dart';

class ParticipantInformation extends StatefulWidget {
  const ParticipantInformation({Key? key}) : super(key: key);

  @override
  State<ParticipantInformation> createState() => _ParticipantInformationState();
}

class _ParticipantInformationState extends State<ParticipantInformation> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Center(
          child: Text(
            'Informações do participante',
            style: TextStyle(fontSize: 24),
            // textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 15.0, bottom: 8),
          child: Text(
            'Nome:',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.start,
          ),
        ),
        NotEditableTextField(
          labelText: 'Pedro Alexandre',
        ),
        Padding(
          padding: EdgeInsets.only(top: 15.0, bottom: 8),
          child: Text(
            'Email:',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.start,
          ),
        ),
        NotEditableTextField(
          labelText: 'pedroaschaves0@gmail.com',
        ),
      ],
    );
  }
}
