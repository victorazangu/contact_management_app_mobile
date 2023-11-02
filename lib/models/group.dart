import 'package:contact_management_app_mobile/models/user.dart';

import 'contact.dart';

class Group {
  final int id;
  final String name;
  final int user_id;
  final String created_at;
  final List<Contact> contacts;
  final User user;

  Group({
    required this.id,
    required this.name,
    required this.user_id,
    required this.created_at,
    required this.contacts,
    required this.user,
  });

  factory Group.fromJson(Map<String, dynamic> json) {
    final List<dynamic> contactList = json['contacts'];
    final List<Contact> contacts =
        contactList.map((contact) => Contact.fromJson(contact)).toList();

    return Group(
      id: json['id'],
      name: json['name'],
      user_id: json['user_id'],
      created_at: json['created_at'],
      contacts: contacts,
      user: User.fromJson(json['user']),
    );
  }
}
