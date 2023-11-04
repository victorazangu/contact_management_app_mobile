import "package:contact_management_app_mobile/utils/styles.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "../../forms/item_group_list.dart";
import "../../utils/defaultValues.dart";
import "../../viewmodels/groups/group_provider.dart";

class ContactCard extends StatefulWidget {
  final String contact;
  final int contact_id;
  // final int groupId;

  ContactCard({
    Key? key,
    required this.contact,
    required this.contact_id,
  }) : super(key: key);

  @override
  State<ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<ContactCard> {
  @override
  void initState() {
    super.initState();
    Provider.of<GroupListViewModel>(context, listen: false).allGroups();
  }

  @override
  Widget build(BuildContext context) {
    var groupList = Provider.of<GroupListViewModel>(context);
    return Container(
      padding: EdgeInsets.all(10),
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: DefaultValues.mainPrimaryColor,
        image: DecorationImage(
          image: AssetImage('assets/images/bg.jpg'),
          fit: BoxFit.fill,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipOval(
            child: Image.asset(
              'assets/images/default.png',
              height: 40,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: DefaultValues.mainPrimaryColor,
            ),
            child: Padding(
              // Remove the `const` keyword
              padding: EdgeInsets.all(5.0),
              child: Row(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.phone,
                        size: 30,
                        color: DefaultValues.mainBackgroundColor,
                      ),
                      SizedBox(width: 5),
                      Text(widget.contact, style: ThemeStyling.regular_14),
                    ],
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              showModalBottomSheet<void>(
                context: context,
                backgroundColor: DefaultValues.mainPrimaryColor,
                builder: (BuildContext context) {
                  return ListView.builder(
                    itemCount: groupList.groups.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        child: GroupItem(
                          groupName: groupList.groups[index].name,
                          groupId: groupList.groups[index].id,
                          contact_id: widget.contact_id,
                        ),
                      );
                    },
                  );
                },
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: DefaultValues.mainPrimaryColor,
              ),
              child: const Padding(
                padding: EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.add,
                          size: 30,
                          color: DefaultValues.mainBackgroundColor,
                        ),
                        SizedBox(width: 5),
                        Text("to group", style: ThemeStyling.regular_14),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
