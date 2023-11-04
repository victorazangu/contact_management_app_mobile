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
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  widget.groupName,
                  style: ThemeStyling.bold_20,
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      DefaultValues.secondaryColor),
                ),
                onPressed: () async {
                  try {
                    var data = await _groupWebService.addContactToGroup(
                      widget.groupId,
                      widget.contact_id,
                    );
                    if (data != null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(data['message']),
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.green,
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Error. Please try again.'),
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  } catch (e, stackTrace) {
                    print('Error occurred: $e');
                    print('Stack trace: $stackTrace');
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
    );
  }
}
