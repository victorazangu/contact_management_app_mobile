import "package:flutter/material.dart";

import "../../forms/create_contact.dart";
import "../../utils/defaultValues.dart";
import "contact_card.dart";

class Contacts extends StatelessWidget {
  const Contacts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
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
                    return Container(
                      padding: EdgeInsets.all(20),
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
                    );
                  },
                );
              },
            ),
          ],
        ),
        Container(
          height: 500,
          child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: 6,
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
