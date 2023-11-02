import "package:contact_management_app_mobile/screens/group/single_group.dart";
import "package:flutter/material.dart";

import "../../forms/Create_group.dart";
import "../../utils/defaultValues.dart";
import "group_card.dart";

class Group extends StatelessWidget {
  const Group({super.key});

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
                      color: DefaultValues.mainPrimaryColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
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
                          CreateGroupForm(),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
        Expanded(
          child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: 6,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SingleGroupPage()),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 10, bottom: 10),
                    child: GroupCard(),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
