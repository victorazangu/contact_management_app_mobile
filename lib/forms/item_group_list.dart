import 'package:flutter/material.dart';

import '../services/group_service.dart';
import '../utils/defaultValues.dart';
import '../utils/styles.dart';

class GroupItem extends StatefulWidget {
  final String groupName;
  final int groupId;
  final int contact_id;

  GroupItem({
    required this.groupName,
    required this.groupId,
    required this.contact_id,
  });

  @override
  State<GroupItem> createState() => _GroupItemState();
}

class _GroupItemState extends State<GroupItem> {
  final GroupWebService _groupWebService = GroupWebService();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Group : ${widget.groupName}',
                  style: ThemeStyling.bold_20,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        DefaultValues.secondaryColor),
                  ),
                  onPressed: () async {
                    print('Updating contact group with ID: ${widget.groupId}');
                    print('Updating contact with ID: ${widget.contact_id}');

                    try {
                      var userData = await _groupWebService.addContactToGroup(
                        widget.groupId,
                        widget.contact_id,
                      );
                      print("group data $userData");
                      if (userData != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Added to group '),
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.green,
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Error. Please try again.'),
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    } catch (e) {
                      print('Error occurred: $e');
                    }
                  },
                  child: Text(
                    'Add to this Group',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
