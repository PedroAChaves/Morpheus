class Ticket {
  final String id;
  final String eventId;
  final String ticketOptionId;
  final String ticketLotId;
  final double price;
  Ticket(
    this.id,
    this.eventId,
    this.ticketLotId,
    this.ticketOptionId,
    this.price,
  );
}
