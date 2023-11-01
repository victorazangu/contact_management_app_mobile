import 'package:flutter/material.dart';

import '../utils/defaultValues.dart';

class AddContactToGroupForm extends StatefulWidget {
  @override
  _AddContactToGroupFormState createState() => _AddContactToGroupFormState();
}

class _AddContactToGroupFormState extends State<AddContactToGroupForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _contactController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 5),
            child: TextField(
              controller: _nameController,
              style: TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Contact Name',
                labelStyle: TextStyle(color: Colors.white),
                hintText: 'Enter contact name',
                hintStyle: TextStyle(color: Colors.white),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 5, top: 5),
            child: TextField(
              controller: _contactController,
              style: TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Contact',
                labelStyle: TextStyle(color: Colors.white),
                hintText: 'Enter contact information',
                hintStyle: TextStyle(color: Colors.white),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(height: 2.0),
          Container(
            padding: EdgeInsets.all(5),
            child: ElevatedButton(
              onPressed: () {
                final String name = _nameController.text;
                final String contact = _contactController.text;

                print('Name: $name');
                print('Name: $contact');

                _nameController.clear();
                _contactController.clear();
              },
              child: Text('Add Contact to group'),
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
}
