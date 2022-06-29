import 'package:flutter/material.dart';
import 'package:morpheus/models/event.dart';
import 'package:morpheus/providers/home/favorites_events.dart';
import 'package:morpheus/shared/themes/app_colors.dart';
import 'package:provider/provider.dart';

class FavoriteEventCard extends StatefulWidget {
  final AppEvent event;

  const FavoriteEventCard({Key? key, required this.event}) : super(key: key);

  @override
  _FavoriteEventCardState createState() => _FavoriteEventCardState();
}

class _FavoriteEventCardState extends State<FavoriteEventCard> {
  late FavoritesAppEventsProvider favorites;

  @override
  Widget build(BuildContext context) {
    favorites = Provider.of<FavoritesAppEventsProvider>(context);

    return Container(
      height: 250,
      padding: EdgeInsets.all(MediaQuery.of(context).size.width -
          MediaQuery.of(context).size.width * 0.98),
      constraints:
          BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.98),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 5,
            offset: const Offset(10, 2),
          ),
        ],
      ),
      child: Card(
        color: AppColors.light,
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          textDirection: TextDirection.ltr,
          children: [
            Image.network(
              widget.event.coverUrl,
              fit: BoxFit.cover,
              height: 160,
              width: double.infinity,
            ),
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    textDirection: TextDirection.ltr,
                    children: [
                      Text(widget.event.startDateTime.toString()),
                      Text(widget.event.name),
                      Text(widget.event.organizer.name)
                    ],
                  ),
                ),
                IconButton(
                    onPressed: () {
                      favorites.remove(widget.event);
                      final snackBar = SnackBar(
                        content: const Text('Evento removido dos favoritos'),
                        action: SnackBarAction(
                          label: 'Desfazer',
                          onPressed: () => favorites.save(widget.event),
                        ),
                      );

                      // Find the ScaffoldMessenger in the widget tree
                      // and use it to show a SnackBar.
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    icon: Icon(
                      favorites.events.contains(widget.event)
                          ? Icons.star
                          : Icons.star_border,
                      color: AppColors.accent,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
