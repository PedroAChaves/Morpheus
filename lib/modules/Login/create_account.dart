import 'package:flutter/material.dart';
import 'package:morpheus/models/user.dart';

import '../../shared/widgets/create_account_widgets/form_account.dart';

class CreateAccount extends StatefulWidget {
  // final AppUser user;
  const CreateAccount({Key? key, }) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xffe5e5e5),
      body: Form(child: FormPage()),
    );
  }
}
