// import 'package:contact_management_app_mobile/models/contact.dart';
// import 'package:flutter/material.dart';

// import '../../services/contact_service.dart';
// import 'contact_viewModel.dart';

// enum LoadingStatus { completed, searching, empty }

// class ContactProvider with ChangeNotifier {
//   LoadingStatus loadingStatus = LoadingStatus.empty;
//   List<ContactViewModel> contacts = <ContactViewModel>[];

//   void allContacts() async {
//     List<Contact> contact = await ContactWebService().fetchAllContacts();
//     print("contact inside provider $contact");
//     loadingStatus = LoadingStatus.searching;
//     notifyListeners();

//     contacts =
//         contact.map((contact) => ContactViewModel(contact: contact)).toList();

//     if (contacts.isEmpty) {
//       loadingStatus = LoadingStatus.empty;
//     } else {
//       loadingStatus = LoadingStatus.completed;
//     }

//     notifyListeners();
//   }
// }

import 'package:flutter/material.dart';
import 'package:contact_management_app_mobile/models/contact.dart';
import 'package:contact_management_app_mobile/services/contact_service.dart';
import 'contact_viewModel.dart';

enum LoadingStatus { completed, searching, empty }

class ContactProvider with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.empty;
  List<ContactViewModel> contacts = <ContactViewModel>[];

  void allContacts() async {
    try {
      List<Contact> contact = await ContactWebService().fetchAllContacts();
      loadingStatus = LoadingStatus.searching;

      contacts =
          contact.map((contact) => ContactViewModel(contact: contact)).toList();

      if (contacts.isEmpty) {
        loadingStatus = LoadingStatus.empty;
      } else {
        loadingStatus = LoadingStatus.completed;
      }

      notifyListeners();
    } catch (error) {
      print('Error fetching contacts: $error');
    }
  }
}
