import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "../../forms/create_contact.dart";
import "../../services/contact_service.dart";
import "../../utils/defaultValues.dart";
import "../../viewmodels/contacts/contact_provider.dart";
import "contact_card.dart";

class Contacts extends StatefulWidget {
  const Contacts({super.key});

  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  @override
  void initState() {
    super.initState();
    Provider.of<ContactProvider>(context, listen: false).allContacts();
  }

  final ContactWebService _contactWebService = ContactWebService();

  @override
  Widget build(BuildContext context) {
    var contactProvider = Provider.of<ContactProvider>(context);
    var contacts = contactProvider.contacts;
    print("bad habit $contacts");
    var badHabbit = _contactWebService.fetchAllContacts();

    print("bad habit $badHabbit");
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/default.png'),
              ),
              IconButton(
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 25,
                ),
                onPressed: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return SingleChildScrollView(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          color: DefaultValues.mainPrimaryColorDarker,
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.close),
                                    color: Colors.white,
                                    onPressed: () => Navigator.pop(context),
                                  )
                                ],
                              ),
                              CreateContactForm(),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: contacts.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  child: ContactCard(),
                );
              }),
        ),
      ],
    );
  }
}
