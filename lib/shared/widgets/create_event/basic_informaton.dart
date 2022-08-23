import 'package:flutter/material.dart';
import 'package:morpheus/shared/widgets/create_event/category_list.dart';
import 'package:morpheus/shared/widgets/create_event/subjects_list.dart';
import 'package:select_form_field/select_form_field.dart';
import '../purchase_page/editable_text_field.dart';

class CreateBasicInformation extends StatefulWidget {
  const CreateBasicInformation({Key? key}) : super(key: key);

  @override
  State<CreateBasicInformation> createState() => _CreateBasicInformationState();
}

class _CreateBasicInformationState extends State<CreateBasicInformation> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text(
          '2. Informações básicas',
          style: TextStyle(
            fontSize: 18,
            color: Color.fromARGB(255, 145, 87, 0),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 15.0, bottom: 8),
          child: Text(
            'Nome do evento:',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.start,
          ),
        ),
        const EditableTextField(
          labelText: '',
        ),
        const Padding(
          padding: EdgeInsets.only(top: 15.0, bottom: 8),
          child: Text(
            'Imagem de divulgação (opcional):',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.start,
          ),
        ),
        Image.asset(
          'images/image_pick.png',
          scale: 1,
          width: double.maxFinite,
        ),
        const Padding(
          padding: EdgeInsets.only(top: 15.0, bottom: 8),
          child: Text(
            'A dimensão recomendada é de 1600 x 838 (mesma proporção do formato utilizado nas páginas de evento no Facebook). Formato JPEG, GIF ou PNG de no máximo 2MB.',
            style: TextStyle(
              fontSize: 14,
              color: Color.fromARGB(255, 87, 87, 87),
            ),
            textAlign: TextAlign.start,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 15.0, bottom: 8),
          child: Text(
            'Classifique seu evento:',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.start,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 15.0, bottom: 8),
          child: Text(
            'Assunto:',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.start,
          ),
        ),
        const SubjectsList(),
        const Padding(
          padding: EdgeInsets.only(top: 15.0, bottom: 8),
          child: Text(
            'Categoria(opcional):',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.start,
          ),
        ),
        const CategoryList(),
      ],
    );
  }
}
