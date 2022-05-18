import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:morpheus/models/event.dart';
import 'package:morpheus/modules/Events/event.dart';
import 'package:morpheus/providers/home/favorites_events.dart';
import 'package:morpheus/shared/themes/app_colors.dart';
import 'package:morpheus/shared/widgets/favorites/favorite_event_card.dart';
import 'package:morpheus/shared/widgets/skeleton/skeleton.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  final List<AppEvent> _favorites = [];
  bool _isLoading = true;

  Future<void> _refresh() async {
    try {
      var response = await http.get(
        Uri.parse('http://localhost:3000/favorites/'),
      );
      // setState(() {
      //   final value = List.from(jsonDecode(response.body));
      //   _favorites = value
      //       .map<AppEvent>(
      //         (e) => AppEvent(
      //           e['id'].toString(),
      //           e['name'],
      //           EventLocation(
      //             e['location']['latitude'],
      //             e['location']['longitude'],
      //           ),
      //           e['cover_url'],
      //           DateTime.now(),
      //           e['organizer_name'],
      //         ),
      //       )
      //       .toList();
      // });
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
      body: SafeArea(
        child: _isLoading
            ? Center(
                child: Wrap(
                  runSpacing: 10,
                  spacing: 10,
                  children: [
                    for (var i = 0; i < 4; i++)
                      Skeleton(
                        width: MediaQuery.of(context).size.width * 0.94,
                        height: 130,
                        radius: 20,
                      ),
                  ],
                ),
              )
            : Consumer<FavoritesAppEventsProvider>(
                builder: ((context, value, child) {
                  return RefreshIndicator(
                    color: AppColors.accent,
                    key: _refreshIndicatorKey,
                    onRefresh: _refresh,
                    child: value.events.isEmpty
                        ? ListView.builder(
                            itemCount: 1,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(
                                      'images/logo_only.png',
                                      height: 60,
                                      width: 90,
                                    ),
                                  ),
                                  const Text(
                                    'Nenhum evento favoritado',
                                    style: TextStyle(
                                      color: Color(0xffAEAA9E),
                                      fontFamily: 'Inter',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              );
                            },
                          )
                        : ListView.builder(
                            itemCount: value.events.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return DetailScreen(
                                          event: value.events[index],
                                        );
                                      },
                                    ),
                                  );
                                },
                                child: Hero(
                                  tag: value.events[index].id,
                                  child: FavoriteEventCard(
                                    event: value.events[index],
                                  ),
                                ),
                              );
                            },
                          ),
                  );
                }),
              ),
      ),
    );
  }
}
