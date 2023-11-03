import 'package:flutter/material.dart';

import '../services/group_service.dart';
import '../utils/defaultValues.dart';

class CreateGroupForm extends StatefulWidget {
  @override
  _CreateGroupFormState createState() => _CreateGroupFormState();
}

class _CreateGroupFormState extends State<CreateGroupForm> {
  final TextEditingController _nameController = TextEditingController();
  final GroupWebService _groupWebService = GroupWebService();

  @override
  void dispose() {
    _nameController.dispose();

    super.dispose();
  }

  void _submitForm() async {
    final String name = _nameController.text;

    _nameController.clear();

    try {
 
      await _groupWebService.createGroup({"name": name});
    } catch (e) {
      print("Error: $e");
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
            margin: EdgeInsets.only(bottom: 5),
            child: TextField(
              controller: _nameController,
              style: TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Group Name',
                labelStyle: TextStyle(color: Colors.white),
                hintText: 'Enter group name',
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
              onPressed: _submitForm,
              child: Text('Add group'),
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
