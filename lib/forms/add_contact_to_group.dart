import 'package:flutter/material.dart';

import '../services/group_service.dart';
import '../utils/defaultValues.dart';

class AddContactToGroupForm extends StatefulWidget {
  @override
  _AddContactToGroupFormState createState() => _AddContactToGroupFormState();
}

class _AddContactToGroupFormState extends State<AddContactToGroupForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final GroupWebService _groupWebService = GroupWebService();
  final List<String> list = <String>[
    'Group One',
    'Group Two',
    'Group Three',
    'Group Four'
  ];
  String dropdownValue = 'Group One';
  int group_id = 1;
  int contact_id = 0;

  @override
  void initState() {
    super.initState();
  }

  void _submitForm() async {
    _nameController.clear();
    _contactController.clear();

    try {
      await _groupWebService.addContactToGroup(contact_id, group_id);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Contact added'),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      print("Error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error. Please try again.'),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: double.infinity,
            child: Text(
              "Select Group",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          SizedBox(height: 10.0),
          Container(
            width: double.infinity,
            child: DropdownButton<String>(
              value: dropdownValue,
              onChanged: (String? value) {
                setState(() {
                  dropdownValue = value!;
                  group_id = getGroupIdFromName(value);
                });
              },
              items: list.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          SizedBox(height: 10.0),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(5),
            child: ElevatedButton(
              onPressed: _submitForm,
              child: Text('Add Contact to Group'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    DefaultValues.mainBackgroundColor),
              ),
            ),
          ),
        ],
      ),
    );
  }

  int getGroupIdFromName(String groupName) {
    if (groupName == 'Group One') {
      return 1;
    } else if (groupName == 'Group Two') {
      return 2;
    } else if (groupName == 'Group Three') {
      return 3;
    } else if (groupName == 'Group Four') {
      return 4;
    }

    return 0;
  }
}
