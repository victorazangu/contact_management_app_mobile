import "package:contact_management_app_mobile/screens/group/single_group.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "../../forms/Create_group.dart";
import "../../utils/defaultValues.dart";
import "../../viewmodels/groups/group_provider.dart";
import "group_card.dart";

class Group extends StatefulWidget {
  const Group({super.key});

  @override
  State<Group> createState() => _GroupState();
}

class _GroupState extends State<Group> {
  @override
  void initState() {
    super.initState();
    Provider.of<GroupListViewModel>(context, listen: false).allGroups();
  }

  @override
  Widget build(BuildContext context) {
    var list = Provider.of<GroupListViewModel>(context);
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
        ),
        Expanded(
          child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: list.groups.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SingleGroupPage(
                                group: list.groups[index],
                              )),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 10, bottom: 10),
                    child: GroupCard(groupName: list.groups[index].name),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
