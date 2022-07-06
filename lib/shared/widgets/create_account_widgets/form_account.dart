import 'package:dob_input_field/dob_input_field.dart';
import 'package:flutter/material.dart';
import 'package:morpheus/shared/widgets/create_account_widgets/text_field.dart';

import '../../themes/app_colors.dart';

enum SingingCharacter { Masculino, Feminino, Outro }

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

extension extString on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidName {
    final nameRegExp = RegExp(r"^\s*([A-Za-z]{1,}([\.,]|[-']|))");
    return nameRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    final passwordRegExp = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}/pre>');
    return passwordRegExp.hasMatch(this);
  }

  bool get isNotNull {
    return this != null;
  }

  bool get isValidPhone {
    final phoneRegExp = RegExp(r"^\+?0[0-9]{10}$");
    return phoneRegExp.hasMatch(this);
  }
}

class _FormPageState extends State<FormPage> {
  SingingCharacter? _character = SingingCharacter.Masculino;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Center(
                  child: Image.asset(
                    'images/black_title.png',
                    width: 170,
                    height: 80,
                    scale: 1,
                  ),
                ),
              ),

              //NOME
              const Padding(
                padding: EdgeInsets.only(left: 20, top: 25),
                child: Text('Nome:', style: TextStyle(fontSize: 20)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 15, right: 20),
                child: CustomFormField(
                  validator: (String? val) {
                    if (val?.isValidName == false) return 'Enter valid name';
                    return null;
                  },
                ),
              ),

              //SOBRENOME
              const Padding(
                padding: EdgeInsets.only(left: 20, top: 25),
                child: Text('Sobrenome:', style: TextStyle(fontSize: 20)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 15, right: 20),
                child: TextFormField(
                  cursorColor: AppColors.primary,
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColors.primary, width: 2),
                    ),
                    border: OutlineInputBorder(),
                    labelText: 'Informe seu sobrenome',
                    floatingLabelStyle: TextStyle(color: AppColors.primary),
                    fillColor: Colors.transparent,
                    filled: true,
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'É preciso preencher este campo';
                    }
                    return null;
                  },
                ),
              ),

              //EMAIL
              const Padding(
                padding: EdgeInsets.only(left: 20, top: 15),
                child: Text('Email:', style: TextStyle(fontSize: 20)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 15, right: 20),
                child: TextFormField(
                  cursorColor: AppColors.primary,
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColors.primary, width: 2),
                    ),
                    border: OutlineInputBorder(),
                    labelText: 'Informe seu Email',
                    floatingLabelStyle: TextStyle(color: AppColors.primary),
                    fillColor: Colors.transparent,
                    filled: true,
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'É preciso preencher este campo';
                    }
                    return null;
                  },
                ),
              ),

              //SENHA
              const Padding(
                padding: EdgeInsets.only(left: 20, top: 15),
                child: Text('Senha:', style: TextStyle(fontSize: 20)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 15, right: 20),
                child: TextFormField(
                  cursorColor: AppColors.primary,
                  obscureText: true,
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColors.primary, width: 2),
                    ),
                    suffixIcon: Icon(Icons.remove_red_eye_outlined,
                        color: Color(0xFF20202c)),
                    border: OutlineInputBorder(),
                    labelText: 'Informe sua Senha',
                    floatingLabelStyle: TextStyle(color: AppColors.primary),
                    fillColor: Colors.transparent,
                    filled: true,
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'É preciso preencher este campo';
                    }
                    return null;
                  },
                ),
              ),

              //N° DE CELULAR
              const Padding(
                padding: EdgeInsets.only(left: 20, top: 15),
                child: Text('Celular:', style: TextStyle(fontSize: 20)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 15, right: 20),
                child: TextFormField(
                  cursorColor: AppColors.primary,
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColors.primary, width: 2),
                    ),
                    border: OutlineInputBorder(),
                    labelText: 'Informe seu número de celular',
                    floatingLabelStyle: TextStyle(color: AppColors.primary),
                    fillColor: Colors.transparent,
                    filled: true,
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'É preciso preencher este campo';
                    }
                    return null;
                  },
                ),
              ),

              //CPF
              const Padding(
                padding: EdgeInsets.only(left: 20, top: 15),
                child: Text('CPF:', style: TextStyle(fontSize: 20)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 15, right: 20),
                child: TextFormField(
                  cursorColor: AppColors.primary,
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColors.primary, width: 2),
                    ),
                    border: OutlineInputBorder(),
                    labelText: 'Informe seu CPF',
                    floatingLabelStyle: TextStyle(color: AppColors.primary),
                    fillColor: Colors.transparent,
                    filled: true,
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'É preciso preencher este campo';
                    }
                    return null;
                  },
                ),
              ),

              //GÊNERO
              const Padding(
                padding: EdgeInsets.only(left: 20, top: 15),
                child: Text('Selecione seu gênero:',
                    style: TextStyle(fontSize: 20)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 15, right: 20),
                child: Column(
                  children: [
                    ListTile(
                      title: const Text('Masculino'),
                      leading: Radio<SingingCharacter>(
                        value: SingingCharacter.Masculino,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text('Feminino'),
                      leading: Radio<SingingCharacter>(
                        value: SingingCharacter.Feminino,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text('Outro'),
                      leading: Radio<SingingCharacter>(
                        value: SingingCharacter.Outro,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),

              //DATA DE NASCIMENTO
              const Padding(
                padding: EdgeInsets.only(left: 20, top: 15),
                child: Text('Insira sua data de nascimento:',
                    style: TextStyle(fontSize: 20)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 15, right: 20),
                child: DOBInputField(
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                  autovalidateMode: AutovalidateMode.disabled,
                ),
              ),

              //FOTO DE PERFIL
              const Padding(
                padding: EdgeInsets.only(left: 20, top: 15),
                child: Text('Insira o link de uma foto:',
                    style: TextStyle(fontSize: 20)),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, top: 15, right: 20),
                child: TextField(
                  cursorColor: AppColors.primary,
                  obscureText: true,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColors.primary, width: 2),
                    ),
                    border: OutlineInputBorder(),
                    labelText: 'insira o link da foto',
                    floatingLabelStyle: TextStyle(color: AppColors.primary),
                    fillColor: Colors.transparent,
                    filled: true,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(
                    left: 100, top: 15, right: 100, bottom: 15),
                child: SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            AppColors.primary)),
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => const StartPage()),
                      // );
                      formKey.currentState?.validate();
                    },
                    child: const Text(
                      "Continuar",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ), //Text
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
