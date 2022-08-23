import 'package:flutter/material.dart';

import '../../themes/app_colors.dart';
import '../purchase_page/editable_text_field.dart';

class AboutProducer extends StatefulWidget {
  const AboutProducer({Key? key}) : super(key: key);

  @override
  State<AboutProducer> createState() => _AboutProducerState();
}

class _AboutProducerState extends State<AboutProducer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: const [
        Text(
          '6. Sobre o produtor',
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
        Padding(
          padding: EdgeInsets.only(top: 15.0, bottom: 8),
          child: Text(
            'Nome:',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.start,
          ),
        ),
        EditableTextField(
          labelText: '',
        ),
        Padding(
          padding: EdgeInsets.only(top: 15.0, bottom: 8),
          child: Text(
            'Descrição do produtor:',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.start,
          ),
        ),
        TextField(
          maxLines: 8,
          minLines: 1,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primary, width: 2),
            ),
            border: OutlineInputBorder(),
            labelText: '',
            floatingLabelStyle: TextStyle(color: AppColors.primary),
            fillColor: Colors.transparent,
            filled: true,
          ),
        ),
      ],
    );
  }
}
