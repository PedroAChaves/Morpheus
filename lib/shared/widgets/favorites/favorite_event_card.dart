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
                      Text(widget.event.startDatetime.toString()),
                      Text(widget.event.name),
                      Text(widget.event.organizerName)
                    ],
                  ),
                ),
                IconButton(
                    onPressed: () =>
                        setState(() => favorites.remove(widget.event)),
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
