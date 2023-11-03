import 'package:contact_management_app_mobile/models/user.dart';

class Group {
  final int id;
  final String name;
  final int user_id;
  final String created_at;
  final List<ContactG> contacts;
  final User? user;

  Group({
    required this.id,
    required this.name,
    required this.user_id,
    required this.created_at,
    required this.contacts,
    required this.user,
  });

  factory Group.fromJson(Map<String, dynamic> json) {
    final List<dynamic> contactList = json['contacts'] ?? [];
    final List<ContactG> contacts = contactList
        .map((contactJson) => ContactG.fromJson(contactJson))
        .toList();

    return Group(
      id: json['id'] as int ?? 0,
      name: json['name'] ?? '',
      user_id: json['user_id'] ?? 0,
      created_at: json['created_at'] ?? '',
      contacts: contacts,
      user: json['user'] != null ? User.fromJson(json['user']) : null,
    );
  }
}

class ContactG {
  final int id;
  final String name;
  final String contact;
  final String image;
  final String created_at;
  final List<Group> groups;
  final User? user;

  ContactG({
    required this.id,
    required this.name,
    required this.contact,
    required this.image,
    required this.created_at,
    required this.groups,
    required this.user,
  });

  factory ContactG.fromJson(Map<String, dynamic> json) {
    final List<dynamic> groupList = json['groups'] ?? [];
    final List<Group> groups =
        groupList.map((groupJson) => Group.fromJson(groupJson)).toList();

    return ContactG(
      id: json['id'] as int ?? 0,
      name: json['name'] ?? '',
      contact: json['contact'] ?? '',
      image: json['image'] ?? '',
      created_at: json['created_at'] ?? '',
      groups: groups,
      user: json['user'] != null ? User.fromJson(json['user']) : null,
    );
  }
}
