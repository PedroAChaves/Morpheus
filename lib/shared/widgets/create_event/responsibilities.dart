import 'package:flutter/material.dart';

import '../../themes/app_colors.dart';

enum Visibility { Publico, Privado }

class Responsibilities extends StatefulWidget {
  const Responsibilities({Key? key}) : super(key: key);

  @override
  State<Responsibilities> createState() => _ResponsibilitiesState();
}

class _ResponsibilitiesState extends State<Responsibilities> {
  bool isChecked = false;
  Visibility? _visibility = Visibility.Publico;
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return AppColors.primary;
      }
      return AppColors.primary;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text(
          '7. Responsabilidades',
          style: TextStyle(
            fontSize: 18,
            color: Color.fromARGB(255, 145, 87, 0),
          ),
        ),
        const Padding(
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
        CheckboxListTile(
          title: const Text(
              'Ao publicar este evento, estou de acordo com os Termos de uso, com as Diretrizes de Comunidade e com o Acordo de Processamento de Dados, bem como declaro estar ciente da Política de Privacidade, da Política de Cookies e das Obrigatoriedades Legais.'),
          checkColor: Colors.white,
          controlAffinity: ListTileControlAffinity.leading,
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value!;
            });
          },
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Row(
            children: [
              const Text(
                'Visibilidade do evento:',
                style: TextStyle(fontSize: 16, inherit: true),
              ),
              Row(
                children: [
                  Radio<Visibility>(
                    value: Visibility.Publico,
                    groupValue: _visibility,
                    onChanged: (Visibility? value) {
                      setState(
                        () {
                          _visibility = value;
                        },
                      );
                    },
                  ),
                  const Text('Público')
                ],
              ),
              Row(
                children: [
                  Radio<Visibility>(
                    value: Visibility.Privado,
                    groupValue: _visibility,
                    onChanged: (Visibility? value) {
                      setState(
                        () {
                          _visibility = value;
                        },
                      );
                    },
                  ),
                  const Text('Privado')
                ],
              ),
              // ListTile(
              //   title: const Text(
              //     'Público',
              //     style: TextStyle(fontSize: 10, inherit: true),
              //   ),
              //   leading: Radio<Visibility>(
              //     value: Visibility.Publico,
              //     groupValue: _visibility,
              //     onChanged: (Visibility? value) {
              //       setState(
              //         () {
              //           _visibility = value;
              //         },
              //       );
              //     },
              //   ),
              // ),
              // ListTile(
              //   title: const Text(
              //     'Privado',
              //     style: TextStyle(fontSize: 10, inherit: true),
              //   ),
              //   leading: Radio<Visibility>(
              //     value: Visibility.Privado,
              //     groupValue: _visibility,
              //     onChanged: (Visibility? value) {
              //       setState(
              //         () {
              //           _visibility = value;
              //         },
              //       );
              //     },
              //   ),
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
