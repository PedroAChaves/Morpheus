class AppUser {
  String name;
  String email;
  String document;
  DateTime birth_date;
  String avatar_url;
  AppUser(
    this.avatar_url,
    this.birth_date,
    this.document,
    this.email,
    this.name,
  );

  AppUser.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'],
        document = json['document'],
        avatar_url = json['avatar_url'],
        birth_date = json['birth_date'];
}
