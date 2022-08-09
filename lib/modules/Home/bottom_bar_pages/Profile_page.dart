import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:morpheus/models/user.dart';
import 'package:morpheus/shared/widgets/profile/account_buttons_list.dart';
import 'package:morpheus/shared/widgets/profile/account_nickname.dart';
import 'package:provider/provider.dart';

import '../../../providers/events/selected_tickets.dart';
import '../../../shared/themes/app_colors.dart';
import '../start_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late AppUser account;

  Future<void> _fetch() async {
    try {
      var response =
          await http.get(Uri.parse('http://localhost:3000/accounts'));
      setState(() {
        // account = AppUser.fromJson(jsonDecode(response.body));
        // print(account);
      });
    } catch (err) {
      print(err);
    }
  }

  @override
  void initState() {
    super.initState();
    _fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.96,
          ),
          child: Column(
            children: [
              Row(
                children: const [
                  NicknamePage(
                    accountName: "Cristiano Ronaldo",
                    accountEmail: "eh_o_chris@gmail.com",
                    accountAvatarUrl:
                        "https://i0.statig.com.br/bancodeimagens/du/oh/pa/duohpari1d3eyg9iyvqw44y3w.jpg",
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 26),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: SizedBox(
                        // width: double.infinity,
                        height: 56,
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                AppColors.primary),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChangeNotifierProvider<
                                    SelectedTicketsProvider>(
                                  create: (_) => SelectedTicketsProvider(),
                                  child: const StartPage(),
                                ),
                              ),
                            );
                          },
                          child: const Text(
                            'Editar Perfil',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ), //Text
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 26),
                child: Row(
                  textDirection: TextDirection.ltr,
                  children: const [
                    Text(
                      'Minha Conta',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 26),
                child: AccountsButtonList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
