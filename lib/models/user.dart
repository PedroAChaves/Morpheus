import 'dart:html';

class User {
  final String name;
  final String email;
  final double document;
  final DateTime birth_date;
  final Url avatar_url;
  User(
    this.avatar_url,
    this.birth_date,
    this.document,
    this.email,
    this.name,
  );
}
