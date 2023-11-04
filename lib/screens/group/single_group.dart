import "package:flutter/material.dart";

import "../../utils/defaultValues.dart";
import "../../viewmodels/groups/group_view_model.dart";
import "../contacts/contact_card.dart";
import "contact_list_on_group.dart";
import "group_card.dart";

class SingleGroupPage extends StatelessWidget {
  const SingleGroupPage({Key? key, required this.group}) : super(key: key);
  final GroupViewModel group;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: DefaultValues.mainPrimaryColor,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/default.png'),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            GroupCard(groupName: group?.name ?? 'No Group'),
            Text("My contacts"),
            Column(
              children: (group?.contacts ?? [])
                  .map((contact) => ContactCardGroup(
                        contact: contact.name,
                        contact_id: contact.id,
                        group_id: group.id,
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
