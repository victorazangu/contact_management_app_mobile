import 'package:flutter/material.dart';

import '../utils/defaultValues.dart';

class CreateGroupForm extends StatefulWidget {
  @override
  _CreateGroupFormState createState() => _CreateGroupFormState();
}

class _CreateGroupFormState extends State<CreateGroupForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _contactController.dispose();
    _imageController.dispose();
    _descriptionController.dispose();
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
          Container(
            margin: EdgeInsets.only(bottom: 5, top: 5),
            child: TextField(
              controller: _imageController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Image URL',
                labelStyle: TextStyle(color: Colors.white),
                hintText: 'Enter image URL',
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
              controller: _descriptionController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Description',
                labelStyle: TextStyle(color: Colors.white),
                hintText: 'Enter description',
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
                final String image = _imageController.text;
                final String description = _descriptionController.text;
                print('Name: $name');
                print('Name: $contact');
                print('Image: $image');
                print('Description: $description');

                _nameController.clear();
                _contactController.clear();
                _imageController.clear();
                _descriptionController.clear();
              },
              child: Text('Add Contact'),
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
