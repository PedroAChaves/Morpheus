import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:morpheus/models/event.dart';
import 'package:morpheus/modules/Events/purchase_page.dart';
import 'package:morpheus/providers/events/selected_tickets.dart';
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
    var date = DateTime.now();

    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: AppColors.primary,
            expandedHeight: 300,
            stretch: true,
            centerTitle: true,
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.adaptive.arrow_back),
            ),
            title: Center(
              child: Image.asset('images/title.png', height: 100, width: 110),
            ),
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              stretchModes: const [
                StretchMode.zoomBackground,
                StretchMode.fadeTitle
              ],
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Hero(
                    tag: event.id,
                    child: Image.network(
                      event.coverUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.only(left: 8, top: 10),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Icon(
                        Icons.verified_sharp,
                        size: 25,
                        color: AppColors.accent,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                          "event.name",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                          style: TextStyle(
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
                    children: [
                      const Icon(
                        Icons.calendar_today,
                        size: 25,
                        color: Colors.black,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          DateFormat(DateFormat.YEAR_ABBR_MONTH_WEEKDAY_DAY)
                              .format(
                            date.toUtc(),
                          ),
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
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
                    children: [
                      const Icon(
                        Icons.timer,
                        size: 25,
                        color: Colors.black,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          "Horário de início previsto: " +
                              DateFormat(DateFormat.HOUR24_MINUTE).format(
                                date.toUtc(),
                              ),
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
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
                    children: [
                      const Icon(
                        Icons.timer,
                        size: 25,
                        color: Colors.black,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          "Horário de término previsto: " +
                              DateFormat(DateFormat.HOUR24_MINUTE).format(
                                date.toUtc(),
                              ),
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
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
                    children: const [
                      CircleAvatar(
                        radius: 30,
                        foregroundImage: NetworkImage(
                            'https://i0.statig.com.br/bancodeimagens/du/oh/pa/duohpari1d3eyg9iyvqw44y3w.jpg'),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                          "event.organizer.name",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                          style: TextStyle(
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
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ChangeNotifierProvider<SelectedTicketsProvider>(
                            create: (_) => SelectedTicketsProvider(),
                            child: const PurchasePage(),
                          ),
                        ),
                      );
                    },
                    child: const AccountButton(
                      icon: Icon(Icons.bookmark_added_outlined),
                      text: Text(
                        "Ver Ingressos",
                        style: TextStyle(fontSize: 20),
                      ),
                      pagePath: "",
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ChangeNotifierProvider<SelectedTicketsProvider>(
                            create: (_) => SelectedTicketsProvider(),
                            child: const PurchasePage(),
                          ),
                        ),
                      );
                    },
                    child: const AccountButton(
                      icon: Icon(Icons.bookmark_added_outlined),
                      text: Text(
                        "Ver Ingressos",
                        style: TextStyle(fontSize: 20),
                      ),
                      pagePath: "",
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ChangeNotifierProvider<SelectedTicketsProvider>(
                            create: (_) => SelectedTicketsProvider(),
                            child: const PurchasePage(),
                          ),
                        ),
                      );
                    },
                    child: const AccountButton(
                      icon: Icon(Icons.bookmark_added_outlined),
                      text: Text(
                        "Ver Ingressos",
                        style: TextStyle(fontSize: 20),
                      ),
                      pagePath: "",
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
