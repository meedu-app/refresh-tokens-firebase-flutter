import 'package:meta/meta.dart' show required;

class AppUser {
  final String id, username, email;
  final DateTime createdAt;

  AppUser({
    @required this.id,
    @required this.username,
    @required this.email,
    @required this.createdAt,
  });

  static AppUser fromJson(Map<String, dynamic> json) {
    return AppUser(
      id: json['_id'],
      username: json['username'],
      email: json['email'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}
