import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../themes/app_colors.dart';
import 'editable_text_field.dart';

class Cardholder extends StatefulWidget {
  const Cardholder({Key? key}) : super(key: key);

  @override
  State<Cardholder> createState() => _CardholderState();
}

class _CardholderState extends State<Cardholder> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: Center(
            child: Text(
              'Dados do titular do cartão',
              style: TextStyle(fontSize: 24),
              // textAlign: TextAlign.center,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 15.0, bottom: 8),
          child: Text(
            'Nome (impresso no cartão):',
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
            'Data de nascimento:',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.start,
          ),
        ),
        TextField(
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            DataInputFormatter(),
          ],
          cursorColor: AppColors.primary,
          decoration: const InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primary, width: 2),
            ),
            border: OutlineInputBorder(),
            floatingLabelStyle: TextStyle(color: AppColors.primary),
            fillColor: Colors.transparent,
            filled: true,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 15.0, bottom: 8),
          child: Text(
            'CPF:',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.start,
          ),
        ),
        TextField(
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            CpfInputFormatter(),
          ],
          cursorColor: AppColors.primary,
          decoration: const InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primary, width: 2),
            ),
            border: OutlineInputBorder(),
            floatingLabelStyle: TextStyle(color: AppColors.primary),
            fillColor: Colors.transparent,
            filled: true,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 15.0, bottom: 8),
          child: Text(
            'Celular:',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.start,
          ),
        ),
        TextField(
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            TelefoneInputFormatter(),
          ],
          cursorColor: AppColors.primary,
          decoration: const InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primary, width: 2),
            ),
            border: OutlineInputBorder(),
            floatingLabelStyle: TextStyle(color: AppColors.primary),
            fillColor: Colors.transparent,
            filled: true,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 15.0, bottom: 8),
          child: Text(
            'CEP:',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.start,
          ),
        ),
        TextField(
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            CepInputFormatter(),
          ],
          cursorColor: AppColors.primary,
          decoration: const InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primary, width: 2),
            ),
            border: OutlineInputBorder(),
            floatingLabelStyle: TextStyle(color: AppColors.primary),
            fillColor: Colors.transparent,
            filled: true,
          ),
        ),
      ],
    );
  }
}
