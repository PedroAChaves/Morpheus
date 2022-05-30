import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:morpheus/models/event.dart';
import 'package:morpheus/modules/Events/event.dart';
import 'package:morpheus/shared/themes/app_colors.dart';
import 'package:morpheus/shared/widgets/events/events.dart';
import 'package:morpheus/shared/widgets/skeleton/skeleton.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  List<AppEvent> _events = [];
  bool _isLoading = true;

  Future<void> _refresh() async {
    try {
      var response = await http.get(Uri.parse('http://localhost:3000/events/'));
      setState(() {
        final value = List.from(jsonDecode(response.body));
        _events = value.map<AppEvent>((e) => AppEvent.fromJson(e)).toList();
      });
    } catch (err) {
      print(err);
    }
    setState(() => _isLoading = false);
  }

  @override
  void initState() {
    super.initState();
    _refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _isLoading
          ? Center(
              child: Wrap(
                runSpacing: 10,
                spacing: 10,
                children: [
                  for (var i = 0; i < 6; i++)
                    const Skeleton(
                      width: 180,
                      height: 250,
                      radius: 20,
                    ),
                ],
              ),
            )
          : RefreshIndicator(
              onRefresh: _refresh,
              key: _refreshIndicatorKey,
              color: AppColors.primary,
              child: GridView.builder(
                itemCount: _events.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 360,
                  mainAxisExtent: 210,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return DetailScreen(event: _events[index]);
                          },
                        ),
                      );
                    },
                    child: Hero(
                      tag: _events[index].id,
                      child: EventCard(
                        event: _events[index],
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
