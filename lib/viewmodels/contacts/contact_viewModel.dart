// import 'package:contact_management_app_mobile/models/user.dart';

// import '../../models/contact.dart';

// class ContactViewModel {
//   final Contact _contact;

//   ContactViewModel({required Contact contact}) : _contact = contact;

//   int get id {
//     return _contact.id;
//   }

//   String get name {
//     return _contact.name;
//   }

//   String get contact {
//     return _contact.contact;
//   }

//   String get image {
//     return _contact.image;
//   }

//   User get user {
//     return _contact.user;
//   }

//   String get created_at {
//     return _contact.created_at;
//   }
// }

import 'package:contact_management_app_mobile/models/contact.dart';

import '../../models/user.dart';

class ContactViewModel {
  final Contact _contact;

  ContactViewModel({required Contact contact}) : _contact = contact;

  int get id => _contact.id;

  String get name => _contact.name;

  String get contact => _contact.contact;

  String get image => _contact.image;

  User? get user => _contact.user;
  List<dynamic>? get groups => _contact.groups;

  String get created_at => _contact.created_at;
}
