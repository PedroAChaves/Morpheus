import 'package:flutter/material.dart';
import 'package:morpheus/models/event.dart';
import 'package:morpheus/shared/themes/app_colors.dart';
import 'package:provider/provider.dart';

import '../../providers/home/favorites_events.dart';
import '../../shared/widgets/profile/account_button.dart';

class DetailScreen extends StatelessWidget {
  final AppEvent event;
  DetailScreen({Key? key, required this.event}) : super(key: key);
  late FavoritesAppEventsProvider favorites;

  @override
  Widget build(BuildContext context) {
    favorites = Provider.of<FavoritesAppEventsProvider>(context);

    return Scaffold(
      body: ListView(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Center(
              child: Column(
                children: [
                  Stack(
                    children: <Widget>[
                      Hero(
                        tag: event.id.toString(),
                        child: Image.network(
                          event.coverUrl,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                      Positioned(
                        right: 1,
                        child: IconButton(
                          onPressed: () => favorites.save(event),
                          icon: Icon(
                            favorites.events.contains(event)
                                ? Icons.star
                                : Icons.star_border,
                            // Icons.star_border_sharp,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                      )
                    ],
                  ),
                  // Text(event.id),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, top: 10),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.verified_sharp,
                          size: 25,
                          color: AppColors.accent,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            event.name,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              fontFamily: 'Nunito',
                              fontSize: 24,
                              fontWeight: FontWeight.w900,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, top: 10),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.location_on_sharp,
                          size: 25,
                          color: Colors.black,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(
                            'Grêmio GP jundiaí, SP',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontFamily: 'Nunito',
                              fontSize: 13,
                              fontWeight: FontWeight.w900,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, top: 10),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.timer_sharp,
                          size: 25,
                          color: Colors.black,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(
                            'Sáb, 14 Out.2022',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontFamily: 'Nunito',
                              fontSize: 13,
                              fontWeight: FontWeight.w900,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, top: 10),
                    child: Row(
                      children: const [
                        Text(
                          'Descrição do evento',
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8, top: 10, right: 8),
                    child: Text(
                      'Dia 14 de Outubro a Up Eventos está de volta a Jundiaí! Vamos chegar em 2022 com muitas atrações, hits e drinks em conta ;)',
                      // overflow: TextOverflow.fade,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8, top: 10, right: 8),
                    child: Text(
                      'Agora em novo local, mais espaçoso pra todo mundo poder curtir! Parceria Sometimes Aldeia e Grêmio CP Jundiaí',
                      // overflow: TextOverflow.fade,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, top: 10),
                    child: Row(
                      children: const [
                        Text(
                          'Sobre o organizador',
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, top: 10),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 30,
                          foregroundImage: NetworkImage(
                              'https://i0.statig.com.br/bancodeimagens/du/oh/pa/duohpari1d3eyg9iyvqw44y3w.jpg'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            event.organizerName,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              fontFamily: 'Nunito',
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                    child: AccountButton(
                      icon: Icon(Icons.bookmark_added_outlined),
                      text: Text("Ver Ingressos"),
                      pagePath: "",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
