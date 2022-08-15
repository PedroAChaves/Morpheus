import 'package:flutter/material.dart';
import 'package:morpheus/shared/widgets/create_event/basic_informaton.dart';
import 'package:morpheus/shared/widgets/create_event/event_description.dart';

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
              children: const [
                Center(
                  child: Text(
                    'Criar evento presencial',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: CreateEventLocation(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: CreateBasicInformation(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: CreateEventDescription(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
