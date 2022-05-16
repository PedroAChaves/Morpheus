class AppEvent {
  final String id;
  final String coverUrl;
  final DateTime startDatetime;
  final String organizerName;
  final String name;
  final EventLocation location;
  AppEvent(this.id, this.name, this.location, this.coverUrl,this.startDatetime,this.organizerName);
}

class EventLocation {
  final double latitude;
  final double longitude;
  EventLocation(this.latitude, this.longitude);
}
