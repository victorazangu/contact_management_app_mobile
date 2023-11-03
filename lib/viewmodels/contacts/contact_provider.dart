import 'package:flutter/material.dart';
import '../../models/contact.dart';
import '../../services/contact_service.dart';
import 'contact_viewModel.dart';

enum LoadingStatus { completed, searching, empty }

class ContactListViewModel with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.empty;
  List<ContactViewModel> contacts = <ContactViewModel>[];

  void allContacts() async {
    List<Contact> contact = await ContactWebService().fetchAllContacts();
    loadingStatus = LoadingStatus.searching;
    notifyListeners();

    contacts =
        contact.map((contact) => ContactViewModel(contact: contact)).toList();

    if (contacts.isEmpty) {
      loadingStatus = LoadingStatus.empty;
    } else {
      loadingStatus = LoadingStatus.completed;
    }

    notifyListeners();
  }
}
