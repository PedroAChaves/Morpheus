import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:morpheus/models/event.dart';
import 'package:morpheus/providers/search/nearby_events.dart';
import 'package:morpheus/providers/search/selected_event.dart';
import 'package:provider/provider.dart';

class SearchMap extends StatefulWidget {
  @override
  State<SearchMap> createState() => SearchMapState();
  const SearchMap({Key? key}) : super(key: key);
}

class SearchMapState extends State<SearchMap> {
  late SelectedEventProvider selectedEvent;

  Iterable<Marker> _createMarkers(List<AppEvent> events) {
    return events.map(
      (e) => Marker(
        infoWindow: InfoWindow(title: e.name),
        onTap: () => selectedEvent.setValue(e),
        markerId: MarkerId(e.id.toString()),
        position: LatLng(
          e.location.latitude,
          e.location.longitude,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    selectedEvent = Provider.of<SelectedEventProvider>(context);

    return Consumer<NearbyEventsProvider>(
      builder: ((context, value, child) {
        return GoogleMap(
          markers: Set<Marker>.of(_createMarkers(value.events)),
          mapType: MapType.normal,
          initialCameraPosition: const CameraPosition(
            target: LatLng(-23.168630524718026, -46.868967544506795),
            zoom: 13,
          ),
        );
      }),
    );
  }
}
