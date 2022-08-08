import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:morpheus/shared/widgets/purchase_page/participant_information.dart';
import 'package:morpheus/shared/widgets/purchase_page/selected_ticket.dart';

import '../../themes/app_colors.dart';
import 'cardholder.dart';
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
        ),
        const Padding(
          padding: EdgeInsets.only(top: 15, bottom: 15),
          child: Divider(
            height: 5,
            thickness: 1,
            indent: 0,
            endIndent: 0,
            color: Color.fromARGB(255, 104, 104, 104),
          ),
        ),
        const Center(
          child: Text(
            'Informações de pagamento',
            style: TextStyle(fontSize: 24),
            // textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(35),
          child: Image.asset('images/credit_card.png'),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Text(
            'Opções de pagamento *',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.start,
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(7.0), //<-- SEE HERE
          ),
          child: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.radio_button_checked),
              ),
              const Text(
                '1x de R\$ 40,00',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 15, bottom: 10),
          child: Text(
            'Número do cartão *',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.start,
          ),
        ),
        TextField(
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            CartaoBancarioInputFormatter(),
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
          padding: EdgeInsets.only(top: 15, bottom: 10),
          child: Text(
            'Data de expiração:',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.start,
          ),
        ),
        TextField(
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            ValidadeCartaoInputFormatter(),
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
          padding: EdgeInsets.only(top: 15, bottom: 10),
          child: Text(
            'Código de segurança:',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.start,
          ),
        ),
        SizedBox(
          width: 60,
          child: TextField(
            maxLength: 3,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
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
        ),
        const Cardholder()
      ],
    );
  }
}
