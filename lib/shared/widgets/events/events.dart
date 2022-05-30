import 'package:flutter/material.dart';
import 'package:morpheus/models/event.dart';
import 'package:morpheus/providers/home/favorites_events.dart';
import 'package:morpheus/shared/themes/app_colors.dart';
import 'package:morpheus/shared/widgets/skeleton/skeleton.dart';
import 'package:provider/provider.dart';

class EventCard extends StatefulWidget {
  final AppEvent event;

  const EventCard({Key? key, required this.event}) : super(key: key);

  @override
  _EventCardState createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  late FavoritesAppEventsProvider favorites;

  @override
  Widget build(BuildContext context) {
    favorites = Provider.of<FavoritesAppEventsProvider>(context);

    return Container(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.001),
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.99,
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Card(
        color: Colors.white,
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            SizedBox(
              height: 120,
              width: double.infinity,
              child: Image.network(
                widget.event.coverUrl,
                fit: BoxFit.fill,
                loadingBuilder: (
                  BuildContext build,
                  Widget child,
                  ImageChunkEvent? loader,
                ) {
                  if (loader == null) {
                    return child;
                  }
                  return const Skeleton(height: 120, width: double.infinity);
                },
              ),
            ),
            Container(
              height: 80,
              padding: const EdgeInsets.only(right: 10.0, left: 10.0, top: 14),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          widget.event.name,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Flexible(
                        child: Text(
                          widget.event.startDateTime.day.toString(),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          widget.event.organizer.name,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      IconButton(
                        onPressed: () => favorites.save(widget.event),
                        icon: Icon(
                          favorites.events.contains(widget.event)
                              ? Icons.star
                              : Icons.star_border,
                          color: AppColors.accent,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
