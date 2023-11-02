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

// class Project {

//   final int id;
//   final String name;
//   final int user_id;
//   final String created_at;
//   final List<Contact> contacts;
//   final User user;
 

// Project({
//     required this.project_id,
//     required this.project_name,
//     required this.owner,
//     required this.location,
//     required this.completion,
//     required this.type,
//     required this.stakeholders,
//     required this.recurrent,
//     required this.description,
//     required this.start_date,
//     required this.end_date,
//     required this.phases,
//     required this.recurrent_cost,
//     required this.updatedAt,
//     required this.property,
//   });
  
  
//   factory Project.fromJson(Map<String, dynamic> json) {
//     return Project(
//         project_id: json['project_id'],
//         project_name: json['project_name'],
//         owner: json['owner'],
//         location: json['location'],
//         completion: json['completion'],
//         type: json['type'],
//         stakeholders: json['stakeholders'],
//         recurrent: json['recurrent'],
//         description: json['description'],
//         start_date: json['start_date'],
//         end_date: json['end_date'],
//         phases: json['phases'],
//         property: Property.fromJson(json['property']),
//         recurrent_cost: json['recurrent_cost'],
//         updatedAt: json['updatedAt']);
//   }
// }