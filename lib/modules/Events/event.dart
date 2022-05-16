import 'package:flutter/material.dart';
import 'package:morpheus/models/event.dart';

class DetailScreen extends StatelessWidget {
  final AppEvent event;
  const DetailScreen({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
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
                  TextButton(onPressed: () {}, child: const Text('asfaef'))
                ],
              ),
              Text(event.id),
              Text(event.name),
              Text(event.organizerName),
            ],
          ),
        ),
      ),
    );
  }
}
