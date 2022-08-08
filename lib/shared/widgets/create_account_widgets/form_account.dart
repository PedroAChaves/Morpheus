import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../models/user.dart';
import '../../themes/app_colors.dart';

enum SingingCharacter { Masculino, Feminino, Outro }

class FormPage extends StatefulWidget {
  // final AppUser user;
  const FormPage({
    Key? key,
  }) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

extension extString on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }

  // bool get isValidURL {
  //   final urlRegExp = RegExp(
  //       r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?");
  //   return urlRegExp.hasMatch(this);
  // }

  bool get isValidName {
    final nameRegExp = RegExp(r"^\s*([A-Za-z]{1,}([\.,]|[-']|))");
    return nameRegExp.hasMatch(this);
  }

  bool get isValidLastName {
    final nameRegExp = RegExp(r"^\s*([A-Za-z]{1,}([\.,]|[-']|))");
    return nameRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    final passwordRegExp = RegExp(r'(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)');
    return passwordRegExp.hasMatch(this);
  }

  bool get isNotNull {
    return this != null;
  }

  bool get isValidBirthDate {
    final birthdateRegExp = RegExp(
        r'^(?:0[1-9]|[12]\d|3[01])([\/.-])(?:0[1-9]|1[012])\1(?:19|20)\d\d$');
    return birthdateRegExp.hasMatch(this);
  }

  bool get isValidPhone {
    final phoneRegExp = RegExp(r"(^[0-9]*$)");
    return phoneRegExp.hasMatch(this);
  }
}

class _FormPageState extends State<FormPage> {
  bool _ShowPassword = false;
  SingingCharacter? _character = SingingCharacter.Masculino;
  final formKey = GlobalKey<FormState>();
  final _UserName = TextEditingController();
  final _UserEmail = TextEditingController();
  final _UserPassword = TextEditingController();
  final _UserPhone = TextEditingController();
  final _UserCPF = TextEditingController();
  final _UserGender = TextEditingController();
  final _UserBirthDate = TextEditingController();
  final _UserAvatar = TextEditingController();

  String name = '';
  String email = '';
  String password = '';
  double phone = 0;
  double cpf = 0;
  String birthdate = '';
  String avatar = '';

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
                child: TextFormField(
                  controller: _UserName,
                  cursorColor: AppColors.primary,
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColors.primary, width: 2),
                    ),
                    border: OutlineInputBorder(),
                    labelText: 'Informe seu nome completo',
                    floatingLabelStyle: TextStyle(color: AppColors.primary),
                    fillColor: Colors.transparent,
                    filled: true,
                  ),
                  validator: (String? val) {
                    if (val?.isValidName == false) {
                      return 'Digite um nome válido';
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
                  controller: _UserEmail,
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
                  validator: (String? val) {
                    if (val?.isValidEmail == false) {
                      return 'Digite um Email válido';
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
                  controller: _UserPassword,
                  cursorColor: AppColors.primary,
                  obscureText: _ShowPassword == false ? true : false,
                  decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColors.primary, width: 2),
                    ),
                    suffixIcon: GestureDetector(
                      child: Icon(
                        _ShowPassword == false
                            ? Icons.visibility_off_outlined
                            : Icons.remove_red_eye_outlined,
                        color: const Color(0xFF20202c),
                      ),
                      onTap: () {
                        setState(() {
                          _ShowPassword = !_ShowPassword;
                        });
                      },
                    ),
                    border: const OutlineInputBorder(),
                    labelText: 'Informe sua Senha',
                    floatingLabelStyle:
                        const TextStyle(color: AppColors.primary),
                    fillColor: Colors.transparent,
                    filled: true,
                  ),
                  validator: (String? val) {
                    if (val?.isValidPassword == false) {
                      return 'Digite uma Senha válida';
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
                  controller: _UserPhone,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    TelefoneInputFormatter(),
                  ],
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
                  controller: _UserCPF,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    CpfInputFormatter(),
                  ],
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
                          setState(
                            () {
                              _character = value;
                            },
                          );
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text('Feminino'),
                      leading: Radio<SingingCharacter>(
                        value: SingingCharacter.Feminino,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(
                            () {
                              _character = value;
                            },
                          );
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text('Outro'),
                      leading: Radio<SingingCharacter>(
                        value: SingingCharacter.Outro,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(
                            () {
                              _character = value;
                            },
                          );
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
                child: TextFormField(
                  controller: _UserBirthDate,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    DataInputFormatter(),
                  ],
                  cursorColor: AppColors.primary,
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColors.primary, width: 2),
                    ),
                    border: OutlineInputBorder(),
                    labelText: 'Informe sua data de nascimento',
                    floatingLabelStyle: TextStyle(color: AppColors.primary),
                    fillColor: Colors.transparent,
                    filled: true,
                  ),
                  validator: (String? val) {
                    if (val?.isValidBirthDate == false) {
                      return 'Digite uma data válida';
                    }
                    return null;
                  },
                ),
              ),

              //FOTO DE PERFIL
              const Padding(
                padding: EdgeInsets.only(left: 20, top: 15),
                child: Text('Insira o link de uma foto:',
                    style: TextStyle(fontSize: 20)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 15, right: 20),
                child: TextFormField(
                  controller: _UserAvatar,
                  cursorColor: AppColors.primary,
                  decoration: const InputDecoration(
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
                  // validator: (String? val) {
                  //   if (val?.isValidURL == false) {
                  //     return 'Digite um link válido';
                  //   }
                  //   return null;
                  // },
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
                      name = _UserName.text;
                      email = _UserEmail.text;
                      password = _UserPassword.text;
                      // phone = _UserPhone.text;
                      // cpf = _UserCPF.text;
                      avatar = _UserAvatar.text;
                      // widget.user.name = name;
                      // widget.user.avatar_url = avatar;
                      // widget.user.document = cpf;
                      // widget.user.email = email;
                      print(name);
                      print(email);
                      print(password);
                      print(phone);
                      print(cpf);
                      print(avatar);
                      print(_character);
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
