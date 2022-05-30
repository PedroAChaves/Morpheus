class AppEvent {
  final String id;
  final String coverUrl;
  final DateTime startDateTime;
  final DateTime endDateTime;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Organizer organizer;
  final String description;
  final int ageGroup;
  final String name;
  final EventLocation location;
  final Subject subject;
  final Category category;
  final EventStatus status;
  final List<TicketOption> ticketOptions;
  AppEvent(
    this.id,
    this.name,
    this.location,
    this.coverUrl,
    this.startDateTime,
    this.endDateTime,
    this.organizer,
    this.ticketOptions,
    this.subject,
    this.category,
    this.createdAt,
    this.updatedAt,
    this.description,
    this.ageGroup,
    this.status,
  );

  AppEvent.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        coverUrl = json['cover_url'],
        ageGroup = json['age_group'],
        description = json['description'],
        status = EventStatus.values.firstWhere(
            (e) => e.toString() == 'EventStatus.' + json['status'].toString()),
        category = Category.fromJson(json['category']),
        subject = Subject.fromJson(json['subject']),
        createdAt = DateTime.parse(json['created_at']),
        endDateTime = DateTime.parse(json['end_datetime']),
        startDateTime = DateTime.parse(json['start_datetime']),
        location = EventLocation.fromJson(json['location']),
        organizer = Organizer.fromJson(json['organizer']),
        ticketOptions = [],
        updatedAt = DateTime.parse(json['updated_at']);
}

enum EventStatus { available, soldOut, canceled, finished }

class Category {
  final String id;
  final String name;

  Category(this.id, this.name);

  Category.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'];
}

class Organizer {
  final String id;
  final String name;

  Organizer(this.id, this.name);

  Organizer.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'];
}

class Subject {
  final String id;
  final String name;

  Subject(this.id, this.name);

  Subject.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'];
}

class TicketOption {
  final String id;
  final String eventId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String title;
  final String description;
  final DateTime salesStartDateTime;
  final DateTime salesEndDateTime;
  final int maximumBuysQuantity;
  final int minimumBuysQuantity;
  final List<TicketOptionLot> lots;

  TicketOption(
    this.id,
    this.eventId,
    this.title,
    this.description,
    this.salesStartDateTime,
    this.salesEndDateTime,
    this.maximumBuysQuantity,
    this.minimumBuysQuantity,
    this.lots,
    this.createdAt,
    this.updatedAt,
  );
}

class TicketOptionLot {
  final String id;
  final int number;
  final double price;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String ticketOptionId;
  final int totalQuantity;
  final int remainingQuantity;

  TicketOptionLot(
    this.id,
    this.number,
    this.price,
    this.ticketOptionId,
    this.totalQuantity,
    this.remainingQuantity,
    this.createdAt,
    this.updatedAt,
  );
}

class EventLocation {
  final String id;
  final String eventId;
  final String street;
  final String district;
  final String state;
  final String city;
  final int number;
  final String description;
  final String postalCode;
  final DateTime createdAt;
  final DateTime updatedAt;
  final double latitude;
  final double longitude;
  EventLocation(
    this.latitude,
    this.longitude,
    this.id,
    this.eventId,
    this.street,
    this.district,
    this.state,
    this.city,
    this.number,
    this.description,
    this.postalCode,
    this.createdAt,
    this.updatedAt,
  );

  EventLocation.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        city = json['city'],
        state = json['state'],
        district = json['district'],
        description = json['description'],
        number = json['number'],
        latitude = json['latitude'],
        createdAt = DateTime.parse(json['created_at']),
        longitude = json['longitude'],
        eventId = json['event_id'],
        street = json['street'],
        postalCode = json['postal_code'],
        updatedAt = DateTime.parse(json['updated_at']);
}
