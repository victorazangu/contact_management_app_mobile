import 'group.dart';
import 'user.dart';

class Contact {
  final int id;
  final String name;
  final String contact;
  final String image;
  final String created_at;
  final List<Group>? groups;
  final User? user;

  Contact({
    required this.id,
    required this.name,
    required this.contact,
    required this.image,
    required this.created_at,
    this.groups,
    this.user,
  });

  factory Contact.fromJson(Map<String, dynamic> json) {
    final List<dynamic> groupList = json['groups'];
    final List<Group> groups = (groupList != [])
        ? groupList.map((group) => Group.fromJson(group)).toList()
        : <Group>[];

    return Contact(
      id: json['id'],
      name: json['name'],
      contact: json['contact'],
      image: json['image'],
      created_at: json['created_at'],
      groups: groups,
      user: User.fromJson(json['user']),
    );
  }
}
