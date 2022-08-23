import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:morpheus/shared/widgets/create_event/table_calendar.dart';

import '../../themes/app_colors.dart';

class CreateDateAndTime extends StatefulWidget {
  const CreateDateAndTime({Key? key}) : super(key: key);

  @override
  State<CreateDateAndTime> createState() => _CreateDateAndTimeState();
}

class _CreateDateAndTimeState extends State<CreateDateAndTime> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text(
          '4. Data e horário',
          style: TextStyle(
            fontSize: 18,
            color: Color.fromARGB(255, 145, 87, 0),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 15.0, bottom: 8),
          child: Text(
            'Informe aos participantes quando seu evento vai acontecer.',
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
            'Data de início:',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.start,
          ),
        ),
        const Calendar(),
        const Padding(
          padding: EdgeInsets.only(top: 15.0, bottom: 8),
          child: Text(
            'Horário de início:',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.start,
          ),
        ),
        TextField(
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            HoraInputFormatter(),
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
            'Data de término:',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.start,
          ),
        ),
        const Calendar(),
        const Padding(
          padding: EdgeInsets.only(top: 15.0, bottom: 8),
          child: Text(
            'Horário de término:',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.start,
          ),
        ),
        TextField(
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            HoraInputFormatter(),
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
