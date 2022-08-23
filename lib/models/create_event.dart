import 'package:flutter/material.dart';
import 'package:morpheus/shared/widgets/create_event/basic_informaton.dart';
import 'package:morpheus/shared/widgets/create_event/event_description.dart';
import 'package:morpheus/shared/widgets/create_event/producer.dart';
import 'package:morpheus/shared/widgets/create_event/responsibilities.dart';
import 'package:morpheus/shared/widgets/ticket_selection/standard_button.dart';
import 'package:provider/provider.dart';

import '../modules/Home/start_page.dart';
import '../providers/events/selected_tickets.dart';
import '../shared/widgets/create_event/create_ticket.dart';
import '../shared/widgets/create_event/date_and_time.dart';
import '../shared/widgets/create_event/event_location.dart';
import '../shared/widgets/home_bars/app_bar.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({Key? key}) : super(key: key);

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppTopBar(),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    'Criar evento presencial',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: CreateEventLocation(),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: CreateBasicInformation(),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: CreateEventDescription(),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: CreateDateAndTime(),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: CreateEventTicket(),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: AboutProducer(),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Responsibilities(),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: StandardButton(
                    route: MaterialPageRoute(
                      builder: (context) =>
                          ChangeNotifierProvider<SelectedTicketsProvider>(
                        create: (_) => SelectedTicketsProvider(),
                        child: const StartPage(),
                      ),
                    ),
                    Textb: 'Públicar evento',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
