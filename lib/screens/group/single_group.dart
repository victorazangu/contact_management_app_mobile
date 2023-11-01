import "package:flutter/material.dart";

import "../../utils/defaultValues.dart";
import "../contacts/contact_card.dart";
import "group_card.dart";

class SingleGroupPage extends StatelessWidget {
  const SingleGroupPage({super.key});

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
            GroupCard(),
            Text("My contacts"),
            ContactCard(),
            ContactCard(),
            ContactCard(),
            ContactCard(),
          ],
        ),
      ),
    );
  }
}
